<%-- 
    Document   : Messages
    Created on : Jan 10, 2017, 11:41:00 PM
    Author     : admin
--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="bootstrap.min.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Tchatoo - Messages</title>
  </head>
  <body>
      <div style="width:100%;position:fixed;padding:4px;background:#edeff2;text-align:center;">
          <img src="chat-icon.png" alt="" style="align:center;width:100px;opacity:0;"/>
          <a href="logout" class="deconnec">Deconnexion</a>
      </div>
      
    <div class="chat_window">
            <div class="top_menu">
                <div class="buttons">
                    <div class="button maximize"></div>
                    <jsp:useBean id="gp" class="modl.Groupe" />
                    <%  String user = (String) session.getAttribute("USER");%>
                    <div class="button"><b><i><%=user %></i></b></div>
                </div>
                <%
                String code = (String) session.getAttribute("CODE");%>
                <div class="title"> Groupe <b><%=code %> - <span style="padding:5px;border-raius:3px;background:blue;color:white;"> <span class="nombre">0</span> en Ligne</span> </b></div>
            </div>
            <!-- Liste des messages -->
            <div class="col-md-12">
                <div class="col-md-3">
                    <div class="users" style="overflow-x: hidden;width:100%;margin: 0;height: 497px;overflow: scroll;"></div>
                </div>
                <div class="col-md-9" style="border-left:1px solid black;">
                    <ul class="messages" style="overflow-x: hidden;"></ul>
                </div>
            </div>

            <div class="bottom_wrapper clearfix">
                    <div class="message_input_wrapper">
                        <input class="message_input" name="message" placeholder="Ecrivez votre message ici..." />
                    </div>
                <div class="send_message">
                        <div class="icon"></div><div class="text" >Envoyer</div>
                    </div>
            </div>
    </div>
    
  </body>
  

