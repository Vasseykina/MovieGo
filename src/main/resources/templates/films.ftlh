<!DOCTYPE html>
<html>
<head>
    <title>MovieGo</title>
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
    <a href="/login">Войти</a></h1>
</#if>

<hr>
<h4>Онлайн-кинокаталог</h4>
<form action="/" method="get">
    Поиск по названию фильма: <input type="text" name="title">
    <input type="submit" value="Поиск"/>
</form>

<h4>Поиск по жанру</h4>
<form action="/genre" method="get">
    <select name="genre">
        <option value="Драма">Drama</option>
        <option value="Комедия">Comedy</option>
        <option value="Хоррор">Horror</option>
        <option value="Документальный фильм">Documentary</option>
        <option value="Триллер">Thriller</option>
        <option value="Фэнтези">Fantasy</option>
        <option value="Фантастика">Fantica</option>
    </select><br><br>
    <input type="submit" value="Поиск"/>
</form>

<#list films as film>
    <div>
        <img src="/images/${film.previewImageId}" width="200px" height="300px"/><br><br>
        <p><b>${film.title}</b> ${film.releaseYear} год  | <a href="/film/${film.id}">Подробнее...</a></p>
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
        <input type="submit" value="Добавить фильм"/>
    </form>
</#if>
</body>
</html>