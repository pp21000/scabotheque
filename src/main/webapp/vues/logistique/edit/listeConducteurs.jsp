<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

       <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
<!--      <li class="nav-item d-none d-sm-inline-block">
        <a href="listeAdherents" class="nav-link">Ancienne base</a>
      </li>-->
    </ul>
    
    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
       <!--Messages Dropdown Menu--> 
        <li>
            <a class="nav-link" href="logout">Déconnexion</a>
        </li> 
        <li class="nav-item">
            <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#" role="button">
                <i class="fas fa-th-large"></i>
            </a>
        </li>
    </ul>
  </nav>
  <!-- /.navbar -->
  
  <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Liste des conducteurs</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>

<form:form class="card card-lightblue" method="post" modelAttribute="conducteursForm" action="listeConducteurs" >
    <div class="row">
        <div class="col-12">
            <div class="card-lightblue">
                <div class="card-header ">
                    <h3 class="card-title">Liste des conducteurs</h3>
                </div>   
                <!-- /.content-header -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-condensed table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th>position</th>
                                <th>Nom</th>
                                <th>Prénom</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${conducteursForm.conducteurs}" var="conducteur" varStatus="status">
                                <tr>
                                    <td>
                                        <form:input type="hidden" path="conducteurs[${status.index}].Id"/>
                                        <form:input style="width:50px" class="form-control" type="text" path="conducteurs[${status.index}].position"/>
                                    </td>
                                    <td>
                                        <form:input class="form-control" type="text" path="conducteurs[${status.index}].nom"/>
                                    </td>
                                    <td>
                                        <form:input class="form-control" type="text" path="conducteurs[${status.index}].prenom"/>
                                    </td>
                                    <td>
                                        supprimer
                                    </td>
                                </tr>
                            </c:forEach>
                            <form:form method="post" modelAttribute="newConducteur" action="AjoutConducteur">
                                <tr>
                                    <td>
                                        <form:input style="width:50px" class="form-control" type="text" path="position"/>
                                    </td>
                                    <td>
                                        <form:input class="form-control" type="text" path="nom"/>
                                    </td>
                                    <td>
                                        <form:input class="form-control" type="text" path="prenom"/>
                                    </td>
                                    <td>
                                        Ajouter
                                    </td>
                                </tr>
                                <!--<button class="btn btn-info" type="submit"><spring:message code="label.ajout" /></button>-->
                            </form:form>
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                    <div class="align-bottom">
                        <button class="btn btn-info float-right " type="submit">Enregistrer</button>
                    </div>
                    <div>
                        <form:errors class="error" path="messageErreur" />
                    </div>
                </div>
                <!-- /.card-footer -->
            </div>
            <!-- /.card -->
        </div>
    </div>
    <!-- /.row -->
</form:form>
    
<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
    <div class="p-3 control-sidebar-content">

        <h5> Options </h5>
        <hr class="mb-2"/>
        
        <!-- Control sidebar content goes here -->
        <div class="mb-1" >
            <a href="listeCamions" class="nav-link">
                <p>
                    <i class="nav-icon fas fa-truck"></i>
                    Liste des camions
                </p>
            </a>
        </div>
        <div class="mb-1" >
            <a href="listeConducteurs" class="nav-link">
                <p>
                    <i class="nav-icon fas fa-user-friends"></i>
                    Liste des conducteurs
                </p>
            </a>
        </div>
    </div>
</aside>
<!-- /.control-sidebar -->

