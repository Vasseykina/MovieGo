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
<#list films as film>
    <div>
        <p><b>${film.title}</b> ${film.releaseYear} год | <a href="/film/${film.id}">Подробнее...</a></p>
    </div>
<#else>
    <h3>Фильмов нет</h3>
</#list>

    <h3>Создать новый фильм</h3>
    <form action="/film/create" method="post" enctype="multipart/form-data">
        Название фильма: <input type="text" name="title"/><br><br>
        Описание : <input type="text" name="description"/><br><br>
        Год релиза: <input type="text" name="releaseYear"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить фильм"/>
    </form>

</body>
</html>