<!DOCTYPE html>
<html>
<head>
    <title>EduScore</title>
</head>
<body>
<h1>EduScore</h1><hr>
<h4>Подробная информация о школе</h4>
<b>Название школы: </b>${school.name}<br>
<b>Адрес: </b><#if school.address??>${school.address}<#else>Адрес отсутствует</#if><br>
<b>Количество учеников, набравших более 220 баллов на ЕГЭ: </b>${school.passesOver220}<br>
</body>
</html>