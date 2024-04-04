<!DOCTYPE html>
<html>
<head>
    <title>MovieGo</title>
</head>
<body>
<h1>MovieGo</h1>

<hr>
<h4>Онлайн-кинокаталог</h4>
<form action="/" method="get">
    Поиск по названию фильма: <input type="text" name="title">
    <input type="submit" value="Поиск"/>
</form>

<h4>Поиск по жанру</h4>
<form action="/genre" method="get">
    <select name="genre">
        <option value="драма">Drama</option>
        <option value="комедия">Comedy</option>
        <option value="хоррор">Horror</option>
    </select><br><br>
    <input type="submit" value="Поиск"/>
</form>

<#list films as film>
    <div>
        <p><b>${film.title}</b> ${film.releaseYear} год | <a href="/film/${film.id}">Подробнее...</a></p>
    </div>
<#else>
    <h3>Фильмов нет</h3>
    <a href="/">Вернуться на глвную страницу</a>
</#list>



    <h3>Создать новый фильм</h3>
    <form action="/film/create" method="post" enctype="multipart/form-data">
        Название фильма: <input type="text" name="title"/><br><br>
        Описание : <input type="text" name="description"/><br><br>
        Год релиза: <input type="text" name="releaseYear"/><br><br>
        Жанр:
        <select name="genre">
            <option value="драма">Drama</option>
            <option value="комедия">Comedy</option>
            <option value="хоррор">Horror</option>
        </select><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить фильм"/>
    </form>

</body>
</html>