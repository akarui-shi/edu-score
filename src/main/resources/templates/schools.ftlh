<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
            font-size: 16px; /* Изменение размера шрифта */
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

        form {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 20px;
        }

        label {
            margin-right: 10px;
        }

        select {
            margin-right: 10px;
        }

        input[type="number"] {
            margin-right: 10px;
        }

        button[type="submit"] {
            margin-top: 24px;
            background-color: rgba(74, 96, 161, 1);
            color: white;
            padding: 6px 40px;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        #map {
            width: calc(100% - 60px);
            height: 550px;
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
            margin-left: 30px; /* Добавлен отступ слева */
            margin-right: 30px; /* Добавлен отступ справа */
        }
    </style>
    <script src="https://api-maps.yandex.ru/2.1/?apikey=327bb41d-e696-4a51-84ea-9b024ac1bd49&lang=ru_RU" type="text/javascript"></script>
    <script>
        ymaps.ready(init);
        function init() {
            var map = new ymaps.Map("map", {
                center: [55.76, 37.64],
                zoom: 10
            }, {
                searchControlProvider: 'yandex#search'
            });

            map.controls.remove('geolocationControl'); // удаляем геолокацию
            map.controls.remove('searchControl'); // удаляем поиск
            map.controls.remove('trafficControl'); // удаляем контроль трафика
            map.controls.remove('typeSelector'); // удаляем тип
            map.controls.remove('fullscreenControl'); // удаляем кнопку перехода в полноэкранный режим
            map.controls.remove('zoomControl'); // удаляем контрол зуммирования
            map.controls.remove('rulerControl'); // удаляем контрол правил

            <#assign count = 0>
            <#list schools as school>
            <#if school.address??>
            <#assign count = count + 1>
            ymaps.geocode('${school.address}').then(function (res) {
                var firstGeoObject = res.geoObjects.get(0),
                    coordinates = firstGeoObject.geometry.getCoordinates(),
                    placemark = new ymaps.Placemark(coordinates, {
                        balloonContentHeader: "ТОП ${count}",
                        balloonContentBody: "${school.name}",
                        balloonContentFooter: `<a href="/school/${school.id?c}">Подробнее...</a>`,
                    }, {
                        // preset: "islands#glyphIcon",
                        // iconGlyph: 'education',
                        // iconGlyphColor: '#4A60A1FF',
                        iconColor: '#4A60A1FF',
                        iconImageSize: [45, 45]
                    });

                map.geoObjects.add(placemark);
            });
            </#if>
            </#list>
        }
    </script>
</head>
<body>
<div class="header">
    <h1>EduScore</h1>
    <div class="user-info">
        <#if user.email??>
            <h3>${user.email}</h3>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <input type="submit" value="Выйти" class="unlogin-button"/>
            </form>
            <#if user.isAdmin()>
                <a href="/admin">Панель администратора</a>
            </#if>
        <#else>
            <button class="login-button" type="button">
                <a href="/login">Войти</a>
            </button>
        </#if>
    </div>
</div>

<div class="container">
    <form action="/" method="get">
        <div class="row">
            <div class="col-md-3">
                <label for="area">Административный округ:</label>
                <select name="area" id="area" class="form-select">
                    <option value="">Все округа</option>
                    <option value="Восточный административный округ">Восточный административный округ</option>
                    <option value="Западный административный округ">Западный административный округ</option>
                    <option value="Зеленоградский административный округ">Зеленоградский административный округ</option>
                    <option value="Северный административный округ">Северный административный округ</option>
                    <option value="Северо-Восточный административный округ">Северо-Восточный административный округ</option>
                    <option value="Северо-Западный административный округ">Северо-Западный административный округ</option>
                    <option value="Троицкий административный округ">Троицкий административный округ</option>
                    <option value="Центральный административный округ">Центральный административный округ</option>
                    <option value="Новомосковский административный округ">Новомосковский административный округ</option>
                    <option value="Юго-Восточный административный округ">Юго-Восточный административный округ</option>
                    <option value="Юго-Западный административный округ">Юго-Западный административный округ</option>
                    <option value="Южный административный округ">Южный административный округ</option>
                </select>
            </div>
            <div class="col-md-3">
                <label for="year">Год:</label>
                <select name="year" id="year" class="form-select">
                    <option value="2022-2023">2022-2023</option>
                    <option value="2016-2017">2016-2017</option>
                    <option value="2017-2018">2017-2018</option>
                    <option value="2018-2019">2018-2019</option>
                    <option value="2019-2020">2019-2020</option>
                    <option value="2020-2021">2020-2021</option>
                    <option value="2021-2022">2021-2022</option>
                </select>
            </div>
            <div class="col-md-3">
                <label for="count">Количество:</label>
                <input type="number" name="count" id="count" value="10" class="form-control">
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-primary">Поиск</button>
            </div>
        </div>

    </form>
</div>
<div id="map"></div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
