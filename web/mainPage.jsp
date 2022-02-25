<%@ page import="model.Item" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>



<body>
<div class="header">
    <h1>My project myItems.am</h1>
</div>

<div class="navbar">
    <a href="/">Գլխավոր</a>
    <a href="/?catId=car">Ավտոմեքենաներ</a>
    <a href="/?catId=house">Տներ</a>
    <a href="/?catId=commercial">Կոմերցիոն </a>
    <a href="/?catId=furniture">Կահույք</a>
    <a href="/logIn.jsp" class="right">Մուտք</a>
    <a href="/register.jsp" class="right">Գրանցվել</a>
</div>

<% List<Item> items = (List<Item>) request.getAttribute("items");
    if (items != null) {
        for (Item item : items) {%>
<div class="row">
    <div class="side">
        <h2><%=item.getTitle()%></h2>
        <h5><%=item.getDescription()%></h5>
        <h5><%=item.getPrice()%></h5>
        <h5><%=item.getUser().getEmail()%></h5>
        <%if(item.getPicUrl()!= null){%>
        <div class="fakeImg" style="height:200px;">
            <img src="/image?path=<%=item.getPicUrl()%>" width="220px">
        </div>
        <%}%>
    </div>
</div>
<%}%>
<%}%>
</body>
</html>
