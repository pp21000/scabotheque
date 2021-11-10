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
      <div class="col-sm-2">
        <h1 class="m-0 text-dark">Base adhérents</h1>
        <div <c:if test = "${criteria.avertissement == ''}"> style="display: none;" </c:if> >
          ${criteria.avertissement}
        </div>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <!-- ADH SEARCH FORM -->
        <form:form class="form-inline ml-3" id="searchform" method="post" modelAttribute="criteria" action="adherentListe">
          <form:input type="hidden" name="contactFonctionIds" path="contactFonctionIds"/>

          <spring:message code="label.texteRecherche" var="recherchePH"/>
          <%--<spring:message code="label.filtre.pole" var="poleLib"/>--%>
          <%--<spring:message code="label.filtre.secteur" var="secteurLib"/>--%>
          <%--<spring:message code="label.filtre.activite" var="activiteLib"/>--%>
          <%--<spring:message code="label.filtre.agence" var="agenceLib"/>--%>

          <div class="input-group input-group-sm">
            <form:input class="form-control" type="search" path="text" placeholder="${recherchePH}" aria-label="Search" autofocus="true"/>
            <span class="input-group-append">
              <button class="btn btn-info btn-flat" type="submit"> 
                <i class="fas fa-search"></i>
              </button>
              <c:url value="/initListeAdherents" var="urlInit"/>
              <button class="btn btn-info btn-flat" type="reset" title="<spring:message code="label.initRecherche"/>" onclick="window.location.href='${urlInit}'"> 
                <i class="fas fa-redo-alt"></i>
              </button>
            </span>
          </div>
        </form:form>  
      </div >
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- ADVANCE SEARCH -->
<form:form class="card card-outline card-info collapsed-card" id="advanceSerachForm" method="post" modelAttribute="criteria" action="adherentListe">
  <form:input type="hidden" name="text" path="text"/>
  <spring:message code="label.texteRecherche" var="recherchePH"/>
  <div class="card-header">
    <h3 class="card-title">Recherche avancée</h3>
    <div class="card-tools">
      <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-plus"></i></button>
      <button type="button" class="btn btn-tool" data-card-widget="collapse"></i></button>
    </div>
  </div>
  <!-- /.card-header -->
  <div class="card-body">
    <div class="row">
      <div class="col-md-4">
        <div class="form-group">
          <label>Pôle</label>
          <form:select class="form-control select2" name="poleIds" data-placeholder="Tous les poles" path="poleIds" multiple="multiple" >
            <form:options items="${polesList}" itemValue="id" itemLabel="libelle" />
          </form:select>
        </div>
        <!-- /.form-group -->
        <div class="form-group">
          <label>Secteurs</label>
          <form:select class="form-control select2" name="secteurIds" data-placeholder="Tous les secteurs" path="secteurIds" multiple="multiple" >
            <form:options items="${secteursList}" itemValue="id" itemLabel="libelle" />
          </form:select>
        </div>
        <!-- /.form-group -->
      </div>
      <!-- /.col -->
      <div class="col-md-4">
        <div class="form-group">
          <label>Activitées</label>
          <form:select class="form-control select2" name="activiteIds" data-placeholder="Tous les activitées" path="activiteIds" multiple="multiple" >
            <form:options items="${activitesList}" itemValue="id" itemLabel="libelle" />
          </form:select>
        </div>
        <!-- /.form-group -->
        <div class="form-group">
          <label>Agences</label>
          <form:select class="form-control select2" name="agenceIds" data-placeholder="Toutes les agences" path="agenceIds" multiple="multiple" >
            <form:options items="${agencesList}" itemValue="id" itemLabel="libelle" />
          </form:select>
        </div>
        <!-- /.form-group -->
      </div>
      <!-- /.col -->
      <div class="col-md-4">
        <div class="form-group">
          <label>Type</label>
          <form:select class="form-control select2" name="typeAdhIds" data-placeholder="Type d'adhérent" path="typeAdhIds" multiple="multiple" >
            <form:options items="${adhTypesList}" itemValue="id" itemLabel="libelle" />
          </form:select>
        </div>
        <!-- /.form-group -->
      </div>
    </div>
    <!-- /.row -->
    <div class="row">
      <div class="w-100 col-md-3">
        <div class="form-group clearfix">
          <form:checkbox id="showAdminOnly" name="showAdminOnly" path="showAdminOnly"/> 
          <label style="float:none;" for="showAdminOnly"><spring:message code="label.filtre.isAdministrateur"/></label>
        </div>
      </div>
      <!-- /.col -->
      <div class="w-100 col-md-3">
        <!-- checkbox -->
        <div class="form-group clearfix">
          <form:checkbox id="showSousCompte" name="showSousCompte" path="showSousCompte"/> 
          <label style="float:none;" for="showSousCompte"><spring:message code="label.filtre.sousCompte"/></label>                                                        
        </div>
      </div>
      <!-- /.col -->
      <div class="w-100 col-md-3">
        <div class="form-group clearfix">
          <form:checkbox id="showArtipoleOnly" name="showArtipoleOnly" path="showArtipoleOnly"/> 
          <label style="float:none;" for="showArtipoleOnly"><spring:message code="label.filtre.isArtipole"/></label>
        </div>
      </div>
      <!-- /.col -->
      <div class="w-100 col-md-3">
        <div class="form-group clearfix">
          <form:checkbox id="showAll" name="showAll" path="showAll"/> 
          <label style="float:none;" for="showAll"><spring:message code="label.filtre.inactif"/></label>
        </div>
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </div>
  <!-- /.card-body -->
  <div class="card-footer">
    <button id="actionButton" class="btn btn-info float-right" type="submit">
      <span id="actionSpinner" class="spinner-border text-light spinner-border-sm d-none" role="status" aria-hidden="true"></span>
      Rechercher
    </button>
  </div>
  <!--</div>-->