<script type="text/javascript" src="jquery-1.4.2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        //On check le nombre de users
        $.ajax({
           url: "Nombre.jsp",
           type: "get",
           data: {"val":"yes"},
           success: function(data) {
            $(".nombre").html(data);
           }
        });
        
        //On liste les utilisateurs
        $.ajax({
           url: "ListUser.jsp",
           type: "get",
           data: {"val_user":"<%=user %>", "time": myTimer()},
           success: function(data) {
            $(".users").html(data);
           }
        });
        
     $('.send_message').click(function(e) {
         if($(".message_input").val() === ''){
             alert("Attention, Votre Champ de texte est vide!");
             return false;
         }
        var message = $(".message_input").val();
        $.ajax({
           url: "tchatoo",
           type: "get",
           data: {"message": message,"time": myTimer()},
           success: function(data) {
            $(".message_input").val('');
            $(".messages").html(data).slideDown('slow');
           }
        });
    });
    
    function recharge(){
        $.ajax({
           url: "tchatoo",
           type: "get",
           data: {},
           success: function(data) {
            $(".messages").html(data).slideDown('slow');
           }
        });
    }
    function compte(){
        $.ajax({
           url: "Nombre.jsp",
           type: "get",
           data: {},
           success: function(data) {
            $(".nombre").html(data);
           }
        });
    }
    
    function users(){
        $.ajax({
           url: "ListUser.jsp",
           type: "get",
           data: {"SDF":"DF"},
           success: function(data) {
            $(".users").html(data);
           }
        });
    }
    var myVar2 = setInterval(users,1500);
    var myVar = setInterval(recharge,1000);
    var myVar1 = setInterval(compte,1500);
    
    function myTimer() {
        var d = new Date();
        return d.toLocaleTimeString();
    }
});
</script>
<style>
* {
  box-sizing: border-box;
}
ul{
    list-style:none;
}
body {
  background: linear-gradient(to bottom, #68EACC 0%, #497BE8 100%);
  font-family: "Calibri", "Roboto", sans-serif;
}

.chat_window {
  position: absolute;
  width: calc(100% - 20px);
  max-width: 800px;
  height: 610px;
  border-radius: 10px;
  background-color: #fff;
  left: 50%;
  top: 50%;
  transform: translateX(-50%) translateY(-50%);
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
  background-color: #f8f8f8;
  overflow: hidden;
}

.top_menu {
  background-color: #fff;
  width: 100%;
  padding: 15px 0 10px;
  box-shadow: 0 1px 30px rgba(0, 0, 0, 0.1);
}
.top_menu .buttons {
  margin: 3px 0 0 20px;
  position: absolute;
}
.deconnec {
    text-decoration:none;
    border:1px solid rgba(0,0,0,0.3);
    float:right;
    padding:7px;
    color:black;
    background:white;
}
.deconnec:hover{
    box-shadow: 0 4px 7px rgba(0,0,0,0.4);
}
.top_menu .buttons .button {
  width: 16px;
  height: 16px;
  border-radius: 50%;
  display: inline-block;
  margin-right: 10px;
  position: relative;
}
.top_menu .buttons .button.close {
  background-color: #f5886e;
}
.top_menu .buttons .button.minimize {
  background-color: #fdbf68;
}
.top_menu .buttons .button.maximize {
  background-color: #a3d063;
}
.top_menu .title {
  text-align: center;
  color: #bcbdc0;
  font-size: 20px;
}

.messages {
  position: relative;
  list-style: none;
  padding: 20px 10px 0 10px;
  margin: 0;
  height: 457px;
  overflow: scroll;
  background:url('chat-icon.png') center no-repeat, #f8f8f8;
}
.messages .message {
  clear: both;
  overflow: hidden;
  margin-bottom: 20px;
  transition: all 0.5s linear;
  opacity: 0;
}
.messages .message.left .avatar {
  background-color: #f5886e;
  float: left;
}
.messages .message.left .text_wrapper {
  background-color: rgba(255,255,255,0.95);
  margin-left: 20px;
}
.messages .message.left .text_wrapper::after, .messages .message.left .text_wrapper::before {
  right: 100%;
  border-right-color: rgba(255,255,255,0.95);
}
.messages .message.left .text {
  color: #c48843;
}
.messages .message.right .avatar {
  background-color: #fdbf68;
  float: right;
}
.messages .message.right .text_wrapper {
  background-color: #c7eafc;
  margin-right: 20px;
  float: right;
}
.messages .message.right .text_wrapper::after, .messages .message.right .text_wrapper::before {
  left: 100%;
  border-left-color: #c7eafc;
}
.messages .message.right .text {
  color: #45829b;
}
.messages .message.appeared {
  opacity: 1;
}
.messages .message .avatar {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  display: inline-block;
}
.messages .message .text_wrapper {
  display: inline-block;
  padding: 15px;
  border-radius: 6px;
  width: calc(100% - 85px);
  min-width: 100px;
  position: relative;
}
.messages .message .text_wrapper::after, .messages .message .text_wrapper:before {
  top: 18px;
  border: solid transparent;
  content: " ";
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none;
}
.messages .message .text_wrapper::after {
  border-width: 13px;
  margin-top: 0px;
}
.messages .message .text_wrapper::before {
  border-width: 15px;
  margin-top: -2px;
}
.messages .message .text_wrapper .text {
  font-size: 18px;
  font-weight: 300;
}

.bottom_wrapper {
  position: relative;
  width: 100%;
  background-color: #fff;
  padding: 20px 20px;
  position: absolute;
  bottom: 0;
}
.bottom_wrapper .message_input_wrapper {
  display: inline-block;
  height: 50px;
  border-radius: 25px;
  border: 1px solid #bcbdc0;
  width: calc(100% - 160px);
  position: relative;
  padding: 0 20px;
}
.bottom_wrapper .message_input_wrapper .message_input {
  border: none;
  height: 100%;
  box-sizing: border-box;
  width: calc(100% - 40px);
  position: absolute;
  outline-width: 0;
  color: gray;
}
.bottom_wrapper .send_message {
  width: 140px;
  height: 50px;
  display: inline-block;
  border-radius: 50px;
  background-color: #a3d063;
  border: 2px solid #a3d063;
  color: #fff;
  cursor: pointer;
  transition: all 0.2s linear;
  text-align: center;
  float: right;
}
.bottom_wrapper .send_message:hover {
  color: #a3d063;
  background-color: #fff;
}
.bottom_wrapper .send_message .text {
  font-size: 18px;
  font-weight: 300;
  display: inline-block;
  line-height: 48px;
}

.message_template {
  display: none;
}

</style>
</html>

