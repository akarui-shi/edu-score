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

        th,
        td {
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

        /* New styles for the management column */
        .management-column {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 40px;
            height: 20px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
            border-radius: 20px;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            left: 2px;
            bottom: 2px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
            border-radius: 50%;
        }

        input:checked+.slider {
            background-color: #4a5ca1;
        }

        input:checked+.slider:before {
            -webkit-transform: translateX(20px);
            -ms-transform: translateX(20px);
            transform: translateX(20px);
        }

    </style>
</head>

<body>
<div class="header">
    <h1>EduScore</h1>
</div>

<div class="admin-panel">
    <h4>Панель администратора</h4>

    <div class="container" style="margin-bottom: 10px; margin-top: 10px; font-size: 18px;">
        <p>
            На этой панели администратор может выполнять следующие действия:
        </p>
        <ul>
            <li>Просматривать информацию о пользователях, такую как их электронная почта, имя, доступ к системе и роли.</li>
            <li>Изменять статус доступа к системе: включать или выключать возможность доступа.</li>
            <li>Редактировать роли пользователей, чтобы определить их права и возможности в системе.</li>
        </ul>
    </div>
    <table>
        <tr>
            <th>Email</th>
            <th>Имя</th>
            <th>Доступ к сайту</th>
            <th>Роли</th>
            <th>Редактирование роли</th>
        </tr>
        <#list users as user>
            <tr>
                <td>${user.email}</td>
                <td>${user.name}</td>
                <td class="management-column">
                    <label class="switch">
                        <form action="/admin/user/ban/${user.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <input type="checkbox" <#if user.active>checked</#if> />
                            <span class="slider"></span>
                        </form>
                    </label>
                </td>
                <td><#list user.roles as role>${role}</#list></td>
                <td><a href="/admin/user/edit/${user.id}" class="edit-link">Редактировать</a></td>
            </tr>
        <#else>
            <tr>
                <td colspan="5">
                    <h3>Пользователей нет</h3>
                </td>
            </tr>
        </#list>
    </table>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>
