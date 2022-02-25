
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Մուտք</title>
</head>

<body>
<div class="container">
    <form action="/login" method="post">
        <div class="row">
            <h2 style="text-align:left; margin-left: 50px">Մուտք</h2>
            <div class="col">
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <input type="submit" value="Մուտք">
            </div>
        </div>
    </form>
</div>

<div class="bottom-container">
    <div class="row" >
        <div class="col" >
            <a href="/register.jsp" style="color:white" class="btn">Գրանցում</a>
        </div>
    </div>
</div>

</body>
</html>