</form:form>
<!-- ADVANCE SEARCH -->


<!-- Statistique box 
<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION')">
  <div class="card card-secondary collapsed-card">
    <div class="card-header">
      <h3 class="card-title">Statistique</h3>
      <div class="card-tools">
        <button type="button" class="btn btn-tool" data-card-widget="collapse">
          <i class="fas fa-plus"></i>
        </button>
      </div>
    </div>
    <div class="card-body">
      <div class="card-body pad table-responsive">
        On peut imaginer ici des liens vers des graphiques concernant le resultat de la recherche ?
        sous forme de boutons:
        <br>
        <button type="button" class="btn btn-success ">Un graphique</button>
        <button type="button" class="btn btn-success">Un camembert</button>
        <button type="button" class="btn btn-success ">Un tableau</button>
        <button type="button" class="btn btn-success ">ou autre chose</button>
      </div>
    </div>
  </div>
</sec:authorize>
 Statistique box -->


<!-- Default box -->
<div class="card card-lightblue">
  <div class="card-header">
    <h3 class="card-title">Résultat : <spring:message code="count.adherent" arguments="${nbAdherent}"/></h3>

    <div class="card-tools">
      <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
        <i class="fas fa-minus"></i></button>
      <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title=""></button>
    </div>
  </div>
  <div class="card-body p-0">
    <table class="table table-striped contacts-list">
      <thead>
        <tr>
          <th style="width: 1%">
          </th>
          <th>
            <spring:message code="label.identite"/>
          </th>
          <th style="width: 10%">
            <spring:message code="label.secteur"/>
          </th>
          <th style="width: 10%">
            <spring:message code="label.agenceRattachement"/>
          </th>
          <th style="width: 10%">
            <spring:message code="label.pole"/>
          </th>
          <th style="width: 10%">
            <spring:message code="label.role"/>
          </th>
          <th style="width: 15%">
            <spring:message code="label.commune"/>
          </th>
          <th style="width: 6.5em">
          </th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${listeAdherents}" var="adherent">
          <tr>
            <td>
              <img alt="Avatar" class="img-fluid" style="max-width: 5em; max-height: 4em;"
                <c:choose >
                  <c:when test = "${adherent.photoImg == ''}"> 
                    src="<c:url value="/resources/images/noAdh.png" />"
                  </c:when>
                  <c:otherwise> 						
                    src="${adherent.photoImg}"
                  </c:otherwise>
              </c:choose>>
            </td>
            <td>
              <strong>
                <c:out value="${adherent.libelle}"/>
              </strong>
              <c:choose >
                <c:when test = "${adherent.compteType.id != '1'}"> 
                  <span class="badge bg-gradient-warning">
                    ${adherent.compteType.libelle}
                  </span>
                </c:when>
                <c:when test = "${adherent.cnxEolasAllow == false}"> 
                  <span class="badge bg-gradient-warning">
                    ! Access EOLAS !
                  </span>
                </c:when>
                <c:when test = "${adherent.etat.id == '2'}"> 
                  <span class="badge bg-gradient-danger">
                    <c:out value="${adherent.etat.libelle}"/>
                  </span>
                </c:when>
              </c:choose>
              <br/>
              <small>
                <c:out value="${adherent.code}"/>
              </small>
            </td>
            <td>
              <c:out value="${adherent.secteur.libelle}"/>
            </td>
            <td>
              <c:out value="${adherent.agence.libelle}"/>
            </td>
            <td>
              <c:out value="${adherent.pole.libelle}"/>
            </td>
            <td>
              <c:out value="${adherent.role.libelle}"/>
            </td>
            <td>
              <c:out value="${adherent.commune.codePostal}"/>  <c:out value="${adherent.commune.libelle}"/>
            </td>
            <td>
              <c:url value="/adherentProfil" var="urlShowAdh"><c:param name="idAdh" value="${adherent.id}"/></c:url>
              <a class="btn btn-success btn-sm" href="${urlShowAdh}">
                <i class="fas fa-user"></i>
                Detail
              </a>
            </div>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
    <!-- /.card-body -->
  <div class="card-footer">
    <nav aria-label="Contacts Page Navigation">
      <ul class="pagination justify-content-center m-0">
        <c:if test="${maxPage > 0}"> 
          <c:if test="${page > 2}"> 
            <li class="page-item"><a class="page-link" href="adherentListe?page=1">&laquo;</a></li>
            <li class="page-item"><a class="page-link" href="adherentListe?page=${page - 1}">&lsaquo;</a></li>
          </c:if>
          <c:forEach var="i" begin="${page == 1 ? 1 : page-1}" end="${page == maxPage ? maxPage : page+1 }">
            <li class="page-item <c:if test="${page == i}"> active </c:if>"><a class="page-link" href="adherentListe?page=${i}">${i}</a></li>
          </c:forEach>
          <c:if test="${page < maxPage -1 }"> 
            <li class="page-item"><a class="page-link" href="adherentListe?page=${page + 1}">&rsaquo;</a></li>
            <li class="page-item"><a class="page-link" href="adherentListe?page=${maxPage}">&raquo;</a></li>
          </c:if>
        </c:if>
      </ul>
    </nav>
  </div>
  <!-- /.card-footer --> 
