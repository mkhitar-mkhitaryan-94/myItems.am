<%@ page import="model.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<body>
<%
    HttpSession currentSession = request.getSession();
    User user = (User) currentSession.getAttribute("user");
%>
<form action="/createAd" method="post" enctype="multipart/form-data">
    <div class="container">
        <h1>Գրանցել հայտարարություն</h1>
        <hr>

        <label><b>Անունը</b></label><br>
        <input type="text" placeholder="Enter Title" name="title" id="title" required><br>

        <label><b> նկարագիր</b></label><br>
        <textarea name="description" placeholder="Item Description"></textarea><br>

        <label><b>Ընտրիր կատեգորիա</b></label><br>
        <select name="category"><br>
            <option value="car">Ավտոմեքենաներ</option>
            <option value="house">Տուն</option>
            <option value="furniture">Կահույք</option>
            <option value="commercial">Կոմերցիոն</option>
        </select>


        <label><b>Գինը</b></label><br>
        <input type="text" placeholder="Input the price" name="price" id="psw-repeat" required>



        <label>Ընտրիր նկար</label><br>
        <input type="file" name="image"><br>
        <input type="hidden" name="userId" value="<%=user.getId()%>">
        <hr>
        <button type="submit" class="registerBtn">Ավելացնել</button>
    </div>
</form>
</body>
</html>
