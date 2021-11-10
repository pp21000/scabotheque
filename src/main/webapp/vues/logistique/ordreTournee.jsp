<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

  <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Planifications des tournées</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
  
  

<div class="card card-lightblue">
    <div class="card-body">
      <div class="row">
        <form:form class="col-sm-4 row" method="post" modelAttribute="criteriaLog" action="chargeTournee">
          <form:input type="hidden" name="zone" path="zone"/>
          <!-- Date -->
          <div class="form-group px-1">
            <label>Date de livraison:</label>
            <div class="input-group date" id="reservationdate" data-target-input="nearest">
                <form:input class="form-control" type="date" path="dateLivraison" placeholder="Date de livraison"/>
            </div>
          </div>
          <div class="form-group px-2 ">
            <label>Dépot</label>
            <form:select class="form-control" name="codeAgence" path="codeAgence">
              <form:options items="${agenceList}" itemValue="code" itemLabel="code" />
            </form:select>	
          </div>
          <div class="form-group px-1 d-flex align-items-end">
            <button id="actionButton" class="btn btn-info btn-block" type="submit">
              <span id="actionSpinner" class="spinner-border  text-light spinner-border-sm d-none" role="status" aria-hidden="true"></span>
              Interroger RUBIS
            </button>
          </div>
        </form:form>

        <form:form class="col-sm-4 row" method="post" modelAttribute="criteriaLog" action="ordreTournee">
          <form:input type="hidden" name="dateLivraison" path="dateLivraison"/>
          <form:input type="hidden" name="codeAgence" path="codeAgence"/>
          <div class="form-group px-2 ">
            <label>Zone</label>
            <form:select class="form-control" autofocus="true" path="zone" items="${zonePrep}" />
          </div>
          <div class="form-group px-2 d-flex align-items-end">
            <button id="actionButton" class="btn btn-info btn-block" type="submit">
              <span id="actionSpinner" class="spinner-border  text-light spinner-border-sm d-none" role="status" aria-hidden="true"></span>
              Charger les données de la zone
            </button>
          </div>
        </form:form>

           
        </div>
    </div>
    <!-- /.card-body -->
</div>
<!-- /.card -->

<%--<form:form class="card card-lightblue" method="post" modelAttribute="criteriaLog" action="ordreTournee">--%>
<form:form class="card card-lightblue" method="post" modelAttribute="tourneeForm" action="sendMissionConducteur" >
    <div class="row">
        <div class="col-12">
            <div class="card-lightblue">
                <div class="card-header ">
                    <h3 class="card-title">Planification des ordres de tournées</h3>
                </div>   
                <!-- /.content-header -->
                <div class="card-body table-responsive p-0">
                    <table class="table table-condensed table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th>Ordre</th>
                                <th>Adherent</th>
                                <th>dpt</th>
                                <th>Lieu de déchargement</th>
                                <th>Commandes</th>
                                <th>Commentaire</th>
                                <!--<th>Adherent présent</th>-->
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${tourneeForm.tournees}" var="tournee" varStatus="status">
                                <tr>
                                    <td>
                                        <form:input type="hidden" path="tournees[${status.index}].Id"/>
                                        <form:input type="hidden" path="tournees[${status.index}].nomAdresse"/>
                                        <form:input type="hidden" path="tournees[${status.index}].codePostal"/>
                                        <form:input type="hidden" path="tournees[${status.index}].ville"/>
                                        <form:input type="hidden" path="tournees[${status.index}].user"/>
                                        <form:input style="width:50px" class="form-control" type="text" path="tournees[${status.index}].ordre"/>
                                    </td>
                                    <td>
                                        ${tournee.nomAdresse}
                                    </td>
                                    <td>
                                        ${tournee.codePostal}
                                    </td>
                                    <td>
                                        ${tournee.ville}
                                    </td>
                                    <td>
                                        <c:forEach items="${tournee.cmd}" var="cmd" varStatus="cmdStatus">
                                            <form:input type="hidden" path="tournees[${status.index}].cmd[${cmdStatus.index}].numeroBon"/>
                                            ${cmd.numeroBon} <br>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <form:input class="form-control" type="text" path="tournees[${status.index}].commentaire"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="card-footer">
                    <div class="row">

                        <div class="col-3">
                            <label for="selectCamion" class="col-form-label">Camion</label>
                            <form:select class="form-control" id="selectCamion" path="camionId">
                                <form:options items="${camions}" itemValue="id" itemLabel="libelle" />
                            </form:select>
                        </div>
                        <div class="col-3">
                            <label for="selectChauffeur" class="col-form-label">Chauffeur</label>
                            <form:select class="form-control" id="selectChauffeur" path="chauffeurId">
                                <form:options items="${chauffeurs}" itemValue="id" itemLabel="libelle" />
                            </form:select>
                        </div>
                        <div class="col-3">
                            <label for="selectTour" class="col-form-label">Tour :</label>
                            <form:select class="form-control" id="selectTour" path="tournee">
                                <form:option value="1"/>
                                <form:option value="2"/>
                                <form:option value="3"/>
                                <form:option value="4"/>
                            </form:select>
                        </div>
                        <div class="col-2 align-bottom">
                            <!--<button class="btn btn-info float-right " type="submit">Envoyer l'ordre de mission</button>-->
                            <button id="saveButton" class="btn btn-info float-right" type="submit">
                                <span id="saveSpinner" class="spinner-border text-light spinner-border-sm d-none" role="status" aria-hidden="true"></span>
                                Envoyer l'ordre de mission
                            </button>
                        </div>
                    </div>
                    <div>
                        <form:errors class="error" path="messageErreur" />
                    </div>
                </div>
                <!-- /.card footer-->
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

