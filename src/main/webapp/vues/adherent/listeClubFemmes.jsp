<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<div class="text-2xl mb-4">
  <spring:message code="label.contactsClubFemme"/>
</div>

<div class="card card-lightneutral">
  <div class="card-header">
    <h3 class="card-title px-1.5 py-2"><spring:message code="count" arguments="${nbContacts}"/></h3>
  </div>

  <div class="card-body">
    <div class="grid grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4">
      <c:forEach items="${listeContacts}" var="contact">
        <div class="w-full pt-2 max-w-s bg-white rounded-lg cursor-pointer transition-transform transform hover:scale-105" id="${contact.id}">
          <h5 class="mb-1 text-center bg-pink-300 font-medium text-gray-900">
            <c:out value="${contact.prenom}"/> <c:out value="${contact.nom}"/>
          </h5>
          
          <div class="grid grid-cols-3 items-center pb-5 px-2">
            <div>
              <c:choose>
                <c:when test="${empty contact.photoImg}">
                  <img src="<c:url value="/resources/images/noContact.png"/>" class="mt-6 w-24 h-24 rounded-full object-cover shadow-lg">
                </c:when>
                <c:otherwise>
                  <img src="${contact.photoImg}" alt="" class="mt-6 w-24 h-24 object-cover rounded-full shadow-lg">
                </c:otherwise>
              </c:choose>
            </div>
            
            <div class="col-span-2 ml-2">
              <div class="flex flex-col text-sm">
                
                <span class="text-green-600 hover:underline overflow-hidden text-ellipsis">
                  <a href="mailto:<c:out value='${contact.mail}'/>"><c:out value="${contact.mail}"/></a>
                </span>
                  
                <c:if test = '${not empty contact.fixe}'>
                <span class="text-gray-300">
                  Fixe : <a href="tel:<c:out value='${contact.fixe}'/>" class="text-green-600 hover:underline"><c:out value="${contact.fixe}"/></a>
                </span>
                </c:if>
                
                <c:if test = '${not empty contact.mobile}'>
                <span class="text-gray-300">
                  Mobile : <a href="tel:<c:out value='${contact.mobile}'/>" class="text-green-600 hover:underline"><c:out value="${contact.mobile}"/></a>
                </span>
                </c:if>
                
                <span class="text-gray-300">
                  <spring:message code="label.nom"/> :&nbsp;<span class="text-gray-500"><c:out value="${contact.adherent.libelle}"/></span>
                </span>
                
                <span class="text-gray-300">
                  <spring:message code="label.adresse"/> : <span class="text-gray-500"><c:out value="${contact.adresse}"/></span>
                </span>
                
                <span class="text-gray-500 ml-2">
                  <c:out value="${contact.adresseComplement}"/>
                </span>
                
                <span class="text-gray-500 ml-2">
                  <c:out value="${contact.commune.codePostal}"/>
                  <c:out value="${contact.commune.libelle}"/>
                </span>

              </div>
            </div>
          </div>
        </div>
      </c:forEach>

    </div>
  </div>
  <!-- /.card-body -->

  <div class="card-footer">
    <nav class="flex justify-center mt-4" aria-label="Contacts Page Navigation">
      <ul class="inline-flex items-center -space-x-px">
        <c:if test="${maxPage > 0}">
          <li>
            <a href="listeContacts?page=1" class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
              Début
            </a>
          </li>
          <li>
            <a class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700"
               href="listeContacts?page=${page - 1}">
              <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
              <path clip-rule="evenodd" fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"></path>
              </svg>
            </a>
          </li>

          <c:forEach var="i" begin="${page == 1 ? 1 : page-1}" end="${page == maxPage ? maxPage : page+1 }">
            <li>
              <a href="listeContacts?page=${i}" class="<c:if test="${page == i}"> text-neutral-600 bg-neutra href="listeContacts?page=${i}"l-50 border-neutral-300 </c:if> py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
                ${i}
              </a>
            </li>
          </c:forEach>
          <li>
            <a class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700"
               href="listeContacts?page=${page + 1}">
              <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
              <path clip-rule="evenodd" fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"></path>
              </svg>
            </a>
          </li>
          <li>
            <a href="listeContacts?page=${maxPage}" class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700">
              Fin
            </a>
          </li>
        </c:if>
      </ul>
    </nav>
  </div>

</div>


