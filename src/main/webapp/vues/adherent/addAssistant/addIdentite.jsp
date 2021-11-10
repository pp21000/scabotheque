<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
  <!-- Left navbar links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
    </li>
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
    
<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Nouvel adhérent</h1>
      </div>
          <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="listeAdherents">Base adhérent</a></li>
          <li class="breadcrumb-item active">Nouvel Adherent</li>
        </ol>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>

<form:form class="content" method="post" modelAttribute="adhToAdd" action="addAdherent">
  <form:input type="hidden" path="adherent.id"/>
  <div class="row">
    <div class="col-md-6">
      <div class="card card-secondary">
        <div class="card-header">
          <h3 class="card-title"><spring:message code="label.identite"/></h3>
        </div>
        <div class="card-body">
          
          <div class="form-group">
            <form:label path="adherent.code" ><spring:message code="label.codeAdh"/></form:label>
            <form:input class="form-control" name="adherent.code" path="adherent.code" autofocus="true"/>
            <form:errors class="bg-danger" path="adherent.code" />
          </div>
		
          <div class="form-group">
            <form:label path="adherent.codeERP" ><spring:message code="label.codeERP"/></form:label>
            <form:input class="form-control" name="adherent.codeERP" path="adherent.codeERP" autofocus="true"/>
            <form:errors class="bg-danger" path="adherent.codeERP" />
          </div>
		
          <div class="form-group">
            <form:label path="adherent.libelle" ><spring:message code="label.nomRecherche"/></form:label>
            <form:input class="form-control" name="adherent.libelle" path="adherent.libelle"/>
            <form:errors class="bg-danger" path="adherent.libelle" />
          </div>
		
          <div class="form-group">
            <form:label path="adherent.denomination" ><spring:message code="label.denomination"/> </form:label>
            <form:input class="form-control" name="adherent.denomination" path="adherent.denomination"/>
            <form:errors class="bg-danger" path="adherent.denomination" />
          </div>

          <div class="form-group">
            <form:label path="adherent.adresse" ><spring:message code="label.adresse"/></form:label>
            <form:input class="form-control" name="adherent.adresse" path="adherent.adresse"/>
            <form:errors class="bg-danger" path="adherent.adresse" />
          </div>

          <div class="form-group">
            <form:label path="adherent.adresseComplement" ><spring:message code="label.adresseComplement"/></form:label>
            <form:input class="form-control" name="adherent.adresseComplement" path="adherent.adresseComplement"/>
            <form:errors class="bg-danger" path="adherent.adresseComplement" />
          </div>

          <div class="form-group">
            <form:label path="adherent.commune" ><spring:message code="label.commune"/></form:label>
            <div class="input-group">
              <input type="text" class="form-control" id="communeAdhLibelle" disabled/>
              <div class="input-group-prepend">
                <a class="input-group-text" href="#" id="editAdhCommune" data-toggle="modal" data-target="#modal-adherentCommune"><i class="fas fa-map-marked-alt"></i></a>
              </div>
            </div>
            <form:errors class="bg-danger" path="adherent.commune" />
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    
          
      <div class="card card-secondary">
        <div class="card-header">
          <h3 class="card-title"><spring:message code="label.exploitation"/></h3>
        </div>
        <div class="card-body">
          
          <div class="form-group">
            <form:label path="adherent.agence"><spring:message code="label.agenceRattachement"/></form:label>
            <form:select class="form-control" name="adherent.agence" path="adherent.agence.id">
              <form:options items="${agenceList}" itemValue="id" itemLabel="libelle" />
            </form:select>					        
            <form:errors class="bg-danger" path="adherent.pole" /> 
          </div>
	
          <div class="form-group">
            <form:label path="adherent.secteur"><spring:message code="label.secteur"/></form:label>
            <form:select class="form-control" name="adherent.secteur" path="adherent.secteur.id">
              <form:option value="" ></form:option>
              <form:options items="${secteurList}" itemValue="id" itemLabel="libelle" />
            </form:select>
            <form:errors class="bg-danger" path="adherent.secteur" />
          </div>

          <div class="form-group">
            <form:label path="adherent.tournee"><spring:message code="label.tournee"/></form:label>
            <form:select class="form-control" name="adherent.tournee" path="adherent.tournee.id">
              <form:options items="${tourneeList}" itemValue="id" itemLabel="libelle" />
            </form:select>					        
          </div>

          <div class="form-group">
            <form:label path="adherent.isOutilDechargement"><spring:message code="label.outilDechargement"/></form:label>
            <form:checkbox path="adherent.isOutilDechargement"/>
          </div>
          
          
          
          
          
          
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
          
    <div class="col-md-6">
      <div class="card card-secondary">
        <div class="card-header">
          <h3 class="card-title"><spring:message code="label.administratif"/></h3>
        </div>
        <div class="card-body">
          <div class="form-group">
            <form:label path="adherent.dateEntree"><spring:message code="label.dateEntree"/></form:label>
            <form:input class="form-control" type="date" name="adherent.dateEntree" path="adherent.dateEntree"/>
            <form:errors class="bg-danger" path="adherent.dateEntree" />
          </div>
	
          <div class="form-group">
            <form:label path="adherent.role" ><spring:message code="label.role"/></form:label>
            <form:select class="form-control" name="adherent.role" path="adherent.role.id">
              <form:options items="${roleList}" itemValue="id" itemLabel="libelle" />
            </form:select>
            <form:errors class="bg-danger" path="adherent.role" />
          </div>
	
          <div class="form-group">
            <form:label path="adherent.formeJuridique" ><spring:message code="label.formeJuridique"/></form:label>
            <form:select class="form-control" name="adherent.formeJuridique" path="adherent.formeJuridique.id">
              <form:options items="${formJuridList}" itemValue="id" itemLabel="libelle" />
            </form:select>
            <form:errors class="bg-danger" path="adherent.formeJuridique" />
          </div>
		
          <div class="form-group">
            <form:label path="adherent.siren" ><spring:message code="label.siren"/></form:label>
            <form:input class="form-control" name="adherent.siren" path="adherent.siren"/>
            <form:errors class="bg-danger" path="adherent.siren" />
          </div>

          <div class="form-group">
            <form:label path="adherent.siret" ><spring:message code="label.siret"/></form:label>
            <form:input class="form-control" name="adherent.siret" path="adherent.siret"/>
            <form:errors class="bg-danger" path="adherent.siret" />
          </div>
	
          <div class="form-group">
            <form:label path="adherent.ape" ><spring:message code="label.ape"/></form:label>
            <form:select class="form-control" name="adherent.ape" path="adherent.ape.id">
              <form:options items="${apeList}" itemValue="id" itemLabel="libelle" />
            </form:select>
          </div>

          <div class="form-group">
            <form:label path="adherent.numRepMetier" ><spring:message code="label.numRepMetier"/></form:label>
            <form:input class="form-control" name="adherent.numRepMetier" path="adherent.numRepMetier"/>
            <form:errors class="bg-danger" path="adherent.numRepMetier" />
          </div>

          <div class="form-group">
            <form:label path="adherent.rcsRm" ><spring:message code="label.rcsRm"/></form:label>

            <form:select class="form-control" name="adherent.rcsRm" path="adherent.rcsRm">
              <form:option value="" ></form:option>
              <form:option value="RCS" >RCS</form:option>
              <form:option value="RM" >RM</form:option>
            </form:select>
            <form:errors class="bg-danger" path="adherent.rcsRm" />
          </div>

          <div class="form-group">
            <form:label path="adherent.rcsCommune" ><spring:message code="label.rcsCommune"/></form:label>
            <div>
              <div class="input-group">
                <input type="text" class="form-control" id="communeRCSLibelle" disabled/>
                <div class="input-group-prepend">
                  <a class="input-group-text" href="#" id="editRcsCommune" data-toggle="modal" data-target="#modal-rcsCommune"><i class="fas fa-map-marked-alt"></i></a>
                </div>
              </div>
            </div>
            <form:errors class="bg-danger" path="adherent.rcsCommune" />
          </div>
		
          <div class="form-group">
            <form:label path="adherent.dateClotureExe"><spring:message code="label.dateClotureExe"/></form:label>
            <form:input class="form-control" type="date" name="adherent.dateClotureExe" path="adherent.dateClotureExe"/>
            <form:errors class="bg-danger" path="adherent.dateClotureExe" />
          </div>
		
          <div class="form-group">
            <form:label path="adherent.FormationDirigeant" ><spring:message code="label.formationCommerce"/></form:label>
            <form:input class="form-control" name="adherent.FormationDirigeant" path="adherent.FormationDirigeant"/>
            <form:errors class="bg-danger" path="adherent.FormationDirigeant" />
          </div>

          <div class="form-group">
            <form:label path="adherent.etat" ><spring:message code="label.etat"/></form:label>
            <form:select class="form-control" name="adherent.etat" path="adherent.etat.id">
              <form:options items="${etatList}" itemValue="id" itemLabel="libelle" />
            </form:select>
          </div>

          <div class="form-group">
            <form:label path="adherent.adherentType" ><spring:message code="label.adherentType"/></form:label>
            <form:select class="form-control" name="adherent.adherentType" path="adherent.adherentType.id">
              <form:options items="${adherentTypeList}" itemValue="id" itemLabel="libelle" />
            </form:select>
          </div>
            
          <div class="form-group">
            <form:label path="adherent.compteType" ><spring:message code="label.compteStatut"/></form:label>
            <form:select class="form-control" name="adherent.compteType" path="adherent.compteType.id">
              <form:options items="${compteTypeList}" itemValue="id" itemLabel="libelle" />
            </form:select>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
  </div>
            
  <div class="row">
    <div class="col-12">
      <a href="#" class="btn btn-secondary">Cancel</a>
      <input type="submit" value="Création" class="btn btn-success float-right">
    </div>
  </div>
                          
  <div class="modal fade" id="modal-adherentCommune">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Selection</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <label>Recherche</label>
          <input class="form-control" id="filterCPCommuneAdh" type="text" placeholder="Code postale ou Nom"  />
          <br>
          <form:label path="adherent.rcsCommune" ><spring:message code="label.commune"/></form:label>
          <form:select id="communeAdhListe" class="form-control" name="adherent.commune" path="adherent.commune.id">
            <form:options items="${communeList}" itemValue="id" itemLabel="libelle" />
          </form:select>
        </div>
        <div class="modal-footer justify-content-between">
          <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
          <button type="button" id="valideAdhCommune" class="btn btn-primary">Selectionner</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
<!-- /.modal -->

<div class="modal fade" id="modal-rcsCommune">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Selection</h4>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <label>Recherche</label>
          <input class="form-control" id="filterCpRCSCommune" type="text" placeholder="Code postale ou Nom"  />
          <br>
          <form:label path="adherent.rcsCommune" ><spring:message code="label.commune"/></form:label>
          <form:select id="communeRCSListe" class="form-control" name="adherent.rcsCommune" path="adherent.rcsCommune.id">
            <form:options items="${communeList}" itemValue="id" itemLabel="libelle" />
          </form:select>
        </div>
        <div class="modal-footer justify-content-between">
          <button type="button" class="btn btn-default" data-dismiss="modal">Annuler</button>
          <button type="button" id="valideRcsCommune" class="btn btn-primary" data-dismiss="modal">Selectionner</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
<!-- /.modal -->
                          
                          
</form:form>



