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

 

    <form:form class="card card-lightblue" method="post" modelAttribute="tourneeForm" action="exportDataArtisanArtipole">
      <div class="w-full text-center mt-10">

        <button onclick="" id="saveButton" data-modal-toggle="transfet-modal" class="text-white bg-gray-800 hover:bg-gray-900 focus:outline-none focus:ring-4 focus:ring-gray-300 font-medium rounded-lg text-sm px-10 py-5" type="submit">
          <span id="saveSpinner" class="spinner-border text-light spinner-border-sm d-none"
            role="status" aria-hidden="true">
          </span>
          Transférer les données vers la base Artisan Artipole
        </button>

        <!-- Main modal -->
        <div id="transfet-modal" tabindex="-1" aria-hidden="true"  class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 w-full md:inset-0 h-modal md:h-full">
                   
          <div class="text-4xl align-content-center mr-5">
            Transfert en cours ... merci de patienter
          </div>
        </div>
        
      </div>
    </form:form>

