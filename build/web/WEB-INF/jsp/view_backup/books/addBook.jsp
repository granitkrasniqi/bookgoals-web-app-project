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
        <title>BookGoals - Add Book</title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
        <meta name="viewport" content="width=device-width" />
        <c:import url="../includes/htmlres.jsp" />
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.9/css/mdb.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
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
                                    <div class="card-header card-header-text" data-background-color="orange">
                                        <h4 class="card-title">Add a new Book</h4>
                                    </div>
                                    <div class="card-content">
                                        <form method="post" action="books" class="form-horizontal">
                                            <input type="hidden" name="mainAction" value="mainAdd" />
                                            <c:choose>
                                                <c:when test="${success == true}">
                                                    <div class="alert alert-success">
                                                        <button type="button" aria-hidden="true" class="close"></button>
                                                        <span><b> Book - </b> is added.</span>
                                                    </div>
                                                </c:when>
                                                <c:when test="${successDelete == true}">
                                                    <div class="alert alert-success">
                                                        <button type="button" aria-hidden="true" class="close"></button>
                                                        <span><b> Book (<c:out value="${emri}"></c:out>) - </b> is deleted successfully.</span>
                                                        </div>
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
                                            <div class="row">
                                                <label class="col-sm-4 label-on-left">Book name:</label>
                                                <div class="col-sm-4">
                                                    <div class="form-group label-floating is-empty">
                                                        <label class="control-label"></label>
                                                        <input type="text" class="form-control" <c:if test="${success == true}">disabled</c:if> value="<c:out value="${book.name}"/>" name="book-name">
                                                            <span class="material-input"></span></div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-sm-4 label-on-left">Book year:</label>
                                                    <div class="col-sm-4">
                                                        <div class="form-group label-floating is-empty">
                                                            <label class="control-label"></label>
                                                            <input type="text" class="form-control" <c:if test="${success == true}">disabled</c:if> value="<c:out value="${book.year}"/>" name="book-year">
                                                            <span class="material-input"></span></div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-sm-4 label-on-left">Book number of pages:</label>
                                                    <div class="col-sm-4">
                                                        <div class="form-group label-floating is-empty">
                                                            <label class="control-label"></label>
                                                            <input type="text" class="form-control" <c:if test="${success == true}">disabled</c:if> value="<c:out value="${book.pages}"/>" name="book-pages">
                                                            <span class="material-input"></span></div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-sm-4 label-on-left">Book description:</label>
                                                    <div class="col-sm-4">
                                                        <div class="form-group label-floating is-empty">
                                                            <label class="control-label"></label>
                                                            <textarea rows="10" class="form-control" <c:if test="${success == true}">disabled</c:if> value="<c:out value="${book.description}"/>" name="book-description"></textarea>
                                                            <span class="material-input"></span></div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-sm-4 label-on-left">Book category:</label>
                                                    <div class="col-sm-4">
                                                        <div class="form-group label-floating is-empty">
                                                            <label class="control-label"></label>
                                                            <select class="form-control" <c:if test="${success == true}">disabled</c:if>  name="book-category">
                                                            <c:forEach items="${bookscategories}" var="bookcategory">
                                                                <option value="${bookcategory.id}">${bookcategory.name}</option>
                                                            </c:forEach>
                                                            <c:if test="${success == true}">
                                                                <option value="${book.booksCategoryid.id}">${book.booksCategoryid.name}</option>
                                                            </c:if>
                                                            </select>
                                                            <span class="material-input"></span></div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-sm-4 label-on-left">Book language:</label>
                                                    <div class="col-sm-4">
                                                        <div class="form-group label-floating is-empty">
                                                            <label class="control-label"></label>
                                                            <select class="selectpicker" <c:if test="${success == true}">disabled</c:if> name="book-language" data-live-search="true">
                                                            <c:forEach items="${languages}" var="language">
                                                                <option value="${language.name}">${language.name}</option>
                                                            </c:forEach>
                                                            <c:if test="${success == true}">
                                                                <option value="${book.languagesname.name}">${book.languagesname.name}</option>
                                                            </c:if>
                                                            </select>
                                                            <span class="material-input"></span></div>
                                                    </div>
                                                </div>
                                                            
                                                <div class="row">
                                                    <label class="col-sm-4 label-on-left">Book author-s:</label>
                                                    <div class="col-sm-4">
                                                        <div class="form-group  is-empty">
                                                            <label class="control-label"></label>
                                                            <select class="form-control selectpicker" <c:if test="${success == true}">disabled</c:if>  name="book-category" multiple data-live-search="true">
                                                            <c:forEach items="${authors}" var="author">
                                                                <option value="${author.id}">${author.name += " " += author.surname}</option>
                                                            </c:forEach>
                                                            <c:if test="${success == true}">
                                                                <option value="${book.booksCategoryid.id}">${book.booksCategoryid.name}</option>
                                                            </c:if>
                                                            </select>
                                                            <span class="material-input"></span></div>
                                                    </div>
                                                </div>
                                            <c:choose>
                                                <c:when test="${success == true}">
                                                    <div class="row">
                                                        <label class="col-sm-4 label-on-left"></label>
                                                        <div class="col-sm-4" hidden="true">
                                                            <input type="submit" class="btn btn-fill btn-primary" value="Add"><div class="ripple-container"></div>
                                                        </div>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="row">
                                                        <label class="col-sm-4 label-on-left"></label>
                                                        <div class="col-sm-4">
                                                            <input type="submit" class="btn btn-fill btn-primary" value="Add"><div class="ripple-container"></div>
                                                        </div>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </form>
                                        <c:choose>
                                            <c:when test="${success == true}">
                                                <form action="books" method="post">
                                                    <input type="hidden" name="bookId" value="${bookId}">
                                                    <input type="hidden" name="mainAction" value="mainDelete">
                                                    <div class="row">
                                                        <label class="col-sm-4 label-on-left"></label>
                                                        <div class="col-sm-4">
                                                            <input type="submit" class="btn btn-fill btn-danger" value="Cancel"><div class="ripple-container"></div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
    <script type="text/javascript">
                                        $(document).ready(function () {
                                            
                                            $('select').selectpicker();

                                            // Javascript method's body can be found in assets/js/demos.js
                                            demo.initDashboardPageCharts();

                                            demo.initVectorMap();

                                        });
    </script>


</html>
