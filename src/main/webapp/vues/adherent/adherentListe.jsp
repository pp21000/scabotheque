<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<div class="flex justify-left gap-10">
    <div class="text-2xl">Base adhérents</div>
</div>

<div>
    <div class="flex justify-center">
        <!-- CONTACT SEARCH FORM -->
        <form:form id="searchform" method="post" modelAttribute="criteria" action="adherentListe">

            <form:input type="hidden" name="contactFonctionIds" path="contactFonctionIds"/>

            <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only">
                <spring:message code="label.texteRecherche" var="recherchePH"/>
            </label>

            <div class="flex gap-2">

                <form:input class="p-2 w-96 bg-white rounded-lg border border-gray-200 text-black"
                            type="search" path="text" placeholder="${recherchePH}"
                            aria-label="Search" autofocus="true"/>

                <c:url value="/initListeAdherents" var="urlInit"/>

                <div class="flex gap-2">
                    <button type="submit"
                            class="p-3 text-white text-sm rounded-lg bg-neutral-800 hover:bg-neutral-900">
                    Rechercher
                    </button>

                    <button class="p-3 text-white text-sm rounded-lg bg-neutral-800 hover:bg-neutral-900"
                            type="reset" onclick="window.location.href='${urlInit}'">
                        Effacer
                    </button>
                </div>

            </div>
        </form:form>
    </div>

    <div id="accordion-collapse" data-accordion="collapse">
      <h2 id="accordion-collapse-head-1">
          <button type="button"
                  class="focus:text-white bg-gray-800 hover:bg-gray-900 bg-gray-100 dark:bg-gray-800 dark:hover:bg-gray-900 w-full p-3 font-medium rounded-t-xl"
                  data-accordion-target="#accordion-collapse-body-1" aria-expanded="false"
                  aria-controls="accordion-collapse-body-1" onclick="toggleAdvancedSearchForm()">
              <span class="text-center"><spring:message code="label.rechercheAvance"/></span>
          </button>

      </h2>

      <!-- ADVANCE SEARCH -->
      <div id="accordion-collapse-body-1" class="hidden" aria-labelledby="accordion-collapse-head-1">
          <div class="bg-gray-200 rounded-b-xl">

              <form:form class="card card-outline card-info collapsed-card mb-0" id="advanceSerachForm" method="post" modelAttribute="criteria" action="adherentListe">
                  <form:input type="hidden" name="text" path="text"/>
                  <form:input type="hidden" name="contactFonctionIds" path="contactFonctionIds"/>
                  <spring:message code="label.texteRecherche" var="recherchePH"/>
                  <div class="card-body">
                      <div class="flex justify-evenly py-3">
                          <div class="flex flex-col w-full px-6">
                              <label>Type</label>
                              <form:select class="form-control select2" name="typeAdhIds"
                                           data-placeholder="Type d'adhérent"
                                           path="typeAdhIds" multiple="multiple">
                                  <form:options items="${adhTypesList}" itemValue="id" itemLabel="libelle"/>
                              </form:select>

                              <label>Pôle</label>
                              <form:select class=" form-control select2" name="poleIds"
                                           data-placeholder="Tous les pôles"
                                           path="poleIds" multiple="multiple">
                                  <form:options items="${polesList}" itemValue="id" itemLabel="libelle"/>
                              </form:select>
                              <label>Secteurs</label>
                              <form:select class="form-control select2" name="secteurIds"
                                           data-placeholder="Tous les secteurs"
                                           path="secteurIds" multiple="multiple">
                                  <form:options items="${secteursList}" itemValue="id" itemLabel="libelle"/>
                              </form:select>
                          </div>
                          <div class="flex flex-col w-full px-6">
                              <label>Activités</label>
                              <form:select class="form-control select2" name="activiteIds"
                                           data-placeholder="Toutes les activités"
                                           path="activiteIds" multiple="multiple">
                                  <form:options items="${activitesList}" itemValue="id" itemLabel="libelle"/>
                              </form:select>
                              <label>Agences</label>
                              <form:select class="form-control select2" name="agenceIds"
                                           data-placeholder="Toutes les agences"
                                           path="agenceIds" multiple="multiple">
                                  <form:options items="${agencesList}" itemValue="id" itemLabel="libelle"/>
                              </form:select>
                          </div>
                          <div class="flex flex-col w-full px-6">
                              <div class="w-100 col-md-3">
                                  <div class="form-group clearfix">
                                      <form:checkbox
                                              class="w-4 h-4 text-neutral-600 bg-white rounded border-gray-300 focus:ring-neutral-500 focus:ring-2"
                                              id="showAdminOnly" name="showAdminOnly" path="showAdminOnly"/>
                                      <label style="float:none;" for="showAdminOnly"><spring:message
                                              code="label.filtre.isAdministrateur"/></label>
                                  </div>
                              </div>
                              <!-- /.col -->
                              <div class="w-100 col-md-3">
                                  <!-- checkbox -->
                                  <div class="form-group clearfix">
                                      <form:checkbox
                                              class="w-4 h-4 text-neutral-600 bg-white rounded border-gray-300 focus:ring-neutral-500 focus:ring-2"
                                              id="showSousCompte" name="showSousCompte" path="showSousCompte"/>
                                      <label style="float:none;" for="showSousCompte"><spring:message
                                              code="label.filtre.sousCompte"/></label>
                                  </div>
                              </div>
                              <!-- /.col -->
                              <div class="w-100 col-md-3">
                                  <div class="form-group clearfix">
                                      <form:checkbox
                                              class="w-4 h-4 text-neutral-600 bg-white rounded border-gray-300 focus:ring-neutral-500 focus:ring-2"
                                              id="showArtipoleOnly" name="showArtipoleOnly"
                                              path="showArtipoleOnly"/>
                                      <label style="float:none;" for="showArtipoleOnly"><spring:message
                                              code="label.filtre.isArtipole"/></label>
                                  </div>
                              </div>
                              <!-- /.col -->
