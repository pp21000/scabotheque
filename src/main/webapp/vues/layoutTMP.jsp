<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html lang="en" xmlns:th="http://www.thymeleaf.org">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Scabothèque</title>
    <link rel="icon shortcut" href="<c:url value="/resources/images/favicon.png"/>"/>

    <script src="https://kit.fontawesome.com/0d809d1677.js" crossorigin="anonymous"></script>

    <!-- Select2 -->
    <link href="resources/style/scabotheque.css" rel="stylesheet" type="text/css"/>
    <link href="resources/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css"/>
    <!--<link rel="stylesheet" href="ressources/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">-->
    <link href="resources/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css" rel="stylesheet" type="text/css"/>
    <!-- daterange picker -->
    <link rel="stylesheet" href="resources/plugins/daterangepicker/daterangepicker.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="resources/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    <link rel="stylesheet" href="resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="resources/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="resources/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet" href="resources/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
    <!-- Toastr -->
    <link rel="stylesheet" href="resources/plugins/toastr/toastr.min.css">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="resources/plugins/fontawesome-free/css/all.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="resources/dist/css/adminlte.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  </head>

  <body class="hold-transition sidebar-mini layout-fixed layout-navbar-fixed ">
    <div class="wrapper">

      <tiles:insertAttribute name="menu" />

      <tiles:insertAttribute name="navBar" />

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Main content -->
        <section class="content">
          <div class="container-fluid">
            <tiles:insertAttribute name="body" />
          </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->      
      </div>
      <!-- /.content-wrapper -->

      <tiles:insertAttribute name="footer" />

    </div>
    <!-- ./wrapper -->

    <!-- REQUIRED SCRIPTS -->
    <!-- ***************************************************************************************-->
    <!-- jQuery -->
    <script src="resources/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Select2 -->
    <script src="resources/plugins/select2/js/select2.full.min.js"></script>
    <!-- InputMask -->
    <script src="resources/plugins/moment/moment.min.js"></script>
    <script src="resources/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
    <!-- date-range-picker -->
    <script src="resources/plugins/daterangepicker/daterangepicker.js"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
    <!-- Bootstrap Switch -->
    <script src="resources/plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
    <!-- AdminLTE App -->
    <script src="resources/dist/js/adminlte.min.js"></script>
    <!-- SweetAlert2 -->
    <script src="resources/plugins/sweetalert2/sweetalert2.min.js"></script>
    <!-- Toastr -->
    <script src="resources/plugins/toastr/toastr.min.js"></script>


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

      $(document).ready(function() { 
            var my_js_data = document.getElementById('messageErreur.errors');
            if (my_js_data){
                toastr.error(my_js_data);     
             }
        });

      $("#actionButton").click(function(){
            $("#actionButton").addClass("disabled");
            $("#actionSpinner").removeClass("d-none");
        });

      $("#saveButton").click(function(){
            $("#saveButton").addClass("disabled");
            $("#saveSpinner").removeClass("d-none");
        });

      //Initialize Select2 Elements
      $('.select2').select2();

      //Initialize Select2 Elements
      $('.select2bs4').select2({
        theme: 'bootstrap4'
      });

      $("input[data-bootstrap-switch]").each(function(){
          $(this).bootstrapSwitch('state', $(this).prop('checked'));
        });

      $('#openFormButton').click(function(e){
    $( "#openForm" ).toggle( 'slow' );
  });




    });

    </script>
    
<%--<c:if test = "pageType == 'CREATE_ADHERENT'">--%>
  <script>
    $( function() {
      var globalTimeout = null;  
      var filterCp;
      var communeListe;

      $('#currentCommune').text($('#communeAdhLibelle').text());
	 
    
      $('#filterCpRCSCommune').bind("keyup", function(){
        // Si un delay est en cour, on le supprime
        if (globalTimeout != null) {
          clearTimeout(globalTimeout);
        }		
        // execution d'un delay
        globalTimeout = setTimeout(function() {
          globalTimeout = null;  
          filterCp={filter: $("#filterCpRCSCommune").val()}
          populateListe();
        }, 1000);  
      });

      $('#filterCPCommuneAdh').bind("keyup", function(){
        // Si un delay est en cour, on le supprime
        if (globalTimeout != null) {
          clearTimeout(globalTimeout);
        }		
        // execution d'un delay
        globalTimeout = setTimeout(function() {
          globalTimeout = null;  
          filterCp={filter: $("#filterCPCommuneAdh").val()}
          populateListe();
        }, 1000);  
      });

      function populateListe(){
        var params=filterCp;
        console.log (params);
		
        $.get("/scabotheque/loadCommuneListe",params, function(response) {
          console.log("retour servlet : " + response.length + " commune(s)");
          communeListe.find("option").remove();
          $.each(JSON.parse(response), function(index, commune) {
            $("<option>").val(commune.id).text(commune.codePostal + " - " + commune.libelle).appendTo(communeListe);
          });                          
        });
      }
      
      $('#editAdhCommune').click(function(e){ 
        communeLib = $("#communeAdhLibelle");
        communeListe = $("#communeAdhListe");
        $("#filterCPCommuneAdh").select();
      });
      
      $('#valideAdhCommune').click(function(e){ 
        communeLib.val(communeListe.find(':selected').text());
        $("#modal-adherentCommune").modal('toggle');
        $("#filterCpRCSCommune").select();
      });
      
      $('#editRcsCommune').click(function(e){ 
        communeLib = $("#communeRCSLibelle");
        communeListe = $("#communeRCSListe");
      });
      
      $('#valideRcsCommune').click(function(e){ 
        communeLib.val(communeListe.find(':selected').text());
        $("#modal-rcsCommune").modal('toggle');
      });
      
    } );
  </script>
<%--</c:if>--%>    


  </body>
</html>
