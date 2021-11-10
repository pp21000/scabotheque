<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-success elevation-4 ">
    <!-- Brand Logo -->
    <a href="listeAdherents" class="brand-link">
      <img src="resources/dist/img/modus.png" alt="SCABOthéques" class="brand-image img-circle elevation-3"
        style="opacity: .8">
      <span class="brand-text font-weight-light">SCABOthèque</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <!--<img src="resources/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">-->
        </div>
        <div class="info">
          <a href="#" class="d-block"><sec:authentication property="name"/></a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column nav-child-indent" data-widget="treeview" role="menu" data-accordion="false">
        <!-- Add icons to the links using the .nav-icon class with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="dashboard" class="nav-link <c:if test = "${pageType == 'DASHBOARD'}"> active </c:if>">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Tableau de bord
                <span class="right badge badge-danger">New</span>
              </p>
            </a>
          </li>
          
          <li class="nav-item has-treeview ">
            <a href="listeAdherents" class="nav-link <c:if test = "${pageType == 'LIST_ADHERENT' || pageType == 'CREATE_ADHERENT'}"> active </c:if>">
              <i class="nav-icon fas fa-user-friends"></i>
              <p>
                Base Adhérents
                <!--<i class="right fas fa-angle-left"></i>-->
              </p>
            </a>
          </li>

          <li class="nav-item has-treeview ">
            <a href="ordreTournee" class="nav-link <c:if test = "${navType == 'LOGISTIQUE'}"> active </c:if>">
              <i class="nav-icon fas fa-user-friends"></i>
              <p>
                Base Logistique
                <!--<i class="right fas fa-angle-left"></i>-->
              </p>
            </a>
          </li>

          <li class="nav-item has-treeview ">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-link"></i>
              <p>
                Liens utiles
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a class="nav-link" href=<c:url value="http://srvlinux/dokuwiki/doku.php?id=start"/> target="_blank">
                  <i class="fab fa-wikipedia-w nav-icon"></i>
                  <p><spring:message code="menu.wiki"/></p>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href=<c:url value="http://macoop.scabois.fr"/> target="_blank">
                  <i class="fas fa-network-wired nav-icon"></i>
                  <p><spring:message code="menu.extranet"/></p>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href=<c:url value="https://questionnaire.dfiweb.net/"/> target="_blank">
                  <i class="fas fa-external-link-alt nav-icon"></i>
                  <p><spring:message code="menu.defiWeb"/></p>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href=<c:url value="http://orcab.net/"/> target="_blank">
                  <i class="fas fa-external-link-alt nav-icon"></i>
                  <p><spring:message code="menu.electromenager"/></p>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href=<c:url value="https://www.facebook.com/ArtipoleDoleChoisey/"/> target="_blank">
                  <i class="fab fa-facebook-square nav-icon"></i>
                  <p><spring:message code="menu.facebook"/></p>
                </a>
              </li>
            </ul>
          </li>
          
          <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION')">
            <c:url value="/analyse" var="urlAnalyse" />
            <li class="nav-item">
              <a href="analyse" class="nav-link <c:if test = "${pageType == 'ANALYSE'}"> active </c:if>">
                <i class="nav-icon fas fa-euro-sign"></i>
                <p>
                  <spring:message code="menu.analyse"/>
                  <span class="right badge badge-danger">Nouveau</span>
                </p>
              </a>
            </li>
          </sec:authorize>

          <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_EXPLOITATION')">
            <c:url value="/ordreTournee" var="urlOrdreTournee" />
            <li class="nav-item">
              <a href="ordreTournee" class="nav-link <c:if test = "${pageType == 'LOGISTIQUE_TOURNEE'}"> active </c:if>">
                <i class="nav-icon fas fa-truck"></i>
                <p>
                  <spring:message code="menu.gestionTournee"/>
                  <!--<span class="right badge badge-danger">Nouveau</span>-->
                </p>
              </a>
            </li>
          </sec:authorize>

<!--          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-cogs"></i>
              <p>
                Tables de bases
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="fas nav-icon fa-truck"></i>
                  <p>Liste des camions</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="fas nav-icon fa-drivers-license"></i>
                  <p>Liste des chauffeurs</p>
                </a>
              </li>-->
<!--              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="fas fa-external-link-alt nav-icon"></i>
                  <p>Questionnaire D'FIWEB</p>
                </a>
              </li>-->
<!--              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="fas fa-external-link-alt nav-icon"></i>
                  <p>Orcab éléctroménager</p>
                </a>
              </li>-->
<!--              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="fas fa-external-link-alt nav-icon"></i>
                  <p>Facebook Artipôle</p>
                </a>
              </li>-->
            </ul>
          <!--</li>-->
        <!--</ul>-->
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>