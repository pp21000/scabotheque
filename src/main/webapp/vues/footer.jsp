<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@page session="true"%>
    
<footer class="fixed bottom-0 text-sm bg-gray-300 text-gray-400 border-gray-400 dark:bg-gray-900 dark:text-gray-600 dark:border-gray-600 left-0 z-20 p-2 w-full border-t shadow md:flex md:items-center md:justify-between">
    
    <span class="sm:text-center">Copyright &copy; 2023 
        <a class="hover:underline" href="https://scabois.fr">SCABOIS.fr</a>.</strong> Tous droits réservés.
    </span>
  
    <ul class="flex flex-wrap items-center mt-3 sm:mt-0">
        <li>
            <span class="mr-4 md:mr-6">SCABOIS : Société Coopérative des Artisans du BOIS</span>
        </li>
        
        <li>
            <span class="mr-4 md:mr-6">${project.version}</span>
        </li>
    </ul>

</footer>