</div>
<!-- /.card -->

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
  <div class="p-3 control-sidebar-content">
    <h5> Options </h5>
    <hr class="mb-2"/>

    <!-- Control sidebar content goes here -->
    <div class="mb-1" >
      <a href="addAdherent" class="nav-link">
        <p>
          <i class="nav-icon fas fa-user-lock"></i>
          Ajouter un adhérent
        </p>
      </a>
     
      <form:form id="exportListForm" method="post" modelAttribute="criteria" action="exportList">
        <form:input type="hidden" name="text" path="text"/>
        <form:input type="hidden" name="poleIds" path="poleIds"/>
        <form:input type="hidden" name="secteurIds" path="secteurIds"/>
        <form:input type="hidden" name="activiteIds" path="activiteIds"/>
        <form:input type="hidden" name="showAll" path="showAll"/>
        <form:input type="hidden" name="showSousCompte" path="showSousCompte"/>
        <form:input type="hidden" name="showAdminOnly" path="showAdminOnly"/>
        <form:input type="hidden" name="showArtipoleOnly" path="showArtipoleOnly"/>

        
        <a href="javascript:;" onclick="parentNode.submit();">
          <p>
            <%--<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPORT_INTERNE )">--%>
              <%--<form:checkbox id="exportAll" name="exportAll" path="exportAll"/>--%> 
              <!--<label for="exportAll"><spring:message code="label.exportAll"/></label>-->
            <%--</sec:authorize>--%>
            <i class="nav-icon fas fa-user-lock"></i>
            <spring:message code="menu.exportExcel"/>
          </p>
        </a>
      </form:form>
    </div>
  </div>
</aside>
<!-- /.control-sidebar -->      

