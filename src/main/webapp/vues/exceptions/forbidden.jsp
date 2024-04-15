<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div class="text-xl-center text-center " role="alert">
  <h4 class="text-4xl text-warning mb-20">Forbidden ...</h4> 
  <p class="mb-2">En gros, tu as rien à faire ici !!!</p>
  <hr>
  <a class="mt-4" href="<c:url value="/listeAdherents"/>">&gt;&gt;&gt; Là tu as le droit &lt;&lt;&lt; </a>
</div>
