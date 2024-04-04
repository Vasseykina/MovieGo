<!DOCTYPE html>
<html>
<head>
    <title>MovieGo</title>
    <style>
        body {
            font-family: "Verdana", sans-serif; /* Используемый шрифт для всего текста */
            margin: 0; /* Убираем отступы */
            padding: 0; /* Убираем внутренние отступы */
            background-image: linear-gradient(to bottom right, #fcfaf7, #ded1c1); /* Градиентный фон */
        }
        h1 {
            text-align: center;
            font-family: 'Montserrat', sans-serif;
            font-size: 60px;
            margin-top: 50px; /* Добавляем отступ сверху */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* Добавляем тень */
        }
        h4 {
            text-transform: uppercase;
            font-size: 36px;
            margin-left: 50px;
        }
        img {
            height: 700px;
            float: left;
            margin-left: 50px;
            border: 4px solid #fff; /* Белая рамка вокруг изображения */
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3); /* Тень вокруг изображения */
        }
        a {
            text-decoration: none; /* Убираем подчеркивание у ссылок */
            color: black; /* Цвет ссылок */
            font-size: 20px;
            display: inline-block; /* Делаем ссылки блочными элементами, чтобы они занимали только необходимое пространство */
            margin-top: 10px; /* Добавляем отступ сверху */
        }
        a:hover {
            color: #454546; /* Изменяем цвет ссылки при наведении курсора */
        }
        .description {
            font-size: 32px;
            margin-left: 50px;
            margin-top: 40px; /* Добавляем отступ сверху */
            padding: 20px; /* Добавляем внутренний отступ */
            border-radius: 10px; /* Скругляем углы */
            background-color: rgba(255, 255, 255, 0.8); /* Полупрозрачный фон */
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3); /* Тень блока описания */
        }
        .info {
            font-size: 24px;
            margin-left: 50px;
            margin-top: 10px; /* Добавляем отступ сверху */
            background-color: rgba(255, 255, 255, 0.8); /* Полупрозрачный фон */
            padding: 10px; /* Добавляем внутренний отступ */
            border-radius: 10px; /* Скругляем углы */
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3); /* Тень блока информации */
        }
    </style>
</head>
<body>
<h1>MovieGo</h1>
<h4>${films.title}</h4>
<#list images as img>
    <img src="/images/${img.id}" alt="Фото фильма">
</#list>
<div class="description">${films.description}</div>
<div class="info">Год релиза: ${films.releaseYear}</div>
<div class="info">Жанр: ${films.genre}</div>
<h5><a href="/">Вернуться на главную страницу</a></h5>
</body>
</html>
