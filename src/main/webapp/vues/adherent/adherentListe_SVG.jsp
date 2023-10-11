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
          <spring:message code="label.filtre.pole" var="poleLib"/>
          <spring:message code="label.filtre.secteur" var="secteurLib"/>
          <spring:message code="label.filtre.activite" var="activiteLib"/>
          <spring:message code="label.filtre.agence" var="agenceLib"/>

          <div class="input-group input-group-sm">
            <form:input class="form-control" type="search" path="text" placeholder="${recherchePH}" aria-label="Search" autofocus="true"/>
            <span class="input-group-append">
              <button class="btn btn-info btn-flat" type="submit"> 
                <i class="fas fa-search"></i>
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
          <label>Activités</label>
          <form:select class="form-control select2" name="activiteIds" data-placeholder="Tous les activités" path="activiteIds" multiple="multiple" >
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
<div class="card card-secondary">
  <div class="card-header">
    <h3 class="card-title py-2">Résultat : <spring:message code="count.adherent" arguments="${nbAdherent}"/></h3>
    <div class="card-tools">
      <button type="button" class="btn btn-tool" data-card-widget="collapse"><i class="fas fa-minus"></i></button>
      <button type="button" class="btn btn-tool" data-card-widget=""></i></button>
    </div>
  </div>
   
  <div class="card-body">
    <div class="row d-flex align-items-stretch">
      <c:forEach items="${listeAdherents}" var="adherent">
        <div class="col-12 col-sm-6 col-md-3 d-flex align-items-stretch">
          <div class="card bg-light" style="width: 100%;">
            <div class="ribbon-wrapper ribbon-lg">
              <c:choose >
                <c:when test = "${adherent.compteType.id != '1'}"> 
                  <div class="ribbon bg-gradient-warning">
                    ${adherent.compteType.libelle}
                  </div>
                </c:when>
                <c:when test = "${adherent.cnxEolasAllow == false}"> 
                  <div class="ribbon bg-gradient-warning">
                    ! Access EOLAS !
                  </div>
                  <div class="cercleOrange"></div>
                </c:when>
                <c:when test = "${adherent.etat.id == '2'}"> 
                  <div class="ribbon bg-gradient-danger">
                    <c:out value="${adherent.etat.libelle}"/>
                  </div>
                </c:when>
              </c:choose>
            </div>
            <div class="card-header text-muted border-bottom-0">
              <!--eventuellement un titre-->
            </div>
            <div class="card-body">
              <div class="row">
                <div class="col-7">
                  <h2 class="lead"><b><c:out value="${adherent.libelle}"/></b></h2>
                  <p class="text-muted text-sm"><b> <spring:message code="label.codeAdh"/> </b><c:out value="${adherent.code}"/> </p>
                  <ul class="ml-4 mb-0 fa-ul text-muted">
                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span> <c:out value="${adherent.agence.libelle}"/></li>
                    <li class="small"><span class="fa-li"><i class="fas fa-lg fa-address-card"></i></span> <c:out value="${adherent.commune.codePostal}"/>  <c:out value="${adherent.commune.libelle}"/></li>
                    <!--<li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> </li>-->
                  </ul>
                </div>
                <div class="col-5 text-center">
                  <c:choose >
                    <c:when test = "${adherent.photoImg == ''}"> 
                      <img src="<c:url value="/resources/images/noAdh.png" />" alt="" class="img-fluid" style="max-width: 8em; max-height: 8em;">
                    </c:when>
                    <c:otherwise> 						
                      <img src="${adherent.photoImg}" alt="" class="mb-2 img-fluid" style="max-width: 8em; max-height: 8em;">
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div>
            <div class="card-footer">
              <div class="text-right">
                <c:url value="/adherentProfil" var="urlShowAdh"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                <a href="${urlShowAdh}" class="btn btn-sm btn-success">
                  <i class="fas fa-user"></i> Profil adherent
                </a>
                  <c:url value="/adherentProfilAdmin" var="urlShowAdhAdmin"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                <a href="${urlShowAdhAdmin}" class="btn btn-sm btn-success">
                  <i class="fas fa-euro-sign"></i> Administratif
                </a>
                  <c:url value="/adherentProfilArtipole" var="urlShowAdhArtipole"><c:param name="idAdh" value="${adherent.id}"/></c:url>
                <a href="${urlShowAdhArtipole}" class="btn btn-sm btn-success">
                  <i class="fas fa-user"></i> Artipôle
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

