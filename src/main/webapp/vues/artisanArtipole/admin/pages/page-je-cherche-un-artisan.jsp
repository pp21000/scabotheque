<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


  <h2>Modal Example</h2>

  <!-- Trigger/Open The Modal -->
  <button id="myBtn">Open Modal</button>

  <!-- The Modal -->
  <div id="myModal" class="hidden fixed z-0 pt-24 w-full h-100">

    <!-- Modal content -->
    <div class="bg-gray-100 m-auto w-1/3 p-5">
      <span id="close" class="float-right"> 
        <svg class="w-7 h-7" ><use xlink:href="<c:url value="/resources/images/icones.svg#close"/>"></use></svg>
      </span>
      <p>Some text in the Modal..</p>
      <p>Some text in the Modal..</p>
      <p>Some text in the Modal..</p>
      <p>Some text in the Modal..</p>
      <p>Some text in the Modal..</p>
      
    </div>

  </div>







  <script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementById("close");

    // When the user clicks the button, open the modal 
    btn.onclick = function () {
      modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
      modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }
  </script>
