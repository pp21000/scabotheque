<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link type="text/css" rel="stylesheet"
          href="<c:url value="/resources/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css" />"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/style/scabotheque.css" />"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.3/flowbite.min.css" rel="stylesheet" />
    <script src="https://unpkg.com/flowbite@1.5.3/dist/datepicker.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>

  </head>

  <body class="hold-transition login-page" style="background-image: url(resources/dist/img/Background-Scabois.png); background-size: cover;">

    <div class="flex h-screen">

      <section class="m-auto bg-gray-900 rounded-3xl px-16 py-16">
        <div class="flex flex-col items-center justify-center">
          <a href="#" class="flex items-center mb-6 text-2xl font-semibold text-gray-900 dark:text-white">
            <img class="h-12 mr-2" src="<c:url value="/resources/images/Scabotheques.png" />" class="col-sm-3 mb-3" style="opacity: .9">
          </a>
          <div class="w-full bg-gray rounded-lg shadow md:mt-0 sm:max-w-md xl:p-0">
            <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
              <h1 class="text-xl my-4 font-bold leading-tight tracking-tight text-white md:text-2xl">
                <spring:message code="label.connect"/>
              </h1>

              <form class="space-y-4 md:space-y-6 mt-auto" name='f' action="loginProcess" method='POST'>
                <div>
                  <!--<label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your email</label>-->
                  <input name="username" class="form-control" placeholder="E-mail / identifiant" autofocus='true'>
                  <!--<input type="email" name="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="name@company.com" required="">-->
                </div>
                <div>
                  <!--<label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>-->
                  <input name="password" class="form-control" placeholder="Mot de passe" type="password">
                  <!--<input type="password" name="password" id="password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" required="">-->
                </div>
                <div class="row">
                  <div><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/></div>

                  <!-- /.col -->
                  <div class="col-6 mx-auto">
                    <button type="submit" class="w-full text-white bg-gray-800 hover:bg-gray-900 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-md py-3 dark:focus:ring-primary-800">
                      Se connecter
                    </button>
                  </div>
                  <!-- /.col -->
                </div>

              </form>
            </div>
          </div>
        </div>
      </section>
    </div>
  </body>
</html>