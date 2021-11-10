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
        <form:form class="form-inline ml-3" id="searchform" method="post" modelAttribute="criteria" action="listeContact">
          <form:input type="hidden" name="contactFonctionIds" path="contactFonctionIds"/>
          <spring:message code="label.texteRecherche" var="recherchePH"/>
          <div class="input-group input-group-sm">
            <form:input class="form-control" type="search" path="text" placeholder="${recherchePH}" aria-label="Search" autofocus="true"/>
            <span class="input-group-append">
              <button class="btn btn-info btn-flat" type="submit"> 
                <i class="fas fa-search"></i>
              </button>
              <c:url value="/initListeContact" var="urlInit"/>
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
<form:form class="card card-outline card-info collapsed-card" id="advanceSerachForm" method="post" modelAttribute="criteria" action="listeContact">
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

<!-- Default box -->
<div class="card card-lightblue">
  <div class="card-header">
    <h3 class="card-title">Résultat : <spring:message code="count.contact" arguments="${nbContact}"/></h3>
    <div class="card-tools">
      <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
      <button type="button" class="btn btn-tool" data-card-widget=""></i></button>
    </div>
  </div>
   
  <div class="card-body">
    <div class="row d-flex align-items-stretch">
      <c:forEach items="${listeContacts}" var="contact">
        <div class="col-12 col-sm-6 col-md-3 d-flex align-items-stretch">
          <div class="card bg-light" style="width: 100%;">
            <div class="card-body">
              <div class="row">
                <div class="col-7">
                  <h2 class="lead"><b><c:out value="${contact.prenom}"/> <c:out value="${contact.nom}"/></b></h2>
                  <p class="text-muted text-sm"><c:out value="${contact.mail}"/> </p>
                  <p class="text-muted text-sm"><b> <spring:message code="label.nom"/> </b><c:out value="${contact.adherent.libelle}"/> <br>
                  <b> <spring:message code="label.codeAdh"/> </b><c:out value="${contact.adherent.code}"/> </p>
                </div>
                <div class="col-5 text-center">
                  <c:choose >
                    <c:when test = "${contact.photoImg == ''}"> 
                      <img src="<c:url value="/resources/images/noAdh.png" />" alt="" class="img-fluid" style="max-width: 8em; max-height: 8em;">
                    </c:when>
                    <c:otherwise> 						
                      <img src="${contact.photoImg}" alt="" class="mb-2 img-fluid" style="max-width: 8em; max-height: 8em;">
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div>
            <div class="card-footer">
              <div class="text-right">
                <c:url value="/adherentProfil" var="urlShowAdh"><c:param name="idAdh" value="${contact.adherent.id}"/></c:url>
                <a href="${urlShowAdh}" class="btn btn-sm btn-success">
                  <i class="fas fa-user"></i> Profil adherent
                </a>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>

    </div>
  </div>
  <!-- /.card-body -->

  <div class="card-footer">
    <nav aria-label="Contacts Page Navigation">
      <ul class="pagination justify-content-center m-0">
        <c:if test="${page > 2}"> 
          <li class="page-item"><a class="page-link" href="listeContact?page=1">&laquo;</a></li>
          <li class="page-item"><a class="page-link" href="listeContact?page=${page - 1}">&lsaquo;</a></li>
        </c:if>
        <c:forEach var="i" begin="${page == 1 ? 1 : page-1}" end="${page == maxPage ? maxPage : page+1 }">
          <li class="page-item <c:if test="${page == i}"> active </c:if>"><a class="page-link" href="adherentListe?page=${i}">${i}</a></li>
        </c:forEach>
        <c:if test="${page < maxPage -1 }"> 
          <li class="page-item"><a class="page-link" href="listeContact?page=${page + 1}">&rsaquo;</a></li>
          <li class="page-item"><a class="page-link" href="listeContact?page=${maxPage}">&raquo;</a></li>
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
    </div>
  </div>
</aside>
<!-- /.control-sidebar -->      

