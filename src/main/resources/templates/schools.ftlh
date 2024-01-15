<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EduScore</title>
    <style>
        #map {
            width: 400px;
            height: 300px;
        }
    </style>
    <script src="https://api-maps.yandex.ru/2.1/?apikey=327bb41d-e696-4a51-84ea-9b024ac1bd49&lang=ru_RU" type="text/javascript"></script>
    <script>
        ymaps.ready(init);
        function init() {
            var myMap = new ymaps.Map("map", {
                center: [55.76, 37.64],
                zoom: 10
            }, {
                searchControlProvider: 'yandex#search'
            });

            var count = 0; // счетчик для ограничения количества школ
            <#list schools as school>
            <#if school.address??>
            if (count < 10) { // ограничение до 10 школ
                ymaps.geocode('${school.address}').then(function (res) {
                    var firstGeoObject = res.geoObjects.get(0),
                        coordinates = firstGeoObject.geometry.getCoordinates(),
                        placemark = new ymaps.Placemark(coordinates, {
                            balloonContent: '<img src="http://img-fotki.yandex.ru/get/6114/82599242.2d6/0_88b97_ec425cf5_M" />',
                            iconContent: "школа"
                        }, {
                            preset: "twirl#yellowStretchyIcon",
                            balloonCloseButton: false,
                            hideIconOnBalloonOpen: false
                        });

                    myMap.geoObjects.add(placemark);
                });
                count++;
            }
            </#if>
            </#list>
        }
    </script>
</head>
<body>
<h1>EduScore</h1><hr>
<h4>Школы Москвы</h4>
<form action="/" method="get">
    Поиск по названию школы: <input type="text" name="name"><br>
    <input type="submit" value="Поиск"/>
</form>
<div id="map"></div>
</body>
</html>