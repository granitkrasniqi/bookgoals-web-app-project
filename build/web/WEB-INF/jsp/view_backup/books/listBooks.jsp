<%-- 
    Document   : dashboard
    Created on : Jul 8, 2018, 6:02:39 PM
    Author     : Granit Krasniqi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="resources/img/apple-icon.png" />
    <link rel="icon" type="image/png" href="resources/img/favicon.png" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Besi Tours - Lista e Klientëve</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <c:import url="../includes/htmlres.jsp" />
</head>

<body>
    <div class="wrapper">
        <c:import url="../includes/menu.jsp" />
        <div class="main-panel">
            <nav class="navbar navbar-transparent navbar-absolute">
                <div class="container-fluid">
                    <div class="navbar-minimize">
                        <button id="minimizeSidebar" class="btn btn-round btn-white btn-fill btn-just-icon">
                            <i class="material-icons visible-on-sidebar-regular">more_vert</i>
                            <i class="material-icons visible-on-sidebar-mini">view_list</i>
                        </button>
                    </div>
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"> Dashboard </a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">dashboard</i>
                                    <p class="hidden-lg hidden-md">Dashboard</p>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">notifications</i>
                                    <span class="notification">5</span>
                                    <p class="hidden-lg hidden-md">
                                        Notifications
                                        <b class="caret"></b>
                                    </p>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">Mike John responded to your email</a>
                                    </li>
                                    <li>
                                        <a href="#">You have 5 new tasks</a>
                                    </li>
                                    <li>
                                        <a href="#">You're now friend with Andrew</a>
                                    </li>
                                    <li>
                                        <a href="#">Another Notification</a>
                                    </li>
                                    <li>
                                        <a href="#">Another One</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">person</i>
                                    <p class="hidden-lg hidden-md">Profile</p>
                                </a>
                            </li>
                            <li class="separator hidden-lg hidden-md"></li>
                        </ul>
                        <form class="navbar-form navbar-right" role="search">
                            <div class="form-group form-search is-empty">
                                <input type="text" class="form-control" placeholder="Search">
                                <span class="material-input"></span>
                            </div>
                            <button type="submit" class="btn btn-white btn-round btn-just-icon">
                                <i class="material-icons">search</i>
                                <div class="ripple-container"></div>
                            </button>
                        </form>
                    </div>
                </div>
            </nav>
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header card-header-icon" data-background-color="rose">
                                    <i class="material-icons">assignment</i>
                                </div>
                                <h3 class="card-title"><strong>Lista e Klientëve</strong></h3>
                                <div class="card-content">
                                    <br/>
                                    <c:choose>
                                            <c:when test="${successDelete == true}">
                                                <noscript>
                                                <div class="alert alert-success">
                                                    <button type="button" aria-hidden="true" class="close"></button>
                                                    <span><b> Klienti (<c:out value="${emri}"></c:out>) - </b> u fshij me sukses.</span>
                                                </div>
                                                </noscript>
                                            </c:when>
                                            <c:when test="${errors != null}">
                                                <div class="alert alert-danger">
                                                    <ul>
                                                        <c:forEach items="${errors}" var="errMsg">
                                                            <li><c:out value="${errMsg}"/></li>
                                                            </c:forEach>
                                                    </ul>
                                                </div>
                                            </c:when>
                                    </c:choose>
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th class="text-center"><strong>#</strong></th>
                                                    <th><strong>Emri</strong></th>
                                                    <th><strong>Numri Biznesit</strong></th>
                                                    <th><strong>Numri Fiskal i Biznesit</strong></th>
                                                    <th><strong>Numri TVSH i Biznesit</strong></th>
                                                    <th><strong>Adresa</strong></th>
                                                    <th class="text-right"><strong>Xhirollogaria</strong></th>
                                                    <th class="text-right"><strong>Veprimet</strong></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            
                                                <c:forEach items="${klientet}" var="klienti">
                                                
                                                    <tr>
                                                        <td class="text-center"><c:out value="${klienti.id}"/></td>
                                                        <td><c:out value="${klienti.emri}"/></td>
                                                        <td><c:out value="${klienti.numriBiznesit}" /></td>
                                                        <td><c:out value="${klienti.numriFiskal}" /></td>
                                                        <td><c:out value="${klienti.numriTVSH}" /></td>
                                                        <td><c:out value="${klienti.adresaBiznesit}" /></td>
                                                        <td class="text-right"><c:out value="${klienti.xhirollogaria}" /></td>
                                                        <td class="td-actions text-right">
                                                            <!-- action forms -->
                                                            <form action="klienti" method="get" id="deleteForm<c:out value="${klienti.id}" />">
                                                                <input type="hidden" name="action" value="delete"/>
                                                                <input type="hidden" name="klientiId" value="${klienti.id}"/>
                                                            </form>
                                                            <!-- action forms -->
                                                            <!-- DELETE CONFIRMATION MODAL -->
                                                            <div class="modal fade" id="deleteConfModal<c:out value="${klienti.id}" />" tabindex="-1"
                                                                 role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Konfirmimi i Fshirjes</h5>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            Duhet të konfirmoni fshirjen e klientit me emër: <strong><c:out value="${klienti.emri}" /></strong>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="submit" class="btn btn-secondary" data-dismiss="modal">Anulo</button>
                                                                            <button type="submit" class="btn btn-danger" form="deleteForm<c:out value="${klienti.id}"/>">Konfirmo</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- DELETE CONFIRMATION MODAL -->
                                                            
                                                            <!-- INFORMATION BOX MODAL -->
                                                            <div class="modal fade" id="infoModal<c:out value="${klienti.id}" />" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="exampleModalLabel">Informatat e klientit: <strong><c:out value="${klienti.emri}" /></strong></h5>
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <div class="col-md-4">Emri: </div>
                                                                            <strong><c:out value="${klienti.emri}"/></strong><br/>
                                                                            <div class="col-md-4">Numri i Biznesit: </div>
                                                                            <strong><c:out value="${klienti.numriBiznesit}" /></strong><br/>
                                                                            <div class="col-md-4">Numri Fiskal i Biznesit: </div>
                                                                            <strong><c:out value="${klienti.numriFiskal}" /></strong><br/>
                                                                            <div class="col-md-4">Numri TVSH i Biznesit: </div>
                                                                            <strong><c:out value="${klienti.numriTVSH}" /></strong><br/>
                                                                            <div class="col-md-4">Adresa e Biznesit: </div>
                                                                            <strong><c:out value="${klienti.adresaBiznesit}" /></strong><br/>
                                                                            <div class="col-md-4">Xhirollogaria: </div>
                                                                            <strong><c:out value="${klienti.xhirollogaria}" /></strong><br/>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Mbyll</button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- INFORMATION BOX MODAL -->
                                                            <button type="button" rel="tooltip" class="btn btn-info btn-round" data-original-title="" title=""
                                                                    data-toggle="modal" data-target="#infoModal<c:out value="${klienti.id}" />">
                                                                <i class="material-icons">person</i>
                                                                <div class="ripple-container"></div></button>
                                                            <button type="button" rel="tooltip" class="btn btn-success btn-round show-info" 
                                                                    data-original-title="" title="" >
                                                                <i class="material-icons">edit</i>
                                                                <div class="ripple-container"></div></button>
                                                                <button type="submit" rel="tooltip" class="btn btn-danger btn-round" data-original-title="" title="" 
                                                                        data-toggle="modal" data-target="#deleteConfModal<c:out value="${klienti.id}" />">
                                                                <i class="material-icons">close</i>
                                                                <div class="ripple-container"></div></button>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <ul class="pagination pagination-info" id="paginationButtons">
                                            <c:forEach var="i" begin="0" end="${totalPages}">
                                                <li>
                                                    <a href="<c:url value="klienti">
                                                           <c:param name="action" value="listo"/>
                                                           <c:param name="page" value="${i + 1}"/>
                                                       </c:url>">${i + 1}<div class="ripple-container"></div></a>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div>
                    
            <footer class="footer">
                <div class="container-fluid">
                    <nav class="pull-left">
                        <ul>
                            <li>
                                <a href="#">
                                    Home
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Company
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Portfolio
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Blog
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <p class="copyright pull-right">
                        &copy;
                        <script>
                            document.write(new Date().getFullYear())
                        </script>
                        <a href="http://www.granitkrasniqi.com/">Granit Krasniqi</a>
                    </p>
                </div>
            </footer>
        </div>
    </div>
    </div>
