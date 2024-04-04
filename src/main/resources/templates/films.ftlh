<!DOCTYPE html>
<html>
<head>
    <title>MovieGo</title>
    <style>
        body {
            font-family: "Verdana", sans-serif;
            margin: 0;
            padding: 0;
            background-image: linear-gradient(to bottom right, #fcfaf7, #ded1c1);
        }
        h1 {
            text-align: center;
            font-family: 'Montserrat', sans-serif;
            font-size: 50px;
            margin-top: 30px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }
        h4 {
            text-transform: uppercase;
            font-size: 20px;
        }
        h3 {
            text-transform: uppercase;
            font-size: 20px;
        }
        img {
            height: 400px;
            width: auto;
            float: left;
            margin: 20px;
            border: 4px solid #fff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
        }
        a {
            text-decoration: none;
            color: black;
            font-size: 20px;
            display: inline-block;
            margin-top: 10px;
        }
        a:hover {
            color: #454546;
        }

        form {
            text-align: left;
            margin-top: 20px;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="file"],
        button {
            font-size: 20px;
            padding: 10px;
            margin: 10px;
            border: 2px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="file"]:focus,
        button:hover {
            border-color: #000000;
        }
        input[type="submit"],
        button {
            background-color: #59595b;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover,
        button:hover {
            background-color: #454546;
        }
        .film-container {
            display: inline-block; /* Отображать блоки фильмов в одной строке */
            vertical-align: top; /* Выравнивание блоков по верхнему краю */
            margin-right: 20px; /* Отступ между блоками фильмов */
        }

        .film-info {
            margin-top: 10px; /* Отступ сверху для описания фильма */
            margin-left: 30px;
        }

        .film-description {
            margin-top: 10px; /* Отступ сверху для описания фильма */
            margin-left: 30px;
        }

        .film-container img {
            width: 380px; /* Ширина изображения */
            height: 545px; /* Автоматическая высота изображения */
            float: left; /* Выравнивание изображения по левому краю */
            margin-right: 20px; /* Отступ справа от изображения */
        }
    </style>
</head>
<body>
<h1>MovieGo</h1>

<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выйти"/>
    </form>
    <#if user.isAdmin()>
        <a href="/admin">Панель администратора</a>
    </#if>
<#else>
    <a href="/login">Войти </a>
</#if>

<hr>
<form action="/" method="get">
    Поиск по названию фильма: <input type="text" name="title">
    <input type="submit" value="Поиск"/>
</form>

<h4>Поиск по жанру</h4>
<form action="/genre" method="get">
    <button type="submit" name="genre" value="Драма">Драма</button>
    <button type="submit" name="genre" value="Комедия">Комедия</button>
    <button type="submit" name="genre" value="Хоррор">Хоррор</button>
    <button type="submit" name="genre" value="Документальный фильм">Документальный фильм</button>
    <button type="submit" name="genre" value="Триллер">Триллер</button>
    <button type="submit" name="genre" value="Фэнтези">Фэнтези</button>
    <button type="submit" name="genre" value="Фантастика">Фантастика</button>
    <a href="/">Весь список</a>
</form>



<#list films as film>
    <div class="film-container">
        <img src="/images/${film.previewImageId}" alt="Фото фильма"/>
        <div class="film-info">
            <p><b>${film.title}</b> ${film.releaseYear} год</p>
            <p><a href="/film/${film.id}">Подробнее...</a></p>
        </div>
    </div>
<#else>
    <h3>Фильмов нет</h3>
    <a href="/">Вернуться на главную страницу</a>
</#list>

<#if user.isAdmin()>
    <hr>
    <h3>Создать новый фильм</h3>
    <form action="/film/create" method="post" enctype="multipart/form-data">
        Название фильма: <input type="text" name="title"/><br><br>
        Описание : <input type="text" name="description"/><br><br>
        Год релиза: <input type="text" name="releaseYear"/><br><br>
        Жанр:
        <select name="genre">
            <option value="Драма">Drama</option>
            <option value="Комедия">Comedy</option>
            <option value="Хоррор">Horror</option>
            <option value="Документальный фильм">Documentary</option>
            <option value="Триллер">Thriller</option>
            <option value="Фэнтези">Fantasy</option>
            <option value="Фантастика">Fantica</option>
        </select><br><br>
        Постер:  <input type="file" name="file"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить фильм" style="font-size: 24px;">
        <h3>  </h3>
    </form>
</#if>
</body>
</html>