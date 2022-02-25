
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<form action="${pageContext.request.contextPath}/register" method="post">
    <div class="container">
        <h1>Գրանցում</h1>
        <p>Գրանցվելու համար լրացրեք բոլոր տողերը</p>
        <hr>

        <label for="name"><b>Name</b></label>
        <input type="text" placeholder="Enter Name" name="name" id="name" required>

        <label for="surname"><b>Surname</b></label>
        <input type="text" placeholder="Enter Surname" name="surname" id="surname" required>

        <label for="email"><b>Email</b></label>
        <input type="text" placeholder="Enter Email" name="email" id="email" required>

        <label for="psw"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="password" id="psw" required>

        <hr>
        <button type="submit" class="registerBtn">Գրանցվել</button>
    </div>

</form>
</body>
</html>