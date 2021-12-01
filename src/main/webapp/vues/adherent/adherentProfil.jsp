<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Profil Adhérent</h1>
      </div>
<!--          <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item active">User Profile</li>
        </ol>
      </div>-->
    </div>
  </div><!-- /.container-fluid -->
</section>

<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-3">
        <!-- Profile Image -->
        <div class="card card-success card-outline">
          <div class="card-body box-profile">
            <div class="text-center">
              <c:choose >
                <c:when test = "${adherent.photoImg == ''}"> 
                  <img class="profil-user-img img-fluid" src="<c:url value="/resources/images/noAdh.png" />" />
                </c:when>
                <c:otherwise> 						
                  <img class="profil-user-img img-fluid" src="${adherent.photoImg}">
                </c:otherwise>
              </c:choose>
            </div>

            <h3 class="profile-username text-center">${adherent.denomination}</h3>
            <p class="text-muted text-center"><spring:message code="label.codeAdh"/> : <b>${adherent.code}</b></p>

            <ul class="list-group list-group-unbordered mb-3">
              <li class="list-group-item">
                <b><spring:message code="label.adhArtipole"/></b>
                <a class="float-right">
                  <c:choose>
                    <c:when test="${adherent.isArtipole}"><spring:message code="yes"/></c:when> 
                    <c:otherwise><spring:message code="no"/></c:otherwise> 
                  </c:choose>
                </a>
              </li>
              <li class="list-group-item">
                <b><spring:message code="label.pole"/></b> <a class="float-right">${adherent.pole.libelle}</a>
              </li>
              <li class="list-group-item">
                <b><spring:message code="label.agenceRattachement"/></b> <a class="float-right">${adherent.agence.libelle}</a>
              </li>
            </ul>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->

        <!-- Identité -->
        <div class="card card-success">
          <div class="card-header">
            <h3 class="card-title"><spring:message code="label.identite"/></h3>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <strong><i class="fas fa-crosshairs mr-1"></i> <spring:message code="label.secteur"/></strong>
            <p class="text-muted">${adherent.secteur.libelle}</p>
            <hr>
            <strong><i class="fas fa-map-marker-alt mr-1"></i> <spring:message code="label.adresse"/></strong>
            <p class="text-muted">${adherent.adresse}<br> 
                <c:if test="${adherent.adresseComplement}!= ''" > ${adherent.adresseComplement}<br></c:if>
                <spring:message code="message.commune" arguments="${adherent.commune.codePostal}, ${adherent.commune.libelle}"/>
            </p>
            <hr>
            <strong><i class="fas fa-search mr-1"></i> <spring:message code="label.nomRecherche"/></strong>
            <p class="text-muted">${adherent.libelle}</p>
            <hr>
            <strong><i class="fas fa-id-badge mr-1"></i> <spring:message code="label.denomination"/></strong>
            <p class="text-muted">${adherent.denomination}</p>
            <hr>
            <strong><i class="far fa-file-alt mr-1"></i> Notes</strong>
            <p class="text-muted">${commentaire}</p>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
          
      <!-- /.col -->
      <div class="col-md-9">
        <div class="card card-success card-tabs">
          
          <!--Liste des onglets-->
          <div class="card-header p-0 pt-1">
            <ul class="nav nav-tabs">
              <li class="nav-item"><a class="nav-link active" href="#contact" data-toggle="tab"><i class="fas fa-user-friends mr-2"></i><spring:message code="label.contacts"/></a></li>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION')">
                <li class="nav-item"><a class="nav-link" href="#logistique" data-toggle="tab"><i class="far fa-address-book mr-2"></i><spring:message code="label.exploitation"/></a></li>
              </sec:authorize>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CRM')">
                <li class="nav-item"><a class="nav-link" href="#CRM" data-toggle="tab"><i class="fa fa-comments-o mr-2"></i><spring:message code="label.crm"/></a></li>
              </sec:authorize>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_INFORMATIQUE')">
                <li class="nav-item"><a class="nav-link" href="#informatique" data-toggle="tab"><i class="fa fa-desktop mr-2"></i><spring:message code="label.informatique"/></a></li>
              </sec:authorize>
            </ul>
          </div><!-- /.card-header -->

          <div class="card-body">
            <div class="tab-content">
              
              <!--Contacts-->
              <div class="active tab-pane" id="contact">
                <div class="card-body pb-0">
                  <div class="row d-flex align-items-stretch">
                    <c:forEach items="${contacts}" var="contact">
                      <div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch">
                        <div class="card bg-light" style="width: 100%;">
                          <div class="card-body pt-0">
                            <div class="row">
                              <div class="col-7">
                                <h2 class="lead"><b><c:out value="${contact.civilite} ${contact.nom} ${contact.prenom}"/></b></h2>
                                <p class="text-muted text-sm"><b>Fonction: </b><c:out value="${contact.fonction.libelle}"/> </p>
                                <ul class="ml-1 mb-0 fa-ul text-muted">
                                  <li class="small">${contact.mail}</li>
                                  <li class="small">${contact.fixe}</li>
                                  <li class="small">${contact.mobile}</li>
                                  <li class="small"><fmt:formatDate pattern="dd/MM/yyyy" value="${contact.dateNaissance}" /> <spring:message code="Age" arguments="${contact.age}"/> </li>
                                </ul>
                              </div>
                              <div class="col-5 text-center">
                                <c:choose >
                                  <c:when test = "${contact.photoImg == ''}"> 
                                    <img class="profil-user-img img-fluid" src="<c:url value="/resources/images/noAdh.png" />" />
                                  </c:when>
                                  <c:otherwise> 						
                                    <img class="profil-user-img img-fluid" src="${contact.photoImg}">
                                  </c:otherwise>
                                </c:choose>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                </div>
                <!-- /.card-body -->
              </div>
                
              <!--Exploitation-->
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION')">
                <div class="tab-pane" id="logistique">
                  <div class="card-body pt-0">

                    <div class="post">
                      <div class="user-block">
                        <span class="username text-success">
                            Livraison
                        </span>
                      </div>
                      <div class="form-group row">
                        <label for="adresseLiv" class="col-sm-3 col-form-label"><spring:message code="label.adresseLivraison"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="adresseLiv">${infoExploitation.adresseLivraison}</span> 
                        </div>
                        <label for="complLiv" class="col-sm-3 col-form-label"><spring:message code="label.adresseComplement"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="complLiv">${infoExploitation.adresseComplement}</span> 
                        </div>
                        <label for="cpLiv" class="col-sm-3 col-form-label"><spring:message code="label.commune"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="cpLiv"><spring:message code="message.commune" arguments="${infoExploitation.commune.codePostal}, ${infoExploitation.commune.libelle}"/></span> 
                        </div>
                      </div>
                    </div>

                    <div class="post">
                      <div class="user-block">
                        <span class="username text-success">
                            Agence
                        </span>
                      </div>
                      <div class="form-group row">
                        <label for="agence" class="col-sm-3 col-form-label"><spring:message code="label.agenceRattachement"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="agence">${adherent.agence.libelle}</span> 
                        </div>
                        <label for="agence" class="col-sm-3 col-form-label"><spring:message code="label.secteur"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="agence">${adherent.secteur.libelle}</span> 
                        </div>
                        <label for="agence" class="col-sm-3 col-form-label"><spring:message code="label.tournee"/></label>
                        <div class="col-sm-9 col-form-label">
                          <span id="agence">${adherent.tournee.libelle}</span> 
                        </div>
                      </div>
                    </div>
                          
                    <div class="post">
                      <div class="user-block">
                        <span class="username text-success">
                            <spring:message code="label.contactLogistique"/>
                        </span>
                      </div>
                        <div class="form-group row">
                          <label for="agence" class="col-sm-3 col-form-label">${infoExploitation.contact1.getLibelle}</label>
                          <div class="col-sm-9 col-form-label">
                            <span id="agence">${infoExploitation.contact1.getMobile}</span> 
                          </div>
                          <label for="agence" class="col-sm-3 col-form-label">${infoExploitation.contact2.getLibelle}</label>
                          <div class="col-sm-9 col-form-label">
                            <span id="agence">${infoExploitation.contact2.getMobile}</span> 
                          </div>
                      </div>
                    </div>
                          
                          <div class="post">
                      <div class="user-block">
                        <span class="username text-success">
                            Info Livraison
                        </span>
                      </div>
                        <div class="form-group row">
                          <label for="agence" class="col-sm-3 col-form-label"><spring:message code="label.accesSemi"/></label>
                          <div class="col-sm-9 col-form-label">
                            <span id="agence">
                              <c:choose>
                                <c:when test="${infoExploitation.isAccesSemi}"><spring:message code="yes"/></c:when> 
                                <c:otherwise><spring:message code="no"/></c:otherwise> 
                              </c:choose>
                            </span> 
                          </div>
                          <label for="agence" class="col-sm-3 col-form-label"><spring:message code="label.outilDechargement"/></label>
                          <div class="col-sm-9 col-form-label">
                            <span id="agence"> 
                              <c:choose>
                                <c:when test="${infoExploitation.isMaterielDechargement}"><spring:message code="yes"/></c:when> 
                                <c:otherwise><spring:message code="no"/></c:otherwise> 
                              </c:choose>
                            </span> 
                          </div>
                          <label for="agence" class="col-sm-3 col-form-label"><spring:message code="label.authorisationOutils"/></label>
                          <div class="col-sm-9 col-form-label">
                            <span id="agence"> 
                              <c:choose>
                                <c:when test="${infoExploitation.isAuthorise}"><spring:message code="yes"/></c:when> 
                                <c:otherwise><spring:message code="no"/></c:otherwise> 
                              </c:choose>
                            </span> 
                          </div>
                          <label for="agence" class="col-sm-3 col-form-label"><spring:message code="label.commentaireMateriel"/></label>
                          <div class="col-sm-9 col-form-label">
                            <p id="agence"> 
                              ${infoExploitation.outillageCommentaire}
                            </p> 
                          </div>
                          
                          <label for="agence" class="col-sm-3 col-form-label"><spring:message code="label.protocolDechargement"/></label>
                          <div class="col-sm-9 col-form-label">
                            <p id="agence"> 
                              ${infoExploitation.dechargementProtocol}
                            </p> 
                          </div>
                      </div>
                    </div>
                          
                    <div class="post">
                      <div class="user-block">
                        <span class="username text-success">
                            Horaires d'ouvertures
                        </span>
                      </div>
                      <div class="form-group row">
                        <label for="agence" class="col-sm-2 col-form-label">Lundi</label>
                        <div class="col-sm-10 col-form-label">
                          <span id="agence"></span> 
                        </div>
                        <label for="agence" class="col-sm-2 col-form-label">Mardi</label>
                        <div class="col-sm-10 col-form-label">
                          <span id="agence"></span> 
                        </div>
                        <label for="agence" class="col-sm-2 col-form-label">Mercredi</label>
                        <div class="col-sm-10 col-form-label">
                          <span id="agence"></span> 
                        </div>
                        <label for="agence" class="col-sm-2 col-form-label">Jeudi</label>
                        <div class="col-sm-10 col-form-label">
                          <span id="agence"></span> 
                        </div>
                        <label for="agence" class="col-sm-2 col-form-label">Vendredi</label>
                        <div class="col-sm-10 col-form-label">
                          <span id="agence"></span> 
                        </div>
                      </div>
                    </div>
                            
                    <div class="post">
                      <div class="user-block">
                        <span class="username text-success">
                            Information Complementaires
                        </span>
                      </div>
                      <div class="form-group row">
                        <label for="agence" class="col-sm-2 col-form-label">Longitude</label>
                        <div class="col-sm-10 col-form-label">
                          <span id="agence">${adherent.longitude}</span> 
                        </div>
                        <label for="agence" class="col-sm-2 col-form-label">Longitude</label>
                        <div class="col-sm-10 col-form-label">
                          <span id="agence">${adherent.latitude}</span> 
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.tab-pane -->
              </sec:authorize>
                
              <!--CRM-->
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CRM')">
                <div class="tab-pane" id="CRM">
                  <div class="card-body pt-0">
                    <form:form class="addAdherentSuivi" method="post" modelAttribute="suiviToAdd" action="edit/addAdherentSuivi" >
                      <form:input type="hidden" path="suiviVisiteAdh.adherentId"/>
                      <div class="post">
                        <button class="btn btn-success" id="openFormButton" type="button">Ajouter un suivi</button>
                      </div>
                      <div  id="openForm" class="post" style="display:none" title="Ajouter un contact" >
                        <fieldset>
                          <legend ><spring:message code="label.addSuivi"/></legend>
                          <div class="user-block">
                            <form:label path="suiviVisiteAdh.dateCommentaire"><spring:message code="label.dateSuivi"/></form:label>
                              <div class="col-2" id="reservationdate" data-target-input="nearest">
                                  <form:input class="form-control" type="date" path="suiviVisiteAdh.dateCommentaire" placeholder="Date de livraison"/>
                              </div>
                            <form:errors class="errors" path="suiviVisiteAdh.dateCommentaire" />
                          </div> 
                          <form:textarea class="form-control form-control-sm" id="summernote" name="editordata" path="suiviVisiteAdh.commentaire" />
                          <button class="btn btn-success" type="submit">Enregistrer le suivi</button>
                        </fieldset>
                      </div>
                    </form:form>
                    
                    <c:forEach items="${infoSuiviVisite}" var="visite">
                      <div class="post">
                        <div class="user-block">
                          <span class="username">
                            <span>
                              <spring:message code="label.dateSuivi"/>
                              <fmt:formatDate pattern="dd/MM/yyyy" value="${visite.dateCommentaire}" />
                            </span>
                            <c:url value="/edit/editCRMAdh" var="url">
                              <c:param name="idAdh" value="${adherent.id}"/>
                              <c:param name="idSuivi" value="${visite.id}"/>
                            </c:url>
                            <a href="${url}" class="float-right btn-default"><i class="fa fa-pencil"></i></a>
                          </span>
                        </div>
                        <p>${visite.commentaireString}</p>
                      </div>
                    </c:forEach>
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.tab-pane -->
              </sec:authorize>
                
              <!--Informatique-->
              <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_INFORMATIQUE')">
                <div class="tab-pane" id="Informatique">
                  <div class="card-body pt-0">
                    Info
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.tab-pane -->
              </sec:authorize>
                
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.nav-tabs-custom -->
      </div>
      <!-- /.col -->
    </div>
  </div>
</section>

<!-- Control Sidebar -->
<aside class="control-sidebar control-sidebar-dark">
  <div class="p-3 control-sidebar-content">

    <h5> Options d'édition</h5>
    <hr class="mb-2"/>
        
    <!-- Control sidebar content goes here -->
    <div class="mb-1" >
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">    	
        <c:url value="/edit/editIdentiteAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="nav-link">
          <p>
            <i class="nav-icon fas fa-user-edit"></i>
            Infos adherent
          </p>
        </a>
      </sec:authorize>

      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_ADHERENT_EDIT')">    	
        <c:url value="/edit/editAdherentContact" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="nav-link">
          <p>
            <i class="far fa-address-book"></i>
            Contacts
          </p>
        </a>
      </sec:authorize>
      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_EXPLOITATION_EDIT')">    	
        <c:url value="/edit/editExploitationAdh" var="url"><c:param name="idAdh" value="${adherent.id}"/></c:url>
        <a href="${url}" class="nav-link">
          <p>
            <i class="fa fa-truck"></i>
            Logistique
          </p>
        </a>
      </sec:authorize>
      
      
    </div>
  </div>
</aside>
<!-- /.control-sidebar -->   

