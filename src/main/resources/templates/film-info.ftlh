<!DOCTYPE html>
<html>
<head>
    <title>MovieGo</title>
</head>
<body>
<h1>MovieGo</h1><hr>
<h4>Подробная информация о фильме</h4>
<#list images as img>
    <img src="/images/${img.id}" height="60px"/><br><br>
</#list>
<b>Название фильма: </b>${films.title}<br>
<b>Описание : </b>${films.description}<br>
<b>Год релиза: </b>${films.releaseYear}<br>
<b>Жанр: </b>${films.genre}<br>
<hr>
<form action="/film/delete/${films.id}" method="post">
    <input type="submit" value="Удалить фильм из каталога"/>
</form>
</body>
</html>