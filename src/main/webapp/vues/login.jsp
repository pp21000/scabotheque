<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@page session="true"%>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Scabothèque</title>
        <link rel="icon shortcut" href="<c:url value="/resources/images/favicon.png"/>"/>
        
        <script src="https://kit.fontawesome.com/0d809d1677.js" crossorigin="anonymous"></script>

        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="resources/plugins/fontawesome-free/css/all.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
        <!-- icheck bootstrap -->
        <link rel="stylesheet" href="resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="resources/dist/css/adminlte.min.css">
        <!-- Google Font: Source Sans Pro -->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    </head>

    <body class="hold-transition login-page" style="background-image: url(resources/dist/img/Background-Scabois.png); background-size: cover;">
        <div class="login-logo">
            <a href="startV2"><img src="resources/dist/img/Scabotheques.png" class="col-sm-3 mb-3" style="opacity: .9"></a>
        </div>
            
        <div class="login-box">
            <!-- /.login-logo --> toto
            <div class="card">
                <div class="card-body login-card-body">
                    <p class="login-box-msg"><spring:message code="label.connect"/></p>
                    <div class="msg"><%=request.getParameter("msg")%></div>
                    <form name='f' action="loginProcess" method='POST'>
                        <c:if test="${not empty msg}">
                            <div class="msg">${msg}</div>
                        </c:if>

            <!-- 		<form class="textAlignRight" name='f' action="login" method='POST'> -->
            <!--		<form class="textAlignRight" name='f' action="loginProcess" method='POST'>-->
                        <div class="input-group mb-3">
                            <input name="username" class="form-control" placeholder="Email / identifiant" autofocus='true'>
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-envelope"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <input name="password" type="password" class="form-control" placeholder="Password">
                            <div class="input-group-append">
                                <div class="input-group-text">
                                    <span class="fas fa-lock"></span>
                                </div>
                            </div>
                        </div>


                                <!--<div><input type='text' name='username'  autofocus='true' placeholder='Utilisateur (adresse e-mail)'/></div>-->
                                    <!--<div><input type='password' name='password' placeholder='Mot de passe'/></div>-->
                                    <!--<div><button class="action-button" type="submit">Se connecter</button></div>-->
                        <div class="row">
                            <div><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></div>

                            <div class="col-6">
                            </div>
                            <!-- /.col -->
                            <div class="col-6">
                                  <button type="submit" class="btn btn-primary btn-block">Se connecter</button>
                            </div>
                            <!-- /.col -->
                        </div>
                    </form>
                <!--</fieldset>-->
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="resources/plugins/jquery/jquery.min.js"></script>
        <!-- Bootstrap 4 -->
        <script src="resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <!-- AdminLTE App -->
        <script src="resources/dist/js/adminlte.min.js"></script>

    </body>
</html>