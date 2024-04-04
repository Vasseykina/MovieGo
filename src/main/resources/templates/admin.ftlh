<!DOCTYPE html>
<html>
<head>
    <title>MovieGo</title>
</head>
<body>
<h1>MovieGo</h1>
<hr>
<h4>Панель администратора</h4>
<table border="1">
    <tr>
        <th>Email</th>
        <th>Активность</th>
        <th>Роли</th>
        <th>Бан</th>
    </tr>
    <#list users as user>
        <tr>
            <th>${user.email}</th>
            <th><#if user.active>true<#else>false</#if></th>
            <th><#list user.roles as role>${role}</#list></th>
            <th>
                <form action="/admin/user/ban/${user.id}" method="post">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Бан">
                </form>
            </th>
        </tr>
    <#else>
        <h3>Пользователей нет</h3>
    </#list>
</table>

<a href="/">Вернуться на главную страницу</a>
</body>
</html>