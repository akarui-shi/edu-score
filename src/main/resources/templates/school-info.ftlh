<!DOCTYPE html>
<html>
<head>
    <title>EduScore</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .header {
            background-color: rgba(237, 239, 246, 1);
            width: 100%;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
        }

        .header h1 {
            color: rgba(30, 38, 64, 1);
            font-family: Inter;
            font-size: 40px;
            letter-spacing: 0;
            line-height: 48px;
        }

        .user-info {
            display: flex;
            align-items: center;
        }

        .user-info h3 {
            margin-right: 20px;
            font-size: 16px;
            margin-top: 2px;
        }

        .login-button {
            background-color: rgba(74, 96, 161, 1);
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
        }

        .unlogin-button {
            background-color: rgba(74, 96, 161, 1);
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            margin-top: -20px;
        }


        .login-button a {
            color: white;
            text-decoration: none; /* Чтобы убрать подчеркивание, если это необходимо */
        }

        a {
            text-decoration: none;
        }

        .admin-panel {
            background-color: rgba(74, 96, 161, 1);
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            margin-top: 0px;
            margin-left: 10px;
        }

        h1, h4 {
            margin-bottom: 20px;
            text-align: center; /* Добавлено для центрирования текста */
        }

        b {
            font-weight: bold;
        }

        .container {
            text-align: center; /* Добавлено для центрирования содержимого блока */
        }

        .school-image {
            width: 35%;
            height: 35%;
            margin-bottom: 10px; /* Добавлено для отступа между изображением и текстом */
        }
    </style>
</head>
<body>
<div class="header">
    <a href="/"><h1>EduScore</h1></a>
    <div class="user-info d-flex justify-content-center">
        <#if user.email??>
            <h3>${user.email}</h3>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" value="Выйти" class="unlogin-button"/>
            </form>
        <#else>
            <button class="login-button" type="button">
                <a href="/login">Войти</a>
            </button>
        </#if>
        <#if user.isAdmin()>
            <a href="/admin" class="admin-panel admin-panel text-center ">Панель администратора</a>
        </#if>
    </div>
</div>
<div class="container">
    <img src="/static/images/school.png" alt="mdo" class="school-image"> <!-- Изменен размер изображения -->
    <h4>Подробная информация о школе</h4>
    <b>Название школы: </b>${school.name}<br>
    <b>Адрес: </b><#if school.address??>${school.address}<#else>Адрес отсутствует</#if><br>
    <b>Количество учеников, набравших более 220 баллов на ЕГЭ: </b>${school.passesOver220}<br>
    <b>Количество учеников, набравших менее 160 баллов на ЕГЭ: </b>${school.passesUnder160}<br>
    <b>Административный округ: </b>${school.admArea}<br>
    <b>Район: </b>${school.district}<br>
    <b>Глобальный идентификатор: </b>${school.globalId}<br>
    <b>Год: </b>${school.year}<br>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
