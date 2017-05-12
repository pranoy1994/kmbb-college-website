<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%if (session.getAttribute("pla") == null){response.sendRedirect("/college-project/work/index");} %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Calendar" %>
<html lang="en">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="shortcut icon" href="/college-project/assets/img/logo.png" type="image/png">
  <title>Placement Portal | KMBB CET</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 

.navbar {

      position: relative;
      min-height: 91px;
      margin-bottom: 20px;
      border: 1px solid transparent;
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #fff;
      padding: 25px;
    }
    
  .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }
.navbar-inverse {
    background-color: #0a0a29;
   
}

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }

@media (min-width: 768px){
.navbar-nav {
    float: right;
    margin: 0;

}}
  </style>
</head>
<body onload="fp()">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    <img src="/college-project/assets/img/logo.png" style="width:60px;height:60px;position: relative;
    top: -11px;"/>
    <b style="
    font-size: 50px; color:white"> KMBB <span style="
    font-size: small;
    -webkit-font-smoothing: subpixel-antialiased;
    font-family: cursive;
">Placement Department</span></b>
    
    
    <span style="
   color: white;
    position: relative;
    font-size: 8px;
    left: -320px;
    top: 11px;
}
">College of Engineering and Technology</span>
</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav nav-pills">
   <%--     <li ><a data-toggle="pill" href="#sectionA">Information</a></li>
        <li><a data-toggle="pill" href="#sectionB">Payment</a></li>
        <li><a data-toggle="pill" href="#sectionc">Testimonial</a></li>
      --%>
      </ul>
      
    </div>
  </div>
</nav>
<div class="container">
 <div class="tab-content">
      <div class="tab-pane fade in active" id="sectionA">
      
     <center> <h2>Welcome <c:forEach var="d" items="${pla}">${d.name}<c:set var="u" value="${d.username}"/></c:forEach></h2></center>
<script>

function validatePlacement(){
	if($('#companyName').val() == null || $('#companyName').val() == ""){
		$('#name9').show();
		
		return false;
	}else{
		$('#name9').hide();
	}
	if(document.getElementById('companyLogo').files.length == 0){
		console.log(document.getElementById('companyLogo').files.length);
		$('#logo9').show();
		return false;
	}else{
		$('#logo9').hide();
	}
	if($('#placedStudent').val() == ""){
		$('#placed9').show();
		return false;
	}
	else{
		$('#placed9').hide();
	}
	
}
</script>

<h3>Placement info</h3>
<h4>Add placed student</h4>
<form action="addPlacement" method="POST" enctype="multipart/form-data" onsubmit="return validatePlacement()">
<input type="hidden" name="my" value="${u}"/>
<div class="form-group">
<label for="companyName">Company Name:</label><p id="name9" style="display:none;color:red;">Name should be filled!</p>
<input type="text" id="companyName" class="form-control" name="companyName" placeholder="Enter name of the company"/>
</div>

<div class="form-group">
<label for="companyLogo">Company Logo:</label><p id="logo9" style="display:none;color:red;">A logo should be selected!</p>
<input type="file"  id="companyLogo" class="form-control" name="companyLogo" placeholder="Upload Company's logo" accept="image/*"/>
</div>

<div class="form-group">
<label for="placedStudent">Student placed:</label><p id="placed9" style="display:none;color:red;">Select the students who got placed</p>
<input id="placedStudent" class="form-control" name="placedStudent"  value= ""/>
</div>
<button class="btn btn-danger" onclick="resetMe()">reset</button>
<script>
function resetMe(){
	document.getElementById('placedStudent').value="";
}
</script>
<!-- give year -->


<fmt:formatDate var="year1" value="${now}" pattern="yyyy"/>
<input type="hidden" value="${year1}" name="year"/>
<input type="submit" class="btn btn-default" value = "submit"/>
<script>
function changeFunc(x){
	var clicked = document.getElementById(x).value;
	console.log(clicked);
	var txtarea = document.getElementById("placedStudent");
	console.log(txtarea);
	if(txtarea.value == ""){
	txtarea.value =  txtarea.value + clicked;
	}
	else
		txtarea.value =  txtarea.value+"," + clicked;
}
</script>
</form>
<h3>Select the student from here</h3>
  <input class="form-control" type="text" id="myInput2" onkeyup="myFunct1()" onkeypress= "fucn1()" placeholder="Search for names.." title="Type in a name" >
      
      <ul id="myUL2" class="w3-ul w3-small" style="display:none;">
  
 <c:forEach var="list" items="${studentList}">
  
  <li ><button id="b${list.id}" value="${list.fullName}(${list.registrationNumber})-(${list.branch})" onclick="changeFunc('b${list.id}')" class="btn btn-default">${list.fullName} (${list.registrationNumber}), (${list.branch})</button></li>
 
 </c:forEach>
