<%-- 
    Document   : ListUser
    Created on : Jan 12, 2017, 7:03:39 AM
    Author     : admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<center><h5>Liste des Utilisateurs</h5></center>

<%! int nbre = 0; %>
<%! ArrayList users = new ArrayList(); %>
<% 
    String val_user = request.getParameter("val_user");
    String time = request.getParameter("time");
    String user = (String) session.getAttribute("USER");
    
    if(val_user != null){
        users.add("<div style='width:100%;font-weight:5px;padding:5px;border-bottom:2px dashed black;'><b>"+val_user+"</b> <span style='font-size:11px;float:right;'>depuis<i>"+time+"</i></span></div>");
    }
    for(int i = 0; i < users.size(); i++) {
        String option = (String)users.get(i);
        if(!option.contains(user)){ %>
            <%=option %><% 
        }
    } %>

