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
      <img src="resources/dist/img/modus.png" alt="SCABOth�ques" class="brand-image img-circle elevation-3"
        style="opacity: .8">
      <span class="brand-text font-weight-light">SCABOth�que</span>
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
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>