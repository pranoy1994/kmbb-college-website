<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
</head>
<body>
<br><div class="container">
<input type="text" class="form-control" id="myInput" onkeyup="myFunction()" placeholder="Search for books.."><br>
</div>
<script>
function myFunction() {
    // Declare variables
    var input, filter, ul, li, a, i;
    input = document.getElementById('myInput');
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName('tr');

    // Loop through all list items, and hide those who don't match the search query
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("td")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }
    }
}
</script>



<table class="table table-bordered">
<tbody id="myUL">
<c:forEach var="q" items="${theBooks}">
 <tr><td>
 ${q.name}
</td>
 <td>
${q.authors}
</td>
<td>
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal${q.id}">edit</button> | <a type="button" href="deleteBook?my=${q.id}" class="btn btn-danger btn-lg">delete</a>
 
 
 
 
 

<!-- Modal -->
<div id="myModal${q.id}" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Edit this book</h4>
      </div>
      <div class="modal-body">
       <form method="get" action="editThisBook" onsubmit="return xyz(${q.id})">
       <input type="hidden" name="id" value="${q.id}"/>
      Enter Name:
      <input class="form-control" id="name${q.id}" name="name" value="${q.name}">
       Enter Author names:
       <input class="form-control" id="authors${q.id}" name="authors" value="${q.authors }"><br>
       <input type="submit" class="btn btn-default">
       </form>
       
       
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

 
</td>
</tr>
 
</c:forEach>
</tbody>
</table>

<script>
function xyz(abc){
	if($('#name'+abc).val() == ""){
		alert("Enter name of the book");return false;
	}
	if($('#authors'+abc).val() == ""){
		
		alert("Enter author names of the book");return false;
	}
	
}


</script>


</body>
</html>