<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<html lang="en" xmlns:th="http://www.thymeleaf.org">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Scabothèque</title>
    <link rel="icon shortcut" href="<c:url value="/resources/images/favicon.png"/>"/>

    <script src="https://kit.fontawesome.com/0d809d1677.js" crossorigin="anonymous"></script>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/plugins/select2/css/select2.min.css" />"/>
    <link type="text/css" rel="stylesheet"
          href="<c:url value="/resources/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css" />"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/style/scabotheque.css" />"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.3/flowbite.min.css" rel="stylesheet" />
    <script src="https://unpkg.com/flowbite@1.5.3/dist/datepicker.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
  </head>

  <body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed text-gray-500 dark:text-gray-400 bg-gray-50 dark:bg-gray-700">

    <div class="wrapper">
      <tiles:insertAttribute name="navBar"/>
      <tiles:insertAttribute name="menu"/>
      
      <div class="pt-20 pr-4 pb-12 pl-64">
        <tiles:insertAttribute name="body"/>
        <tiles:insertAttribute name="footer"/>
      </div>
      
    </div>
    <!-- ./wrapper -->

    <!-- REQUIRED SCRIPTS -->
    <!-- ***************************************************************************************-->
    <!-- jQuery -->
    <script src="<c:url value="/resources/plugins/jquery/jquery.min.js"/>"></script>
    <!-- Bootstrap 4 -->
    <script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
    <!-- Select2 -->
    <script src="<c:url value="/resources/plugins/select2/js/select2.full.min.js"/>"></script>
    <!-- InputMask -->
    <script src="<c:url value="/resources/plugins/moment/moment.min.js"/>"></script>
    <script src="<c:url value="/resources/plugins/inputmask/min/jquery.inputmask.bundle.min.js"/>"></script>
    <!-- date-range-picker -->
    <script src="<c:url value="/resources/plugins/daterangepicker/daterangepicker.js"/>"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="<c:url value="/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"/>"></script>
    <!-- Bootstrap Switch -->
    <script src="<c:url value="/resources/plugins/bootstrap-switch/js/bootstrap-switch.min.js"/>"></script>
    <!-- AdminLTE App -->
    <script src="<c:url value="/resources/dist/js/adminlte.min.js"/>"></script>
    <!-- SweetAlert2 -->
    <script src="<c:url value="/resources/plugins/sweetalert2/sweetalert2.min.js"/>"></script>
    <!-- Toastr -->
    <script src="<c:url value="/resources/plugins/toastr/toastr.min.js"/>"></script>


    <!-- Page script -->
    <script>


      //    $(function defaultErrorMessage(message) {
      //      toastr.error(message);
      //    });

      $(function () {
        const Toast = Swal.mixin({
          toast: true,
          position: 'top-end',
          showConfirmButton: false,
          timer: 5000
        });

        $(document).ready(function () {
          var my_js_data = document.getElementById('messageErreur.errors');
          if (my_js_data) {
            toastr.error(my_js_data);
          }
        });

        $("#actionButton").click(function () {
          $("#actionButton").addClass("disabled");
          $("#actionSpinner").removeClass("d-none");
        });

        $("#saveButton").click(function () {
          $("#saveButton").addClass("disabled");
          $("#saveSpinner").removeClass("d-none");
        });

        //Initialize Select2 Elements
        $('.select2').select2();

        //Initialize Select2 Elements
        $('.select2bs4').select2({
          theme: 'bootstrap4'
        });

        $("input[data-bootstrap-switch]").each(function () {
          $(this).bootstrapSwitch('state', $(this).prop('checked'));
        });

        $('#openFormButton').click(function (e) {
          $("#openForm").toggle('slow');
        });


      });

    </script>

    <%--<c:if test = "pageType == 'CREATE_ADHERENT'">--%>
    <script>
      $(function () {
        var globalTimeout = null;
        var filterCp;
        var communeId;
        var communeLib;
        var communeListe;

        $('#currentCommune').text($('#communeAdhLibelle').text());

        $('#filterCpRCSCommune').bind("keyup", function () {
          // Si un delay est en cour, on le supprime
          if (globalTimeout != null) {
            clearTimeout(globalTimeout);
          }
          // execution d'un delay
          globalTimeout = setTimeout(function () {
            globalTimeout = null;
            filterCp = {filter: $("#filterCpRCSCommune").val()}
            populateListe();
          }, 1000);
        });

        $('#filterCpRMCommune').bind("keyup", function () {
          // Si un delay est en cour, on le supprime
          if (globalTimeout != null) {
            clearTimeout(globalTimeout);
          }
          // execution d'un delay
          globalTimeout = setTimeout(function () {
            globalTimeout = null;
            filterCp = {filter: $("#filterCpRMCommune").val()}
            populateListe();
          }, 1000);
        });

        $('#filterCPCommuneAdh').bind("keyup", function () {
          // Si un delay est en cour, on le supprime
          if (globalTimeout != null) {
            clearTimeout(globalTimeout);
          }
          // execution d'un delay
          globalTimeout = setTimeout(function () {
            globalTimeout = null;
            filterCp = {filter: $("#filterCPCommuneAdh").val()}
            populateListe();
          }, 1000);
        });

        function populateListe() {
          var params = filterCp;
          console.log(params);

          $.get("/scabotheque/loadCommuneListe", params, function (response) {
            console.log("retour servlet : " + response.length + " commune(s)");
            communeListe.find("option").remove();
            $.each(JSON.parse(response), function (index, commune) {
              $("<option>").val(commune.id).text(commune.codePostal + " - " + commune.libelle).appendTo(communeListe);
            });
          });
        }


        $('#editAdhCommune').click(function (e) {
          communeId = $("#communeAdhId");
          communeLib = $("#communeAdhLibelle");
          communeListe = $("#communeAdhListe");
          // $("#filterCPCommuneAdh").select();
        });

        $('#valideAdhCommune').click(function (e) {
          communeId.val(communeListe.find(':selected').val());
          communeLib.val(communeListe.find(':selected').text());
          $("#modal-adherentCommune").modal('toggle');
          // $("#filterCpRCSCommune").select();
        });

        $('#editRcsCommune').click(function (e) {
          communeId = $("#communeRCSId");
          communeLib = $("#communeRCSLibelle");
          communeListe = $("#communeRCSListe");
        });

        $('#editRmCommune').click(function (e) {
          communeId = $("#communeRMId");
          communeLib = $("#communeRMLibelle");
          communeListe = $("#communeRMListe");
        });

        $('#valideRcsCommune').click(function (e) {
          communeId.val(communeListe.find(':selected').val());
          communeLib.val(communeListe.find(':selected').text());
          $("#modal-rcsCommune").modal('toggle');
        });

        $('#valideRmCommune').click(function (e) {
          communeId.val(communeListe.find(':selected').val());
          communeLib.val(communeListe.find(':selected').text());
          $("#modal-rmCommune").modal('toggle');
        });

      });
    </script>
    <%--</c:if>--%>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/1.6.3/flowbite.min.js"></script>
  </body>
</html>
