<!DOCTYPE html>
<html>
<head>
    <title>MovieGo - Авторизация</title>
    <style>
        body {
            font-family: "Verdana", sans-serif; /* Используемый шрифт для всего текста */
            margin: 0; /* Убираем отступы */
            padding: 0; /* Убираем внутренние отступы */
            background-image: linear-gradient(to bottom right, #efe9dc, #ad988a); /* Градиентный фон */
            text-align: center; /* Выравниваем текст по центру */
        }
        h1 {
            font-family: 'Montserrat', sans-serif;
            font-size: 60px;
            margin-top: 50px; /* Добавляем отступ сверху */
        }
        h4 {
            font-family: 'Montserrat', sans-serif;
            font-size: 36px;
        }
        form {
            margin-top: 20px; /* Добавляем отступ сверху для формы */
        }
        input[type="email"],
        input[type="password"],
        input[type="submit"] {
            font-size: 20px;
            padding: 10px;
            margin: 10px;
            border: 2px solid #ccc; /* Устанавливаем рамку */
            border-radius: 5px; /* Скругляем углы */
            transition: border-color 0.3s ease; /* Плавное изменение цвета рамки при фокусе */
        }
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #000000; /* Изменяем цвет рамки при фокусе */
        }
        input[type="submit"] {
            background-color: #59595b; /* Цвет фона кнопки */
            color: #fff; /* Цвет текста кнопки */
            cursor: pointer; /* Устанавливаем указатель мыши в виде указателя руки при наведении на кнопку */
            transition: background-color 0.3s ease; /* Плавное изменение цвета фона при наведении */
        }
        input[type="submit"]:hover {
            background-color: #59595b; /* Изменяем цвет фона при наведении */
        }
        a {
            display: inline-block; /* Делаем ссылку блочным элементом, чтобы занимала только необходимое пространство */
            color: #000000; /* Цвет ссылки */
            text-decoration: none; /* Убираем подчеркивание у ссылки */
            font-size: 20px;
            transition: color 0.3s ease; /* Плавное изменение цвета ссылки при наведении */
        }
        a:hover {
            color: #000000; /* Изменяем цвет ссылки при наведении */
        }
    </style>
</head>
<body>
<h1>MovieGo</h1>
<h4>Авторизация</h4>
<form action="/login" method="post">
    <label for="username">Эл. почта:</label><br>
    <input type="email" id="username" name="username" required><br><br>
    <label for="password">Пароль:</label><br>
    <input type="password" id="password" name="password" required><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Вход">
</form>
<a href="/registration">Зарегистрироваться</a>
</body>
</html>
