<!DOCTYPE html>
<html>
<head>
    <title>MovieGo - Панель администратора</title>
    <style>
        body {
            font-family: "Verdana", sans-serif; /* Используемый шрифт для всего текста */
            margin: 0; /* Убираем отступы */
            padding: 0; /* Убираем внутренние отступы */
            background-image: linear-gradient(to bottom right, #fcfaf7, #ded1c1); /* Градиентный фон */
            text-align: center; /* Выравниваем текст по центру */
            position: relative; /* Устанавливаем позицию относительно экрана */
            min-height: 100vh; /* Минимальная высота экрана */
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
        table {
            width: 80%; /* Ширина таблицы */
            margin: 0 auto; /* Выравнивание по центру */
            margin-top: 20px; /* Добавляем отступ сверху для таблицы */
            border-collapse: collapse; /* Убираем промежутки между ячейками */
        }
        th, td {
            padding: 10px; /* Поля внутри ячеек */
            border: 1px solid #000; /* Граница ячеек */
        }
        th {
            background-color: #f2f2f2; /* Цвет фона заголовков */
        }
        form {
            margin-top: 10px; /* Добавляем отступ сверху для формы */
        }
        input[type="submit"] {
            background-color: #59595b; /* Цвет фона кнопки */
            color: #fff; /* Цвет текста кнопки */
            cursor: pointer; /* Устанавливаем указатель мыши в виде указателя руки при наведении на кнопку */
            padding: 8px 20px; /* Размеры кнопки */
            border: none; /* Убираем границу кнопки */
            border-radius: 5px; /* Скругляем углы */
            transition: background-color 0.3s ease; /* Плавное изменение цвета фона при наведении */
        }
        input[type="submit"]:hover {
            background-color: #454546; /* Изменяем цвет фона при наведении */
        }
        a {
            display: block; /* Делаем ссылку блочным элементом */
            margin-top: 20px; /* Добавляем отступ сверху */
            text-decoration: none; /* Убираем подчеркивание у ссылки */
            color: #000; /* Цвет текста ссылки */
            font-size: 20px;
            position: absolute; /* Устанавливаем абсолютную позицию */
            bottom: 20px; /* Отступ снизу */
            left: 50%; /* Располагаем слева на половине ширины экрана */
            transform: translateX(-50%); /* Смещаем на половину ширины элемента влево */
        }
    </style>
</head>
<body>
<h1>MovieGo</h1>
<hr>
<h4>Панель администратора</h4>
<table>
    <tr>
        <th>Email</th>
        <th>Активность</th>
        <th>Роли</th>
        <th>Бан</th>
    </tr>
    <#list users as user>
        <tr>
            <td>${user.email}</td>
            <td><#if user.active>true<#else>false</#if></td>
            <td><#list user.roles as role>${role}</#list></td>
            <td>
                <form action="/admin/user/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Бан">
                </form>
            </td>
        </tr>
    <#else>
        <h3>Пользователей нет</h3>
    </#list>
</table>

<a href="/">Вернуться на главную страницу</a>
</body>
</html>