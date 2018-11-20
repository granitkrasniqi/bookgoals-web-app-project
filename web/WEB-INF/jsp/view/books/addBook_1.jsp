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

    <title>BookGoals - Add Book</title>

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
                    <h1 class="page-header">Add a new book</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Book Details
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form form method="post" action="books">
                                        <input type="hidden" name="mainAction" value="mainAdd" />
                                        <c:choose>
                                                <c:when test="${success == true}">
                                                    <div class="alert alert-success">
                                                        <button type="button" aria-hidden="true" class="close"></button>
                                                        <span>Book <strong>${book.name}</strong> - is added.</span>
                                                    </div>
                                                </c:when>
                                                <c:when test="${successDelete == true}">
                                                    <div class="alert alert-success">
                                                        <button type="button" aria-hidden="true" class="close"></button>
                                                        <span><b> Book (<c:out value="${book.name}"></c:out>) - </b> is deleted successfully.</span>
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
                                            <label>Book name:</label>
                                            <input type="text" class="form-control" name="book-name" 
                                                <c:if test="${success == true}">
                                                    disabled value="<c:out value="${book.name}"/>"
                                                </c:if>
                                                <c:if test="${bookName != null}">
                                                    value="<c:out value="${bookName}" />"
                                                </c:if> >
                                        </div>
                                        <div class="form-group">
                                            <label>Book publication year:</label>
                                            <input type="text" class="form-control" name="book-year" 
                                            <c:if test="${success == true}">
                                                disabled value="<c:out value="${book.year}"/>" 
                                            </c:if>
                                            <c:if test="${bookYear != null}">
                                                value="<c:out value="${bookYear}" />"
                                            </c:if> >
                                        </div>
                                        <div class="form-group">
                                            <label>Book number of pages:</label>
                                            <input type="text" class="form-control" name="book-pages" 
                                            <c:if test="${success == true}">
                                                disabled value="<c:out value="${book.pages}"/>"
                                            </c:if>
                                            <c:if test="${bookPages != null}">
                                                value="<c:out value="${bookPages}" />"
                                            </c:if> >
                                        </div>
                                        <div class="form-group">
                                            <label>Book description:</label>
                                            <textarea class="form-control" <c:if test="${success == true}">disabled</c:if> rows="5" name="book-description"><c:out value="${book.description}"/></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Book category:</label>
                                            <select class="form-control" <c:if test="${success == true}">disabled</c:if>  name="book-category">
                                                <c:choose>
                                                    <c:when test="${success}">
                                                        <option value="${book.booksCategoryid.id}">${book.booksCategoryid.name}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="-1"></option>
                                                        <c:forEach items="${bookscategories}" var="bookcategory">
                                                            <option value="${bookcategory.id}">${bookcategory.name}</option>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Book language:</label>
                                            <select class="form-control" <c:if test="${success == true}">disabled</c:if> name="book-language" data-live-search="true">
                                                <c:choose>
                                                    <c:when test="${success}">
                                                        <option value="${book.languagesname.name}">${book.languagesname.name}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="-1"></option>
                                                        <c:forEach items="${languages}" var="language">
                                                            <option value="${language.name}">${language.name}</option>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-lg-8" id="add-book-authors-box">
                                            <label>Book author-s:</label>
                                            <select class="form-control" id="book-authors" <c:if test="${success == true}">disabled</c:if>  name="book-authors" multiple data-live-search="true">
                                                <c:forEach items="${authors}" var="author">
                                                    <option value="${author.id}">${author.name += " " += author.surname}</option>
                                                </c:forEach>
                                            </select>
                                            </div>
                                                <div class="col-lg-offset-6">
                                                    <button id="add-book-add-author-btn" <c:if test="${success == true}">disabled</c:if> type="button" class="btn btn-primary" data-toggle="modal" data-target="#addAuthorModal">
                                                    Add Author
                                                </button>
                                                </div>
                                                <div class="clearfix"></div>
                                        </div>
                                            <c:choose>
                                                <c:when test="${success}">
                                                    <a class="btn" href="books?action=add">Add another book</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <button type="submit" class="btn btn-default">Submit</button>
                                                    <button type="reset" class="btn btn-default">Reset</button>
                                                </c:otherwise>
                                            </c:choose>
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
                                + authorInfoArray[2], authorInfoArray[0]);
                        $('#book-authors').append(authorOption);
                        $('#addAuthorModal').modal('hide');
                    });
                });
    </script>
</body>

</html>
