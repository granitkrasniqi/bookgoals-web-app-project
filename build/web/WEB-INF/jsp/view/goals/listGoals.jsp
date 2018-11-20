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

    <title>BookGoals - View Goals List</title>

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
                    <h1 class="page-header">Goals </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                <c:if test="${sucessDelete}">
                    <div class="alert alert-success">
                        Goal (<strong><c:out value="${goalName}"/></strong>) is successfully deleted.
                    </div>
                </c:if>
                    <div class="panel panel-default">
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Priority</th>
                                            <th>Start Date:</th>
                                            <th>Due Date</th>
                                            <th>Description</th>
                                            <th>Category</th>
                                            <th>Book</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${goalsList}" var="goal">
                                        <tr>
                                            <td><c:out value="${goal.name}"/></td>
                                            <td><c:out value="${goal.priority}"/></td>
                                            <td><c:out value="${goal.startDateFormatted}"/></td>
                                            <td><c:out value="${goal.dueDateFormatted}"/></td>
                                            <td><c:out value="${goal.goaldescription}"/></td>
                                            <td><c:out value="${goal.goalsCategoryid.name}"/></td>
                                            <td><c:out value="${goal.booksid.name}"/></td>
                                            <td></td>
                                            <th>
                                                <a href="books?action=view&id=<c:out value="${book.id}"/>" class="btn btn-default btn-round">
                                                View
                                                </a>
                                                <a href="books?action=edit&id=<c:out value="${book.id}"/>" class="btn btn-primary btn-round">Edit</a>
                                                <button type="submit"  rel="tooltip" class="btn btn-danger btn-round" data-original-title="" title="" 
                                                        data-toggle="modal" data-target="#deleteConfModal<c:out value="${book.id}" />">Delete</button>
                                                 </th>
                                        </tr>
                                        <!-- action forms -->
                                        <form action="books" method="post" id="deleteForm<c:out value="${goal.id}" />">
                                            <input type="hidden" name="mainAction" value="mainDelete"/>
                                            <input type="hidden" name="goalId" value="<c:out value="${goal.id}"/>"/>
                                        </form>
                                        <!-- action forms -->
                                        <!-- DELETE CONFIRMATION MODAL -->
                                        <div class="modal fade" id="deleteConfModal<c:out value="${goal.id}" />" tabindex="-1"
                                             role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Confirm</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to delete goal: <strong><c:out value="${goal.name}" /></strong>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                                        <button type="submit" class="btn btn-danger" form="deleteForm<c:out value="${goal.id}"/>">Confirm</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- DELETE CONFIRMATION MODAL -->
                                    </c:forEach>
                                    </tbody>
                                </table>
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