<!--                                    <div class="w-100 col-md-3">
                                  <div class="form-group clearfix">
                                      <form:checkbox
                                              class="w-4 h-4 text-neutral-600 bg-white rounded border-gray-300 focus:ring-neutral-500 focus:ring-2"
                                              id="showAll" name="showAll" path="showAll"/>
                                      <label style="float:none;" for="showAll"><spring:message
                                              code="label.filtre.inactif"/></label>
                                  </div>
                              </div>-->
                              <div class="flex gap-2 mt-2 pt-6">
                                  <button id="actionButton"
                                          class="px-3 py-3 text-xs text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300"
                                          type="submit">
                                      Rechercher
                                  </button>
                                  <button class="px-3 py-3 text-xs text-center text-white bg-neutral-800 rounded-lg hover:bg-neutral-900 focus:ring-4 focus:outline-none focus:ring-neutral-300"
                                          type="reset" onclick="window.location.href='${urlInit}'">
                                      Effacer
                                  </button>
                              </div>
                          </div>
                      </div>
                  </div>

              </form:form>

          </div>
      </div>
    </div>
</div>
<!-- Default box -->
<div class="card card-lightneutral">
  <div class="card-header">
    <h3 class="card-title py-2">Résultat : <spring:message code="count.adherent" arguments="${nbAdherent}"/></h3>
  </div>
  
  <div class="card-body">
    <div class="grid grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-4">
      <c:forEach items="${listeAdherents}" var="adherent">
        <div class="w-full pt-2 max-w-s bg-white rounded-lg border-gray-200 shadow-md hover:bg-neutral-100 cursor-pointer"  id="${adherent.id}">
          <c:url value="/adherentProfil" var="urlShowAdh"><c:param name="idAdh" value="${adherent.id}"/></c:url>
          <h5 class=" mb-2 text-center bg-[#0F638C;] gray-100 font-medium text-gray-100"><c:out value="${contact.prenom}"/> <c:out value="${adherent.libelle}"/></h5>
         
          <div class="grid grid-cols-3 items-center pb-5 px-2">
           <div>
            
              <c:choose>
                  <c:when test="${adherent.photoImg == ''}">
                    <img src="<c:url value="/resources/images/noAdh.png"/>" class="mt-6 max-w-24 max-h-24 rounded-full object-cover shadow-lg">
                  </c:when>
                <c:otherwise>
                  <img src="${adherent.photoImg}" alt="Avatar" class="mt-6 max-w-24 max-h-24 object-cover shadow-lg">
                </c:otherwise>
              </c:choose>
            </div>
            <div class="col-span-2 ml-2">
              <div class="flex flex-col">
                <c:choose>
                    <c:when test="${adherent.compteType.id != '1'}">
                        <div class="bg-gray-100 text-green-800 text-xs font-semibold px-2.5 py-0.5 rounded m-1">
                                ${adherent.compteType.libelle}
                        </div>
                    </c:when>
                    <c:when test="${adherent.cnxEolasAllow == false}">
                        <div class="bg-red-100 text-green-800 text-xs font-semibold px-2.5 py-0.5 rounded m-1">
                            ! Access EOLAS !
                        </div>
                    </c:when>
                    <c:when test="${adherent.etat.id == '2'}">
                        <div class="bg-gray-100 text-green-800 text-xs font-semibold px-2.5 py-0.5 rounded m-1">
                            <c:out value="${adherent.etat.libelle}"/>
                        </div>
                    </c:when>
                </c:choose>

                <small class="text-center bg-gray-200 text-green-800 text-xs font-semibold  px-1.5 py-0.5 rounded m-1">
                  <c:out value="${adherent.code}"/>
                </small>
                  <span><c:out value="${adherent.secteur.libelle}"/></span> 
                <span><c:out value="${adherent.agence.libelle}"/></span>
                <span><c:out value="${adherent.pole.libelle}"/></span> 
                <!--<span><c:out value="${adherent.role.libelle}"/></span>-->
                <span><c:out value="${adherent.commune.codePostal}"/> <c:out value="${adherent.commune.libelle}"/></span> 
              </div>
            </div>
          </div>
          <script>
            document.getElementById("${adherent.id}").addEventListener("click", function () {
                window.location.href = "${urlShowAdh}";
            })
          </script>
        </div>      
      </c:forEach>
    </div>
  </div>


    <nav class="flex justify-center mt-4" aria-label="Contacts Page Navigation">
        <ul class="inline-flex items-center -space-x-px">
            <c:if test="${maxPage > 0}">
                <li>
                    <a class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700"
                       href="adherentListe?page=1">
                        Début
                    </a>
                </li>
                <li>
                    <a class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700"
                       href="adherentListe?page=${page - 1}">
                        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                             xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                                  clip-rule="evenodd"></path>
                        </svg>
                    </a>
                </li>

                <c:forEach var="i" begin="${page == 1 ? 1 : page-1}" end="${page == maxPage ? maxPage : page+1 }">
                    <li>
                        <a class="<c:if test="${page == i}"> text-neutral-600 bg-neutral-200 border-neutral-300 hover:bg-neutral-200</c:if> block py-2 px-3 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700"
                           href="adherentListe?page=${i}">${i}</a>
                    </li>
                </c:forEach>
                <li>
                    <a class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700"
                       href="adherentListe?page=${page + 1}">
                        <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20"
                             xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd"
                                  d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                  clip-rule="evenodd"></path>
                        </svg>
                    </a>
                </li>
                <li>
                    <a class="block py-2 px-3 ml-0 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700"
                       href="adherentListe?page=${maxPage}">
                        Fin
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>

</div>
<style>
    .select2-selection__choice {
        margin-bottom: 5px;
    }
</style>

<script>
  function toggleAdvancedSearchForm() {
    $("#accordion-collapse-body-1").slideToggle(200);
  }
</script>