</body>
<!--   Core JS Files   -->
<script src="resources/js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
<script src="resources/js/material.min.js" type="text/javascript"></script>
<script src="resources/js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
<!-- Forms Validations Plugin -->
<script src="resources/js/jquery.validate.min.js"></script>
<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="resources/js/moment.min.js"></script>
<!--  Charts Plugin -->
<script src="resources/js/chartist.min.js"></script>
<!--  Plugin for the Wizard -->
<script src="resources/js/jquery.bootstrap-wizard.js"></script>
<!--  Notifications Plugin    -->
<script src="resources/js/bootstrap-notify.js"></script>
<!--   Sharrre Library    -->
<script src="resources/js/jquery.sharrre.js"></script>
<!-- DateTimePicker Plugin -->
<script src="resources/js/bootstrap-datetimepicker.js"></script>
<!-- Vector Map plugin -->
<script src="resources/js/jquery-jvectormap.js"></script>
<!-- Sliders Plugin -->
<script src="resources/js/nouislider.min.js"></script>
<!--  Google Maps Plugin    -->
<!--<script src="resources/js/jquery.select-bootstrap.js"></script>-->
<!-- Select Plugin -->
<script src="resources/js/jquery.select-bootstrap.js"></script>
<!--  DataTables.net Plugin    -->
<script src="resources/js/jquery.datatables.js"></script>
<!-- Sweet Alert 2 plugin -->
<script src="resources/js/sweetalert2.js"></script>
<!--	Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="resources/js/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin    -->
<script src="resources/js/fullcalendar.min.js"></script>
<!-- TagsInput Plugin -->
<script src="resources/js/jquery.tagsinput.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="resources/js/material-dashboard.js"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="resources/js/demo.js"></script>
<script type="text/javascript">
    $(document).ready(function() {

        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

        demo.initVectorMap();
        
        $('.show-info').on('click', function() {
            swal({
                type: 'error',
                title: 'Oops...',
                text: 'Something went wrong!',
                footer: '<a href>Why do I have this issue?</a>'
            });
        });
    });
</script>
<script type="text/javascript">
   $(document).ready(function () {
       
        $('#paginationButtons > li:eq(<c:out value="${currentPage - 1}"></c:out>)').addClass('active');
   });
</script>
<c:if test="${successDelete == true}">
    <script type="text/javascript">
        swal({
                title: "Informacion!",
                text: "<c:out value="Klienti u fshij me sukses : ${emri}" />!",
                buttonsStyling: false,
                confirmButtonClass: "btn btn-success",
                type: "success"
            });
    </script>
</c:if>
</html>
