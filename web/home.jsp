<%@ page import="model.User" %>
<%@ page import="model.Item" %>
<%@ page import="java.util.List" %>

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
<div class="header">
    <h1>Welcome in MyItems.am</h1>
    <h3>Բարև <%=user.getName()%> </h3>
</div>



<div class="navbar">
    <a href="${pageContext.request.contextPath}/">Գլխավոր</a>
    <a href="${pageContext.request.contextPath}/?catId=car">Ավտոմեքենաներ</a>
    <a href="${pageContext.request.contextPath}/?catId=house">Տներ</a>
    <a href="${pageContext.request.contextPath}/?catId=commercial">Կոմերցիոն </a>
    <a href="${pageContext.request.contextPath}/?catId=furniture">Կահույք</a>
    <a href="${pageContext.request.contextPath}/logout" class="right">Ելք</a>
    <a href="${pageContext.request.contextPath}/currentUserAds?userId=<%=user.getId()%>" class="right">Իմ հայտարարությունները</a>
    <a href="${pageContext.request.contextPath}/createAd.jsp" class="right">Ավելացնել հայտարարություն</a>
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
            <img src="${pageContext.request.contextPath}/image?path=<%=item.getPicUrl()%>" width="150px">
        </div>
        <%}%>
    </div>
</div>
<%}%>
<%}%>
</body>
</html>
