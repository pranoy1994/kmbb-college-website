<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%if (session.getAttribute("lib") == null){response.sendRedirect("/college-project/work/index");} %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Calendar" %>
<html lang="en">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="shortcut icon" href="/college-project/assets/img/logo.png" type="image/png">
  <title>Library Portal | KMBB CET</title>
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


.loader {
  border: 16px solid #f3f3f3;
  border-radius: 50%;
  border-top: 16px solid #3498db;
  width: 10px;
  height: 10px;
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}

@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>

</head>
<body>

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
">Library Department</span></b>
    
    
    <span style="
   color: white;
    position: relative;
    font-size: 8px;
    left: -309px;
    top: 11px;
}
">College of Engineering and Technology</span>
</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav nav-pills">
       
      
      </ul>
      
    </div>
  </div>
</nav>
<div class="container">
 <div class="tab-content">
      <div class="tab-pane fade in active" id="sectionA">

<br>

<center> <c:forEach var="d" items="${pla}"><h2>Welcome ${d.name}</h2></c:forEach></center>
<br>
<h2>Add a Library book</h2>
<br>
Book Name:
<input type="text" class="form-control" id="name" name="bookName" placeholder="Enter the name of the book"/>
Authors:
<textarea id="auth" name="auth" class="form-control"></textarea>
<br>
  <div class="col-lg-2  col-md-2 col-sm-2">
<button class="btn btn-default" id="save">Save book</button>
</div>
  <div class="col-lg-6  col-md-6 col-sm-6">
<div style="display:none" id="ldr" class="loader"></div>
</div>
<script>
$(document).ready(function(){
		$('#save').click(function(){
			
			if($('#name').val() == "" || $('#auth').val() == ""){alert("Please enter!!");return false;}
			
			$('#ldr').show();
			$.ajax({
				url:'saveBook',
				data:'name='+$('#name').val()+'&authors='+$('#auth').val(),
				type:'GET',
				success:function(data){
					$('#ldr').hide();
					alert("saved successfully!!!");
					$('#name').val("");
					$('#auth').val("");
					$('#iframe')[0].contentWindow.location.reload(true);
				},
				error:function(data){
					$('#ldr').hide();
					alert("internal server error!!!");
					$('#name').val("");
					$('#auth').val("");
				}	
			});
			});
			
		})
		
		

</script>
<br><br>
<br><br>
<h3>Current books in the library</h3>
<iframe id="iframe" src="books" width="100%" height="2000px"></iframe>

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
        <input type="text" class="form-control" id="name1" value="${d.name}" style="width:200px"><br>
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
    		var n=$('#name1').val().trim();
    		console.log(p1+"   "+p2+"    "+n);
    		if(p1=="" || p2=="" || n==""){
    			
    			alert("Put something !");return false;
    		}
    		if(p1 == p2){	
    		$.ajax({
    			url:'changeLibPass',
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
        
     
      <footer class="w3-container w3-teal">
       
      </footer>

  

<br>
<footer class="navbar-fixed-bottom" style="background-color: #0a0a29;
    padding: 0px; color:white;text-align: right;">
  <p>Library Portal | KMBB CET | <a href="#" onclick="document.getElementById('id01').style.display='block'">Change Password</a> | <a href='invalidateMe' style="colo:white"> Logout</a>&nbsp&nbsp      </p>
</footer>


</body>
</html>
