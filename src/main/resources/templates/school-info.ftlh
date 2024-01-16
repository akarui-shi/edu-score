<!DOCTYPE html>
<html>
<head>
    <title>EduScore</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
    <style>
        .header {
            background-color: rgba(237, 239, 246, 1);
            width: 100%;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
        }

        .header h1 {
            color: rgba(30, 38, 64, 1);
            font-family: Inter;
            font-size: 40px;
            letter-spacing: 0;
            line-height: 48px;
        }

        .login-button {
            background-color: rgba(74, 96, 161, 1);
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
        }

        h1, h4 {
            margin-bottom: 20px;
        }

        b {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="header">
    <h1>EduScore</h1>
    <!-- You can keep the header content as it is or modify it as needed -->
</div>

<div class="container">
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