<%@page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<!-- jQuery -->
<script src="resources/plugins/jquery/jquery.min.js"></script>


<div class="text-2xl mb-3 font-medium text-center">Tableau de bord</div>

<div class="gap-5 flex justify-center">
    <a href="listeAdherents?list=adh"
       class="flex shadow-lg shadow-green-500/30 gap-4 justify-center pt-7 w-64 flex h-28 bg-green-100 border-t-4 border-green-500 cursor-pointer hover:bg-green-200 rounded-xl">
        <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"
             xmlns="http://www.w3.org/2000/svg">
            <path class="stroke-emerald-700" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
        </svg>
        <div class="flex justify-center">
            <div class="text-4xl font-medium text-green-700">
                <c:out value="${nbAdherents}"/>
            </div>
            <div class="pt-4 ml-2 text-md font-medium text-green-700">
                adhérents.
            </div>
        </div>
    </a>

    <a href="listeAdherents?list=admin"
       class="w-64 shadow-lg shadow-blue-500/30 flex gap-4 justify-center pt-7 h-28 flex-col p-4 mb-4 bg-blue-100 border-t-4 border-blue-500 cursor-pointer hover:bg-blue-200 rounded-xl"
       role="alert">
        <div class="flex">
            <svg class="w-10 h-10" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                 xmlns="http://www.w3.org/2000/svg">
                <path class="stroke-blue-700" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"></path>
            </svg>
            <div class="row-span-2 ml-3 pt-3 text-xl font-medium text-blue-700">
                À rechercher - <c:out value="${adhSansEOLAS}"/>
            </div>
        </div>

        <div class="row-span-2 text-center text-sm font-medium text-blue-700">
            Adhérents Administrateurs
        </div>
    </a>

    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_DIRECTION', 'ROLE_EXPLOITATION')">
        <a href="ordreTournee?list=adh"
           class="flex gap-3 shadow-lg shadow-green-500/30 justify-center items-center w-64 flex h-28 bg-green-100 border-t-4 border-green-500 cursor-pointer hover:bg-green-200 rounded-xl">
            <svg class="stroke-emerald-700 w-11 h-11" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                 xmlns="http://www.w3.org/2000/svg">
                <path d="M9 17a2 2 0 11-4 0 2 2 0 014 0zM19 17a2 2 0 11-4 0 2 2 0 014 0z"></path>
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="M13 16V6a1 1 0 00-1-1H4a1 1 0 00-1 1v10a1 1 0 001 1h1m8-1a1 1 0 01-1 1H9m4-1V8a1 1 0 011-1h2.586a1 1 0 01.707.293l3.414 3.414a1 1 0 01.293.707V16a1 1 0 01-1 1h-1m-6-1a1 1 0 001 1h1M5 17a2 2 0 104 0m-4 0a2 2 0 114 0m6 0a2 2 0 104 0m-4 0a2 2 0 114 0"></path>
            </svg>
            <div class="flex justify-center">
                <div class="text-md font-medium text-green-700">
                    Base Logistique
                </div>
            </div>
        </a>
    </sec:authorize>
</div>

<div class="flex justify-center text-2xl mt-8 font-medium text-center">Évolution du nombre d'adhérents</div>
<div class="w-2/3 h-1/2 mx-auto">
    <canvas id="areaChart"></canvas>
</div>

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
            labels: [<c:out value="${dataChartAnnee}"/>],
            datasets: [
                {
                    label: 'Adhérents actifs',
                    fill: false,
                    backgroundColor: 'rgb(108,151,170)',
                    borderColor: 'rgba(60,141,188,0.8)',
                    pointRadius: true,
                    pointColor: '#3b8bba',
                    pointStrokeColor: 'rgba(60,141,188,1)',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(60,141,100,1)',
                    data: [<c:out value="${dataChartActif}"/>]
                },
                {
                    label: 'Nouveaux adhérents',
//          fill                : false,
                    backgroundColor: 'rgba(210, 214, 222, 1)',
                    borderColor: 'rgba(210, 214, 222, 1)',
                    pointRadius: true,
                    pointColor: 'rgba(210, 200, 222, 1)',
                    pointStrokeColor: '#c1c7d1',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(220,240,220,1)',
                    data: [<c:out value="${dataChartNew}"/>]
                }
            ]
        };

        var chartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            datasetFill: false,

        };

        // This will get the first returned node in the jQuery collection.
        var chart = new Chart(chartCanvas, {
            type: 'bar',
            data: chartData,
            options: chartOptions
        });

    });
</script>