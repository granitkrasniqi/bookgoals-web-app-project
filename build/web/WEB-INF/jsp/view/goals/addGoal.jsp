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

    <title>BookGoals - Add Goal</title>

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
    
    <!-- Bootstrap Multiselect CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap-multiselect.css">
    
    <!-- Custom Fonts -->
    <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- Bootstrap datepicker css -->
    <link href="resources/css/bootstrap-datepicker3.min.css" rel="stylesheet">
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
                    <h1 class="page-header">Add a new goal</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Goal Details
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form form method="post" action="goals">
                                        <input type="hidden" name="mainAction" value="mainAdd" />
                                        <c:choose>
                                                <c:when test="${success == true}">
                                                    <div class="alert alert-success">
                                                        <button type="button" aria-hidden="true" class="close"></button>
                                                        <span>Goal <strong><c:out value="${goal.name}"/></strong> - is added.</span>
                                                    </div>
                                                </c:when>
                                                <c:when test="${successDelete == true}">
                                                    <div class="alert alert-success">
                                                        <button type="button" aria-hidden="true" class="close"></button>
                                                        <span><b> Goal (<c:out value="${goal.name}"></c:out>) - </b> is deleted successfully.</span>
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
                                        <div class="form-group">
                                            <label>Goal Name:</label>
                                            <input type="text" class="form-control" name="goal-name" 
                                                <c:if test="${success == true}">
                                                    disabled value="<c:out value="${goal.name}"/>"
                                                </c:if>
                                                <c:if test="${goalName != null}">
                                                    value="<c:out value="${goalName}" />"
                                                </c:if> >
                                        </div>
                                        
                                        <div class="form-group">
                                            <label>Goal Priority:</label>
                                            <select class="form-control" <c:if test="${success}">disabled</c:if>  name="goal-priority">
                                                <c:choose>
                                                    <c:when test="${success}">
                                                        <option value="${goal.priority}">${goal.priority}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="-1"></option>
                                                        <option value="high">High</option>
                                                        <option value="medium">Medium</option>
                                                        <option value="low">Low</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Start Date (M/D/Y):</label>
                                            <input type="text" class="form-control" <c:if test="${success}"> disabled value="<c:out value="${goal.startDateFormatted}"/>"</c:if> name="start-date" id="start-date">
                                        </div>
                                        <div class="form-group">
                                            <label>Due Date (M/D/Y):</label>
                                            <input type="text" class="form-control" <c:if test="${success}"> disabled value="<c:out value="${goal.dueDateFormatted}"/>"</c:if> name="due-date" id="due-date">
                                        </div>
                                        <div class="form-group">
                                            <label>Goal Description:</label>
                                            <textarea class="form-control" <c:if test="${success}">disabled</c:if> rows="5" name="goal-description"><c:out value="${goal.goaldescription}"/></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Goal Category:</label>
                                            <select class="form-control" <c:if test="${success}">disabled</c:if> name="goal-category">
                                                <c:choose>
                                                    <c:when test="${success}">
                                                        <option value="${goal.goalsCategoryid.id}"><c:out value="${goal.goalsCategoryid.name}"></c:out></option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="-1"></option>
                                                        <c:forEach items="${goalscategories}" var="goalcategory">
                                                            <option value="${goalcategory.id}"><c:out value="${goalcategory.name}"></c:out></option>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                                <a href="" class="btn btn-default">Add Category</a>
                                        </div>
                                        <div class="form-group">
                                            <label>Book Associated With This Goal: </label>
                                            <select class="form-control" <c:if test="${success}">disabled</c:if> id="goal-book" name="goal-book">
                                                <c:choose>
                                                    <c:when test="${success}">
                                                        <option value="${goal.booksid.id}"><c:out value="${goal.booksid.name}"></c:out></option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="-1"></option>
                                                        <c:forEach items="${books}" var="book">
                                                            <option value="${book.id}"><c:out value="${book.name}"/> - <c:out value="${book.authorsCollection.toString()}"/></option>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                            <div class="form-group">
                                            <c:choose>
                                                <c:when test="${success}">
                                                    <a class="btn" href="goals?action=add">Add another goal</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="submit" class="btn btn-default">Submit</button>
                                                    <button type="reset" class="btn btn-default">Reset</button>
                                                </c:otherwise>
                                            </c:choose>
                                            </div>
                                    </form>
                                </div>
                                                    
                                <!-- Modal -->
                                <div class="modal fade" id="addAuthorModal" tabindex="-1" role="dialog" aria-labelledby="addAuthorModalLabel" aria-hidden="true">
                                  <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                      <div class="modal-header">
                                          <h3 class="modal-title" id="addAuthorModalLabel"><strong>Add new book author</strong></h3>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                      </div>
                                      <div class="modal-body">
                                          <p class="alert-danger">Make sure author is not in the list before adding a new author</p>
                                          <form action="" >
                                              <div class="form-group">
                                                  <label>Author name:</label>
                                                  <input type="text" class="form-control" id="author-name-modal" name="book-name">
                                              </div>
                                              <div class="form-group">
                                                  <label>Author surname:</label>
                                                  <input type="text" class="form-control" id="author-surname-modal" name="book-year">
                                              </div>
                                          </form>
                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="reset" class="btn btn-default">Reset</button>
                                        <button type="button" class="btn btn-primary" id="submit-add-author">Submit</button>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
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
    
    <!-- Bootstrap Multiselect JS -->
    <script type="text/javascript" src="resources/js/bootstrap-multiselect.js"></script>
    
    <!-- Bootstrap DatePicker JS -->
    <script type="text/javascript" src="resources/js/bootstrap-datepicker.min.js"></script>
    
    <script type="text/javascript">
        $("#submit-add-author").click(function(){
            $.ajax({
                method: "POST",
                url: "author",
                data: {
                    mainAction: "mainAdd",
                    authorName: $("#author-name-modal").val(),
                    authorSurname: $("#author-surname-modal").val()
                }
            })
                    .done(function(msg) {
                        swal("Information", "Author is Saved.", "success");
                        var authorInfo = msg.toString();
                        var authorInfoArray = authorInfo.split(';');
                        var authorOption = new Option(authorInfoArray[1] + " " 
                                + authorInfoArray[2], authorInfoArray[0].trim());
                        $('#book-authors').append(authorOption);
                        $('#book-authors').multiselect('rebuild');
                        $('#addAuthorModal').modal('hide');
                    });
                });
    </script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#book-authors').multiselect({
                enableFiltering: true
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#start-date').datepicker({});
            $('#due-date').datepicker({});
        });
    </script>
</body>

</html>
