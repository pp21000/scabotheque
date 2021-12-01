<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- jQuery -->
<script src="resources/plugins/jquery/jquery.min.js"></script>

<!-- Content Header (Page header) -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0 text-dark">Tableau de bord</h1>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <!-- Small boxes (Stat box) -->
    <div class="row">
      <!-- ./col -->
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-success">
          <div class="inner">
            <h3><c:out value="${nbAdherents}"/></h3>
            <p>Adherents</p>
          </div>
          <div class="icon">
            <i class="fas fa-users"></i>
            <ion-icon name="people-outline"></ion-icon>
          </div>
          <a href="adherentListe?list=adh" class="small-box-footer">Base adhérent <i class="fas fa-arrow-circle-right"></i></a>
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-info">
          <div class="inner">
            <h3>A rechercher - <c:out value="${adhSansEOLAS}"/></h3>
            <p>Adherents Administrateurs</p>
          </div>
          <div class="icon">
              <i class="fas fa-users"></i>
          </div>
          <a href="adherentListe?list=admin" class="small-box-footer">Base adhérent <i class="fas fa-arrow-circle-right"></i></a>
        </div>
      </div>

      <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_EXPLOITATION')">
        <div class="col-lg-3 col-6">
          <!-- small box -->
          <div class="small-box bg-success">
            <div class="inner">
              <h3>Base Logistique</h3>
              <p> -</p>
            </div>
            <div class="icon">
              <i class="fas fa-truck"></i>
              <ion-icon name="people-outline"></ion-icon>
            </div>
            <a href="ordreTournee" class="small-box-footer">Logistique <i class="fas fa-arrow-circle-right"></i></a>
          </div>
        </div>
      </sec:authorize>
    </div>
    <!-- ./row -->
    <div class="row">

      <!-- Custom tabs (Charts with tabs)-->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">
            <i class="fas fa-chart-pie mr-1"></i>
            Evolution du nombre d'adhérent
          </h3>
        </div><!-- /.card-header -->
        <div class="card-body">
          <div class="tab-content p-0">
            <div class="chart">
              <canvas id="areaChart" style="min-height: 200px; height: 350px;  max-width: 100%;"></canvas>
            </div>
          </div>
        </div>
      </div><!-- /.card-body -->
    </div>
      <!-- /.card -->
  </div>

</section>
 
                    <!-- ChartJS -->
    <script src="resources/plugins/chart.js/Chart.min.js"></script>

<script>
 $(function () {
    //--------------
    //- AREA CHART -
    //--------------

    // Get context with jQuery - using jQuery's .get() method.
    var chartCanvas = $('#areaChart').get(0).getContext('2d');

    var chartData = {
      labels  : ['2015', '2016', '2017', '2018', '2019', '2020', '2021'],
      datasets: [
        {
          label               : 'Adhérents actif',
          fill                : false,
          backgroundColor     : 'rgba(60,141,188,0.9)',
          borderColor         : 'rgba(60,141,188,0.8)',
          pointRadius         : true,
          pointColor          : '#3b8bba',
          pointStrokeColor    : 'rgba(60,141,188,1)',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(60,141,100,1)',
          data                : [<c:out value="${dataCahrtActif}"/>]
        },
        {
          label               : 'Nouveau',
//          fill                : false,
          backgroundColor     : 'rgba(210, 214, 222, 1)',
          borderColor         : 'rgba(210, 214, 222, 1)',
          pointRadius         : true,
          pointColor          : 'rgba(210, 200, 222, 1)',
          pointStrokeColor    : '#c1c7d1',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(220,240,220,1)',
          data                : [26, 18, 17, 19, 41, 16, 14]
        }
      ]
    };

    var chartOptions = {
      responsive              : true,
      maintainAspectRatio     : false,
      datasetFill             : false,
      
    };

    // This will get the first returned node in the jQuery collection.
    var chart       = new Chart(chartCanvas, { 
      type: 'bar',
      data: chartData, 
      options: chartOptions
    });

  });
</script>