package session

import "time"

type Session struct {
	attributes map[interface{}]interface{}
	sid        string
	lastAccess time.Time
	//在cookie中保存的sessionid名称
	cookieAttrName  string
}
//设置session属性
func (s Session) Set(key,value interface{}) error {
	s.attributes[key]=value
	return nil
}
//根据key获取session属性值
func (s Session) Get(key interface{}) interface{} {
	return s.attributes[key]
}
//获取sid
func (s Session) SID() string {
	return s.sid
}
//更新最后访问时间
func (s Session) updateAccessTime() {
	s.lastAccess=time.Now()
}