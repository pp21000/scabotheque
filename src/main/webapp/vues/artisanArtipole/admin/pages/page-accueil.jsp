<%--
  User: ludovic.spina - Date: 21/02/2023 - Time: 11:50
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
 

    <form:form class="card card-lightblue" method="post" modelAttribute="tourneeForm" action="exportDataArtisanArtipole">
      <div class="w-full text-center">
<!--        <button class="px-3 py-3 text-xs font-medium text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300" 
                type="button">Transférer les données vers la base Artisan Artipole</button>-->


        <button id="saveButton" class="text-white bg-gray-800 hover:bg-gray-900 focus:outline-none focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-5 py-3" type="submit">
          <span id="saveSpinner" class="spinner-border text-light spinner-border-sm d-none"
                role="status" aria-hidden="true">
          </span>
          Transférer les données vers la base Artisan Artipole
        </button>
      </div>
    </form:form>
  </body>
</html>
