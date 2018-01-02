<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>追影子的人</title>
    <link rel="stylesheet" href="/static/css/normalize.css">
    <link rel="stylesheet" href="/static/css/index.css">
</head>
<body>
<div class="hair"><p>欢迎访问，{{if .}}请<a href="/login">登录</a>{{else}}{{.}}{{end}}</p></div>
<div class="header">
    <div class="navbar">
        <div class="logo"><a href="">追影子的人</a></div>
        <ul>
            <li><a href="/file">归档</a></li>
            <li><a href="/leave_message">留言</a></li>
            <li><a href="/about">关于我</a></li>
            <menu class="menu"></menu>
        </ul>
    </div>
    <div id="banner">
        <div class="inner">
            <div class="hr"></div>
            <h2>装逼之王</h2>
            <div class="hr"></div>
            <p class="inner_inf">爱装逼的孩子都是好孩子</p>
            <button>了解我</button>
            <div class="more">更多</div>
            <div class="more-ico"></div>
        </div>
    </div>
</div>
<section class="section-4" id="green-section">
    <div class="wrapper">
        <div>
            <h2>萌即正义</h2>
            <div class="hr"></div>
            <p class="sub_heading">千贯卖汝痴，万贯卖汝呆。现卖尽多送，要赊随我来。
            </p>
        </div>
        <div class="icon-group">
            <span class="rotate">item</span>
            <span class="rotate">item</span>
            <span class="rotate">item</span>
        </div>
    </div>
</section>
<section class="section-3">
    <div class="article-preview">
        <div class="img-section">
            <img src="static/img/pic01.jpg"/>
        </div>
        <div class="text-section">
            <h3>又一个标题</h3>
            <div class="sub_heading">又一个子标题</div>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet dolores eveniet nisi reprehenderit
                similique suscipit tempore.</p>
        </div>
    </div>
    <div class="article-preview">
        <div class="text-section">
            <h3>又一个标题</h3>
            <div class="sub_heading">又一个子标题</div>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet dolores eveniet nisi reprehenderit
                similique suscipit tempore.</p>
        </div>
        <div class="img-section">
            <img src="static/img/pic02.jpg"/>
        </div>
    </div>
    <div class="article-preview">
        <div class="img-section">
            <img src="static/img/pic03.jpg"/>
        </div>
        <div class="text-section">
            <h3>又一个标题</h3>
            <div class="sub_heading">又一个子标题</div>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet dolores eveniet nisi reprehenderit
                similique suscipit tempore.</p>
        </div>
    </div>
</section>
<section class="section-2">
    <div class="heading-wrapper">
        <h2 class="heading">
            又一个标题
        </h2>
        <div class="hr"></div>
        <div class="sub-heading">Lorem ipsum dolor sit amet, consectetur adipisicing elit. A accusamus atque aut commodi consequatur consequuntur, cupiditate deserunt doloribus error expedita facilis inventore nihil odit pariatur porro qui quis repellat unde.</div>
    </div>
    <div class="card-group">
        <div class="card">
            <h3>文章标题</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi earum eveniet exercitationem explicabo minus natus quibusdam</p>
        </div>
        <div class="card">
            <h3>文章标题</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi earum eveniet exercitationem explicabo minus natus quibusdam</p>
        </div>
        <div class="card">
            <h3>文章标题</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi earum eveniet exercitationem explicabo minus natus quibusdam</p>
        </div>
        <div class="card">
            <h3>文章标题</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi earum eveniet exercitationem explicabo minus natus quibusdam</p>
        </div>
        <div class="card">
            <h3>文章标题</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi earum eveniet exercitationem explicabo minus natus quibusdam</p>
        </div>
        <div class="card">
            <h3>文章标题</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Commodi earum eveniet exercitationem explicabo
                minus natus quibusdam</p>
        </div>
    </div>
</section>
<section class="section-1">
    <div class="section-content">
        <div class="section1-left">
            <h3>爱我就养我</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
        </div>
        <div class="section1-right">
            <button class="btn1">给钱</button>
            <button class="btn2">给吃哒</button>
        </div>
    </div>
</section>
<div class="footer">
    <div class="footer-content">
        <p>Copyright © 2018 - 2019 装逼之王. All Rights Reserved.</p>
        <a href="http://www.miitbeian.gov.cn/"><img src="/static/img/beian.png"/> 粤ICP备17165463号-1</a>
        <p>版权所有，违者必究</p>
    </div>
</div>
<script type="text/javascript" src="static/js/index.js"></script>
</body>
</html>