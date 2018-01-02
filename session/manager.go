package session

import (
	"sync"
	"sessiondemo/uuid"
	"time"
)

const DEFAULTMAI int64=108000
const COOKIESESSIONIDNAME="GOSESSIONID"
type Manager struct {
	lock        sync.Mutex
	sessionPool map[string]*Session
	//最大活动间隔
	maxActiveInterval int64
}

func (m Manager) GetSession(sid string) *Session {
	return m.sessionPool[sid]
}

func NewManager() (manager *Manager) {
	return &Manager{maxActiveInterval:DEFAULTMAI,sessionPool:make(map[string]*Session)}
}
func (m Manager) NewSession() (session *Session) {
	//加锁保证多线程线程安全
	m.lock.Lock()
	defer m.lock.Unlock()
	//生成唯一sessionid
	sid := uuid.Rand().Hex()
	//创建session
	session=&Session{sid:sid,lastAccess:time.Now(),attributes:make(map[interface{}]interface{})}
	//将session添加到session池中
	m.sessionPool[sid]=session
	return
}
func (m Manager) SessionPool() (map[string]*Session){
	return m.sessionPool
}