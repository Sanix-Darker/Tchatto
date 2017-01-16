<%-- 
    Document   : Nombre
    Created on : Jan 11, 2017, 3:04:37 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%! int nbre = 0; %>
<% 
    String val = request.getParameter("val");
    if(val != null ){nbre++;} %>
<%=nbre %>
