<%--
  Created by IntelliJ IDEA.
  User: pxel1310
  Date: 17/05/2022
  Time: 01:29 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String usuario = "";
    HttpSession usu = request.getSession();

    if(usu.getAttribute("usuario") == null){
%>
<jsp:forward page="index.jsp">
    <jsp:param name="error" value="Es de ahuevo iniciar sesion"/>
</jsp:forward>
<%
    }else{
        //Si hay una sesión pq existe en la Bd
        usuario = (String)usu.getAttribute("usuario");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <h1>Si existes!</h1>

<%
    //obtener privelegios == 1
%>
</body>
</html>
