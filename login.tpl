<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>笑与君歌-登录</title>
    <link rel="stylesheet" href="static/css/normalize.css">
    <link rel="stylesheet" href="static/css/login.css">
</head>
<body>
<div class="container">
    <div class="content">
        <div class="login_bg"></div>
        <div class="login_field">
            <form action="/login" method="post">
                <div class="head">登录<a href="/">影子</a>账号</div>
                <div class="hr"></div>
                <div class="label"><input type="text" name="username" placeholder="用户名"></div>
                <div class="label"><input type="password" name="password" placeholder="密码"></div>
                <div class="label">
                    <button type="submit">登 录</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="footer">
    Copyright 2018-2019 装逼之王. All Rights Reserved
</div>
</body>
</html>