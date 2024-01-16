<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduScore</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Inter', sans-serif;
            margin: 0;
            padding: 0;
            overflow: hidden;
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
            font-family: 'Inter';
            font-size: 40px;
            letter-spacing: 0;
            line-height: 48px;
        }

        .admin-panel {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin-top: 20px;
            overflow: hidden;
        }

        h4 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ced4da;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: rgba(74, 96, 161, 1);
            color: white;
        }

        form {
            margin: 0;
            padding: 0;
        }

        .ban-button {
            background-color: rgba(74, 96, 161, 1);
            color: white;
            padding: 6px 10px;
            font-size: 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .ban-button:hover {
            background-color: #4a5ca1;
        }

        .edit-link, .details-link {
            text-decoration: none;
            color: #4a5ca1;
        }

        .edit-link:hover, .details-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>EduScore</h1>
</div>

<div class="admin-panel">
    <h4>Панель администратора</h4>

    <table>
        <tr>
            <th>Email</th>
            <th>Активность</th>
            <th>Роли</th>
            <th>Бан</th>
            <th>Редактирование</th>
            <th>Подробная информация</th>
        </tr>
        <#list users as user>
            <tr>
                <td>${user.email}</td>
                <td><#if user.active>true<#else>false</#if></td>
                <td><#list user.roles as role>${role}</#list></td>
                <td>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" value="Бан" class="ban-button">
                    </form>
                </td>
                <td><a href="/admin/user/edit/${user.id}" class="edit-link">Редактирование</a></td>
                <td><a href="/user/${user.id}" class="details-link">Подробная информация</a></td>
            </tr>
        <#else>
            <tr>
                <td colspan="6"><h3>Пользователей нет</h3></td>
            </tr>
        </#list>
    </table>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
