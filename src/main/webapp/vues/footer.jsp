<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>


<%@page session="true"%>

<!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="float-right d-none d-sm-inline">
      SCABOIS : Société Coopérative des Artisans du BOIS 
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2021 <a href="http://scaboir.fr">SCABOIS.fr</a>.</strong> tous droits réservés.
    <small>Version : ${project.version}</small>
  </footer>