<%-- 
    Document   : ListMessage
    Created on : Jan 11, 2017, 8:05:36 AM
    Author     : admin
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
            <%    
                String user = (String) session.getAttribute("USER");
                String message = request.getParameter("message");
                String time = request.getParameter("time");
            %>
            
            <%! ArrayList mess = new ArrayList(); %>
            
            <% 
                if(message != null){
                    mess.add("<span style='font-weight:5px;'><b>"+user+"</b>:<i style='font-size:11px;float:right;'>Aujourd'hui &agrave; "+time+"</i></span><br>"+message);
                }
              for(int i = 0; i < mess.size(); i++) {
                    String option = (String)mess.get(i);
                    if(option.contains(user)){ %>
                        <li class="message right appeared">
                                <div class="text_wrapper"><div class="text"><%=option %></div></div>
                        </li>
                    <% }else{ %>
                        <li class="message left appeared">
                            <div class="avatar"></div><div class="text_wrapper"><div class="text"><%=option %></div></div>
                        </li>
                    <% }
             } %>