</ul>
<script>
function fucn1(){
	console.log("inside fucn");
var x= document.getElementById("myUL2");
x.style.display="block";
}
function myFunct1() {
	console.log("inside myfucn");
    var input, filter, ul, li, a, i;
    input = document.getElementById("myInput2");
    if(input.value == ""){
    var x= document.getElementById("myUL2");
     x.style.display="none";
    }
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL2");
    li = ul.getElementsByTagName("li");
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("button")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "block";
        } else {
            li[i].style.display = "none";

        }
    }
}
</script>
<hr>
<h3>Delete from here</h3>
<table class="table table-bordered">
<thead>
<tr>
<td>
Sr.no
</td>
<td>
Company
</td>
<td>
Students
</td>
<td>
Remove
</td>
</tr>
</thead>
<tbody><% int c=1; %>
<c:forEach var="placementList" items="${placement}">
<tr>
<td>
<%= c++ %>
</td>
<td>
<img src="/college-project/image/getPlacementLogo?id=${placementList.id}" height="80px" width="80px"/>
<br>

${placementList.companyName},${placementList.year}

</td>
<td>
${placementList.studentsPlaced}
</td>
<td>
<a class="btn btn-default"  href="deletePlacement2?id=${placementList.id}&my=${u}" >Remove</a>

</td>
</tr>

</c:forEach>

</tbody>

</table>


</div>


<div class="tab-pane fade" id="sectionB">
 

</div>
<div class="tab-pane fade" id="sectionc">


</div>
</div>
</div>

<br>
 <div id="id01" class="w3-modal w3-animate-opacity">
    <div class="w3-modal-content w3-card-8">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id01').style.display='none'" 
        class="w3-button w3-large w3-display-topright">&times;</span>
             <h2>Change Password</h2>
      </header>
      <div class="w3-container">
        
        <br>
       <p id="showmsg" style="color:red;display:none">Password is not same</p>
        
        <c:forEach var="d" items="${pla}">
        <input type="hidden" value="${d.id}" name="id" id="id"/>
        Enter Name:
        <input type="text" class="form-control" id="name" value="${d.name}" style="width:200px"><br>
       </c:forEach>
         <label for="password1" style="font-size: 13px;">Enter your password:</label>
        <input type="password"  class="form-control" name="Password123" id="password123" required="required" style="width:200px" />
        <br>
        <label for="password2" style="font-size: 13px;">Enter your password again:</label>
        <input type="password" class="form-control" name="Password321" id="password321" required="required" style="width:200px"/><br>
        <input type="submit" id="newPass" class="btn btn-info">
        <br>
        <br> </div>      </div>      <footer class="w3-container w3-teal">     </footer>
    </div>
   <script>
      $(document).ready(function(){
    	$('#newPass').click(function(){
    		var p1=$('#password123').val().trim();
    		var p2=$('#password321').val().trim();
    		var n=$('#name').val().trim();
    		
    		if(p1=="" || p2=="" || n==""){
    			
    			alert("Put something !");return false;
    		}
    		if(p1 == p2){	
    		$.ajax({
    			url:'changePlacePass',
    			type:"POST",
    			data:'Password123='+p1+'&id='+$('#id').val()+'&name='+n,
    			success:function(data){
    				alert("Your Password has been changed, hit OK and login again in the home page..");	
    				window.location.href="index";	
    			},
    			error:function(data){
    				alert("Internal Server error!!");
    			}
    			
    			
    			
    			
    			
    		});
    		
    		}else{
    			$('#showmsg').show();
    		}
    		});
    	  
    	  
      })
      
      </script>

<br>
<footer class="navbar-fixed-bottom" style="background-color: #0a0a29;
    padding: 0px; color:white;text-align: right;">
  <p>Placement Portal | KMBB CET | <a href="#" onclick="document.getElementById('id01').style.display='block'">Change Password</a> | <a href='invalidateMe' style="colo:white"> Logout</a>&nbsp&nbsp      </p>
</footer>


</body>
</html>
