package main

import (
	"net/http"
	"sessiondemo/session"
	"fmt"
	"html/template"
	"database/sql"
	"errors"
	_ "github.com/go-sql-driver/mysql"
	"sessiondemo/model"
	"log"
)

var sessionManager *session.Manager

func init() {
	sessionManager = session.NewManager()
}
func main() {
	http.HandleFunc("/index", index)
	http.HandleFunc("/login", login)
	fmt.Print("server started, listening at localhost:8080\n")
	http.ListenAndServe(":8080", nil)
}
func index(w http.ResponseWriter, r *http.Request) {
	log.Print("index called\n")
	cookie, err := r.Cookie(session.COOKIESESSIONIDNAME)
	for str,session :=range sessionManager.SessionPool() {
		fmt.Printf("sid:%s",str,"session:%v",session)
	}
	var result = model.Result{}
	if err == nil && cookie.Value != "" {
		session := sessionManager.GetSession(cookie.Value)
		if session != nil {
			fmt.Printf("username:%s\n", session.Get("username"))
			result.Data = session.Get("username").(string)
		}
	}
	t, err := template.ParseFiles("index.tpl")
	if err != nil {
		errors.New("errors occured")
	}
	t.Execute(w, result)
}

/**
登录时
post请求：
	如果cookie为空，创建session，设置cookie，并返回index.tpl
	如果cookie不为空，
get请求：
	如果cookie为空，返回login.tpl
	如果cookie不为空且存在匹配的session，返回index.tpl
	如果cookie不为空且不存在匹配的session，返回login.tpl
 */
func login(w http.ResponseWriter, r *http.Request) {
	fmt.Print("login has been called\n")
	if r.Method == "POST" {
		r.ParseForm()
		//从cookie池获取gosessionid，如果不存在，报错errors.New("http: named cookie not present")
		cookie, err := r.Cookie(session.COOKIESESSIONIDNAME)

		//如果cookie为空
		if err != nil || cookie.Value == "" {
			//获得表单数据
			username := r.Form.Get("username")
			password := r.Form.Get("password")

			//数据库连接
			db, e := sql.Open("mysql", "root:123456@tcp(localhost)/blog?charset=utf8")
			defer db.Close()
			if e != nil {
				fmt.Printf("error occured:%v\n", err)
				http.Error(w, "db connection failed\n", 500)
				return
			}

			//数据库查询
			rows, e := db.Query("select * from user where username=? and password=?", username, password)
			if e != nil {
				w.Write([]byte("query failed\n"))
				http.NotFound(w, r)
				return
			}

			//遍历查询结果，每次Scan之前都要执行Next
			for rows.Next() {
				var id int
				var username string
				var password string
				var nick_name string
				err := rows.Scan(&id, &username, &password, &nick_name)
				if err != nil {
					fmt.Print(err)
				}
				fmt.Printf("id:%d,usernmae:%s,password:%s,nick_name:%s", id, username, password, nick_name)
			}
			//如果sessionid为空
			s := sessionManager.NewSession()
			s.Set("username", username)
			sessionManager.SessionPool()[s.SID()]=s
			//创建cookie
			cookie = &http.Cookie{Name: session.COOKIESESSIONIDNAME, Value: s.SID()}
			http.SetCookie(w, cookie)
			http.Redirect(w,r,"/index",302)
		} else {
			s := sessionManager.GetSession(cookie.Value)
			if s != nil {
				username := s.Get("username")
				t, err := template.ParseFiles("index.tpl")
				if err != nil {
					w.Write([]byte("no file mapped for path:" + r.RequestURI))
					return
				}
				t.Execute(w, username)
				return
			}
			t, err := template.ParseFiles("login.tpl")
			if err != nil {
				w.Write([]byte("login page not found!\n"))
				t.Execute(w, nil)
			}

		}

	} else {
		if cookie, _ := r.Cookie(session.COOKIESESSIONIDNAME); cookie != nil && cookie.Value != "" {
			http.Redirect(w, r, "/index",http.StatusFound)
			return
		}
		t, err := template.ParseFiles("login.tpl")
		if err != nil {
			w.Write([]byte("login page not found"))
			return
		}
		t.Execute(w, nil)
	}
}
