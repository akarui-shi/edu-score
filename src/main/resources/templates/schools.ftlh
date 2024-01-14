<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EduScore</title>
</head>
<body>
<h1>EduScore</h1><hr>
<h4>Школы Москвы</h4>
<form action="/" method="get">
    Поиск по названию школы: <input type="text" name="name"><br>
    <input type="submit" value="Поиск"/>
</form>
<#list schools as school>
    <div>
        <p><b>${school.id?c} ${school.name} </b><#if school.address??>${school.address}<#else>Адрес отсутствует</#if> <br> | <a href="/school/${school.id?c}">Подробнее..</a></p>
    </div>
</#list>
</body>
</html>