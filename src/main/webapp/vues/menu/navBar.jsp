<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-secondary navbar-light">
  <!-- Left navbar links -->
  <ul class="navbar-nav">
    <li class="nav-item bg-secondary">
      <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
    </li>
    <li class="nav-item d-sm-inline-block">
      <a href="listeAdherents" class="nav-link bg-secondary <c:if test = "${navType == 'ADHERENT'}"> bg-success </c:if>">Adherent</a>
    </li>
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_EXPLOITATION')">
      <li class="nav-item d-sm-inline-block">
        <a href="ordreTournee" class="nav-link bg-secondary <c:if test = "${navType == 'LOGISTIQUE'}"> bg-success </c:if>">Logistique</a>
      </li>
    </sec:authorize>
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_DIRECTION')">
      <li class="nav-item d-sm-inline-block">
        <a href="listeAdherents" class="nav-link bg-secondary <c:if test = "${navType == 'COMMERCE'}"> bg-success </c:if>">Commerce</a>
      </li>
    </sec:authorize>
    <li class="nav-item d-sm-inline-block">
      <a href="listeAdherents" class="nav-link bg-secondary <c:if test = "${navType == 'FOURNISSEUR'}"> bg-success </c:if>">Fournisseur</a>
    </li>
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_ARTIPOLE')">
      <li class="nav-item d-sm-inline-block">
        <a href="listeAdherents" class="nav-link bg-secondary <c:if test = "${navType == 'ARTIPOLE'}"> bg-success </c:if>">Artipôle</a>
      </li>
    </sec:authorize>
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_INFORMATIQUE')">
      <li class="nav-item d-sm-inline-block">
        <a href="listeAdherents" class="nav-link bg-secondary <c:if test = "${navType == 'INFORMATIQUE'}"> bg-success </c:if>">Informatique</a>
      </li>
    </sec:authorize>
    
    <li class="nav-item dropdown">
      <a id="dropdownSubMenu1" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle bg-secondary">Liens utiles</a>
      <ul aria-labelledby="dropdownSubMenu1" class="dropdown-menu border-0 shadow">
      <!--<ul class="nav-item dropdown">-->
        <li>
          <a class="dropdown-item" href=<c:url value="http://srvlinux/dokuwiki/doku.php?id=start"/> target="_blank">
            <p><i class="fab fa-wikipedia-w nav-icon"></i> <spring:message code="menu.wiki"/></p>
          </a>
        </li>
        <li>
          <a class="dropdown-item" href=<c:url value="http://macoop.scabois.fr"/> target="_blank">
            <p><i class="fas fa-network-wired nav-icon"></i> <spring:message code="menu.extranet"/></p>
          </a>
        </li>
        <li>
          <a class="dropdown-item" href=<c:url value="https://questionnaire.dfiweb.net/"/> target="_blank">
            <p><i class="fas fa-external-link-alt nav-icon"></i> <spring:message code="menu.defiWeb"/></p>
          </a>
        </li>
        <li>
          <a class="dropdown-item" href=<c:url value="http://orcab.net/"/> target="_blank">
            <p><i class="fas fa-external-link-alt nav-icon"></i> <spring:message code="menu.electromenager"/></p>
          </a>
        </li>
        <li>
          <a class="dropdown-item" href=<c:url value="https://www.facebook.com/ArtipoleDoleChoisey/"/> target="_blank">
            <p><i class="fab fa-facebook-square nav-icon"></i><spring:message code="menu.facebook"/></p>
          </a>
        </li>
      </ul>
    </li>
  </ul>
    
  <!-- Right navbar links -->
  <ul class="navbar-nav ml-auto">
     <!--Messages Dropdown Menu--> 
      <li class="nav-item">
          <a class="nav-link bg-secondary" href="logout">Déconnexion</a>
      </li> 
      <li class="nav-item">
          <a class="nav-link bg-secondary" data-widget="control-sidebar" data-slide="true" href="#" role="button">
              <i class="fas fa-ellipsis-v"></i>
          </a>
      </li>
  </ul>
</nav>
<!-- /.navbar -->