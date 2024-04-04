<!DOCTYPE html>
<html>
<head>
    <title>MovieGo - Регистрация</title>
    <style>
        body {
            font-family: 'Montserrat', sans-serif; /* Используемый шрифт для всего текста */
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
            font-size: 36px;
        }
        form {
            width: 50%; /* Ширина формы */
            margin: 0 auto; /* Выравнивание по центру */
            margin-top: 20px; /* Добавляем отступ сверху для формы */
        }
        input[type="text"],
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
        input[type="text"]:focus,
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
    </style>
</head>
<body>
<h1>MovieGo</h1>
<hr>
<h4>Регистрация</h4>
<form action="/registration" method="post">
    Имя:      <input type="text" name="name"><br><br>
    Почта:<input type="email" name="email"><br><br>
    Пароль:  <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Зарегистрироваться">
</form>
</body>
</html>