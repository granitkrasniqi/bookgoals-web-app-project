<%-- 
    Document   : addBook
    Created on : Aug 29, 2018, 4:34:56 PM
    Author     : Granit Krasniqi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>BookGoals - Book (<c:out value="${book.name}" />)</title>

    <!-- Bootstrap Core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">
    
    <!-- My Custom CSS -->
    <link href="resources/dist/css/custom-css.css" rel="stylesheet">
    
    <!-- iziToast CSS -->
    <link href="resources/dist/css/iziToast.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- Bootstrap select -->
    <link rel="resources/dist/css/bootstrap-select.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <c:import url="../includes/nav.jsp"></c:import>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Book - <c:out value="${book.name}" /></h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            Informations
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <p>
                                Book name: <strong><c:out value="${book.name}" /></strong><br/>
                                Book description: <strong><c:out value="${book.description}" /></strong><br/>
                                Book publication year: <strong><c:out value="${book.year}" /></strong><br/>
                                Book number of pages: <strong><c:out value="${book.pages}" /></strong><br/>
                                Book author-s : <strong><c:out value="${book.authorsCollection.toString()}" /></strong><br/>
                                Book category: <strong><c:out value="${book.booksCategoryid}" /></strong><br/>
                                Book language: <strong><c:out value="${book.languagesname}" /></strong><br/>
                            </p>
                            <a href="books?action=list" class="btn btn-default btn-round">Go to books list</a>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                <!-- /.col-lg-12 -->
                </div>
            <!-- /.row -->
            </div>
        <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="resources/vendor/metisMenu/metisMenu.min.js"></script>
    
    <!-- Popper JavaScript -->
    <script src="resources/dist/js/popper.min.js"></script>
    
    <!-- Bootstrap Select JavaScript -->
    <script src="resources/dist/js/bootstrap-select.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="resources/dist/js/sb-admin-2.js"></script>
    
    <!-- SweetAlert JavaScript -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    
</body>

</html>
