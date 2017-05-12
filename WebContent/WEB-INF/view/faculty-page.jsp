<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%if (session.getAttribute("fac") == null){response.sendRedirect("/college-project/work/index");} %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Calendar" %>
<html lang="en">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="shortcut icon" href="/college-project/assets/img/logo.png" type="image/png">
  <title>Faculty Portal | KMBB CET</title>
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
">Faculty Portal</span></b>
    
    
    <span style="
   color: white;
    position: relative;
    font-size: 8px;
    left: -270px;
    top: 11px;
}
">College of Engineering and Technology</span>
</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav nav-pills">
        <li ><a data-toggle="pill" href="#sectionA">Information</a></li>
        <li><a data-toggle="pill" href="#sectionB">Messages</a></li>
        <li><a data-toggle="pill" href="#sectionc">Testimonial</a></li>
      
      </ul>
      
    </div>
  </div>
</nav>
<div class="container">
 <div class="tab-content">
      <div class="tab-pane fade in active" id="sectionA">


<c:forEach var="list" items="${fac}">
<br>
 <table class="table table-bordered">
     <thead>
 <tr>
    <th colspan="3">${list.name}</th>
  </tr></thead>
  <tbody>
  <tr>

   <td rowspan="7"><img src="/college-project/image/getFacultyImage?id=${list.id}" height="200px" width="170px"/>
   <br>
   <br>
   <br>
   <form action="savefaultyImage" method="POST" enctype='multipart/form-data' onsubmit = "return validateImg()">
   <input type="file" name="img" id="img"><br>
   <input type="hidden" name="uname" value="${sessionScope.fac}">
   <input type="hidden" name="reg" value="${list.id}">
   <input type="submit"value="save" class="btn btn-primary btn-sm">
   </form>
   
   </td>
    <tr>
<td>Department</td>
<td>${list.department}</td>
</tr>

<tr>
<td>Qualification</td>
<td>${list.qualification}</td>
</tr>

<tr>
 <td >Gender</td>
<td> ${list.gender}</td>
</tr>

<tr>
<td >Designation</td>
<td>${list.designation}</td>
</tr>

<tr>
<td >username</td>
<td>${list.username}</td>
</tr>

<tr>
<td >Contact number</td>
<td>${list.contact}</td>
</tr>




</table>


Edit or enter your details from here <a data-toggle="modal" data-target="#${list.id}" class="btn btn-info">edit</a>
<div id="${list.id}" class="modal fade" role="dialog">
     <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Edit Faculty</h4>
      </div>
      <div class="modal-body">
      
      <form action="editFaculty" method="POST" enctype='multipart/form-data' onsubmit="return validateEditFaculty('${list.id}')">
      <input type="hidden" value="${list.id}" name="id"/>
      <div class="from-group">
      <label for="name">Name
      </label><p id="labelname22${list.id}" style="display:none;color:red;">Something should be typed!</p>
      <input type="text" class="form-control" id="name22${list.id}" name="name" placeholder="Enter name of the faculty" value="${list.name}"/>
      </div>
       
  
   <div class="form-group">
    <label for="designation">Designation</label><p id="labeldesignation22${list.id}" style="display:none;color:red;">Enter the designation of the faculty!</p>
    <input type="text" class="form-control" id="designation22${list.id}" name="designation" value="${list.designation}" placeholder="Enter the designation of the faculty"/>
  </div>
  
  <div class="form-group">
    <label for="designation">Gender</label><p id="labelgender22${list.id}" style="display:none;color:red;">Select your gender!</p>
    <select name="gender" id="sel${list.id}" class="form-control">
    <option value="sel">Select</option>
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    </select>
  </div>
  <%-- 
  <div class="form-group">
  <label for="photo">Upload faculty image</label><p id="labelphoto22${list.id}" style="display:none;color:red;">Select an image!</p>
 <input class="form-control" id="photo22${list.id}" type="file" name="photo" accept="image/*"/>

</div>
<input type="hidden" name="department" value="${list.department}"/>
<input type="hidden" name="username" value="${list.username}"/>
<input type="hidden" name="password" value="${list.password}"/>
--%>
<input type="hidden" name="uname" value="${sessionScope.fac}">


<div class="form-group">
    <label for="contact">Contact number</label><p id="labelcontact22${list.id}" style="display:none;color:red;">Enter contact no!</p>
    <input type="text" class="form-control" id="contact${list.id}" name="contact" value="${list.contact}" placeholder="Enter your contact no"/>
  </div>
<div class="form-group">
    <label for="qualification">Qualification</label><p id="labelqualification22${list.id}" style="display:none;color:red;">Enter qualification of the faculty!</p>
    <input type="text" class="form-control" id="qualification${list.id}" name="qualification" value="${list.qualification}" placeholder="Enter the qualification details of the faculty"/>
  </div>
<%--  <input type="hidden" value="${list.department}" name="dept"/> --%>
  <button type="submit" class="btn btn-primary">Submit</button> 
      
      
      
      </form>
      
      
      
      
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
      </div>
      </div>
      
    
    </div>
    </c:forEach>
</div><script>
function validateEditFaculty(abc){
    	
	if($('#sel'+abc).val() == "sel"){
		$('#labelgender22'+abc).show();
		return false;
	}else{
		
		$('#labelgender22'+abc).hide();
	}
	
	if($('#contact'+abc).val() == "null" || $('#contact'+abc).val() == ""){
  		 $('#labelcontact22'+abc).show();
  		 return false;
  		 }else{$('#labelcontact22'+abc).hide();}
	
    	if($('#name22'+abc).val() == "null" || $('#name22'+abc).val() == ""){
   		 $('#labelname22'+abc).show();
   		 return false;
   		 }else{$('#labelname22'+abc).hide();}

   		 if($('#designation22'+abc).val() == "null" || $('#designation22'+abc).val() == ""){
   		 $('#labeldesignation22'+abc).show();
   		 return false;
   		 }else{$('#labeldesignation22'+abc).hide();}

   		 if(document.getElementById('photo22'+abc).files.length == 0){
   		 $('#labelphoto22'+abc).show();
   		 return false;
   		 }else{$('#labelphoto22'+abc).hide();}

   		 if($('#qualification'+abc).val() == "null" || $('#qualification'+abc).val() == ""){
   		 $('#labelqualification22'+abc).show();
   		 return false;
   		 }else{$('#labelqualification22'+abc).hide();}
   	 
    	
    	
    	
    	
    	
    }
    
    </script>
    <script>
function validateImg(){
	if(document.getElementById("img").files.length ==  0){
	alert("Please select your photo..");
	return false;
	}
}

</script>

<div class="tab-pane fade" id="sectionB">
 
 <h2>Send Messages</h2>
 <h4>Students</h4>
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
<fmt:formatDate var="month" value="${now}" pattern="MM"/>
<c:choose>
<c:when test="${month ge 6}">
<c:set var="i" value="${0}" />
</c:when> 
<c:otherwise>
<c:set var="i" value="${1}"/>
</c:otherwise>
</c:choose>



 <div class="panel-group" id="accordion1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion1" href="#collapseOne">1st Year
                        </a>
                    </h4>
                </div>
                
                <script>
                $(function () {
                    $("#checkAll").click(function () {
                        if ($("#checkAll").is(':checked')) {
                            $(".point").prop("checked", true);
                        } else {
                            $(".point").prop("checked", false);
                        }
                    });
                });
                </script>
                
                <div id="collapseOne" class="panel-collapse collapse">
                     <div class="panel-body">
                        <div class="panel-body">
                            
                            <div class="panel-group" id="accordion21">
                                <div class="panel">
                                 <input type="checkbox" name="select-all" id="checkAll">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOne1">Mechanical Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOne1" class="panel-collapse collapse">
                                        
                                    <c:forEach var="x" items="${studentList}">   
                                   
                                   <c:set var="p" value="Mechanical Engineering"/>
                                     <c:choose> 
                                     <c:when test="${x.admissionYear == (year - i) and x.branch == p}" >  
                                        
                    &nbsp &nbsp&nbsp  <input type="checkbox" class="point" value="${x.mobContact}">${x.fullName}<br>
                      
                                     </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    
                                    </div>
                                </div>
                                 <script>
                                 $(function () {
                    $("#checkAllq").click(function () {
                        if ($("#checkAllq").is(':checked')) {
                            $(".pointq").prop("checked", true);
                        } else {
                            $(".pointq").prop("checked", false);
                        }
                    });
                });
                                </script>
                                
                                
                                <div class="panel ">
                                <input type="checkbox" id="checkAllq">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoTwo2">Computer Science And Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoTwo2" class="panel-collapse collapse">
                                        <c:forEach var="x" items="${studentList}">   
                                     <c:set var="p" value="Computer Science And Engineering"/>
                                     <c:choose> 
                                     <c:when test="${x.admissionYear eq (year - i) and x.branch eq p}" >
                                     
                                     
                                     
                              &nbsp &nbsp&nbsp  <input type="checkbox" class="pointq" value="${x.mobContact}">${x.fullName}<br>
                                        
                                       
                                        </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                 <script>
                                 $(function () {
                    $("#checkAllp").click(function () {
                        if ($("#checkAllp").is(':checked')) {
                            $(".pointp").prop("checked", true);
                        } else {
                            $(".pointp").prop("checked", false);
                        }
                    });
                });
                                </script>
                                <div class="panel">
                                <input type="checkbox" id="checkAllo">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOne3">Civil Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOne3" class="panel-collapse collapse">
                                        <div id="collapseTwoTwo2" class="panel-collapse collapse">
                                        <c:forEach var="x" items="${studentList}">   
                                     <c:set var="p" value="Civil Engineering"/>
                                     <c:choose> 
                                    <c:when test="${x.admissionYear eq (year - i) and x.branch eq p}" >
                                     
                                 
                                     
                        &nbsp &nbsp&nbsp  <input type="checkbox" class="pointp" value="${x.mobContact}">${x.fullName}<br>
                                        
                                        </c:when>
                                        
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                    </div>
                                </div>
                                 <script>
                                 $(function () {
                    $("#checkAllo").click(function () {
                        if ($("#checkAllo").is(':checked')) {
                            $(".pointo").prop("checked", true);
                        } else {
                            $(".pointo").prop("checked", false);
                        }
                    });
                });
                                </script>
                                <div class="panel">
                                <input type="checkbox" id="checkAllo">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOne4">Electrical Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOne4" class="panel-collapse collapse">
                                         <c:forEach var="x" items="${studentList}">   
                                     
                                     <c:choose> 
                                     <c:when test="${x.admissionYear eq (year - i) and x.branch eq p}" >
                                     
                                     
                                     
                                       &nbsp &nbsp&nbsp  <input type="checkbox" class="pointo" value="${x.mobContact}">${x.fullName}<br>
                                       
                                        </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                <script>
                                 $(function () {
                    $("#checkAlln").click(function () {
                        if ($("#checkAlln").is(':checked')) {
                            $(".pointn").prop("checked", true);
                        } else {
                            $(".pointn").prop("checked", false);
                        }
                    });
                });
                                </script>
                                
                                
                                <div class="panel">
                                <input type="checkbox" id="checkAlln">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOne5">Electrical and Electronics Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOne5" class="panel-collapse collapse">
                                         <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Electrical and Electronics Engineering"/>
                                     <c:choose> 
                                     <c:when test="${x.admissionYear eq (year - i) and x.branch eq p}" >
                                    
                                     
                                     
                            &nbsp &nbsp&nbsp  <input type="checkbox" class="pointn" value="${x.mobContact}">${x.fullName}<br>
                                        
                                        </c:when>
                                        
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                <script>
                                 $(function () {
                    $("#checkAllm").click(function () {
                        if ($("#checkAllm").is(':checked')) {
                            $(".pointm").prop("checked", true);
                        } else {
                            $(".pointm").prop("checked", false);
                        }
                    });
                });
                                </script>
                                
                                <div class="panel">
                                <input type="checkbox" id="checkAllm">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOne6">Electronics and Communication Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOne6" class="panel-collapse collapse">
                                        <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Electronics and Communication Engineering"/>
                                     <c:choose> 
                                      <c:when test="${x.admissionYear eq (year - i) and x.branch eq p}" >
                                     
                                    
                    &nbsp &nbsp&nbsp  <input type="checkbox" class="pointm" value="${x.mobContact}">${x.fullName}<br>
                                        
                                       
                                        </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                
                                
                                
                                
                                
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo">2nd Year
                        </a>
                    </h4>
                </div>
                
                
                <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body">
                        <div class="panel-body">
                            <script>
                                 $(function () {
                    $("#checkAlll").click(function () {
                        if ($("#checkAlll").is(':checked')) {
                            $(".pointl").prop("checked", true);
                        } else {
                            $(".pointl").prop("checked", false);
                        }
                    });
                });
                                </script>
                            <div class="panel-group" id="accordion21">
                                <div class="panel">
                                <input type="checkbox" id="checkAlll">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOnea">Mechanical Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOnea" class="panel-collapse collapse">
                                         <c:forEach var="x" items="${studentList}">   
                                    
                                     <c:choose> 
                                      <c:when test="${x.admissionYear eq (year - i -1) and x.branch eq p}" >
                                      
                                    
                                     
              &nbsp &nbsp&nbsp  <input type="checkbox" class="pointl" value="${x.mobContact}">${x.fullName}<br>
                                        
                                        </c:when>
                                   
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                <script>
                                 $(function () {
                    $("#checkAllk").click(function () {
                        if ($("#checkAllk").is(':checked')) {
                            $(".pointk").prop("checked", true);
                        } else {
                            $(".pointk").prop("checked", false);
                        }
                    });
                });
                                </script>
                                
                                
                                <div class="panel ">
                                <input type="checkbox" id="checkAllk">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoTwob">Computer Science And Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoTwob" class="panel-collapse collapse">
                                        <c:forEach var="x" items="${studentList}">   
                                     <c:set var="p" value="Computer Science And Engineering"/>
                                     <c:choose> 
                                     <c:when test="${x.admissionYear eq (year - i -1) and x.branch eq p}" >
                                     
                                    
                                     
                        &nbsp &nbsp&nbsp  <input type="checkbox" class="pointk" value="${x.mobContact}">${x.fullName}<br>
                                        
                                       
                                        </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                <script>
                                 $(function () {
                    $("#checkAllj").click(function () {
                        if ($("#checkAllj").is(':checked')) {
                            $(".pointj").prop("checked", true);
                        } else {
                            $(".pointj").prop("checked", false);
                        }
                    });
                });
                                </script>
                                <div class="panel">
                                <input type="checkbox" id="checkAllj">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOnec">Civil Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOnec" class="panel-collapse collapse">
                                       <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Civil Engineering"/>
                                     <c:choose> 
                                      <c:when test="${x.admissionYear eq (year - i -1) and x.branch eq p}" >
                                    
                                     
                                     
                                   &nbsp &nbsp&nbsp  <input type="checkbox" class="pointj" value="${x.mobContact}">${x.fullName}<br>
                                        
                                        </c:when>
                                       
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                 <script>
                                 $(function () {
                    $("#checkAlli").click(function () {
                        if ($("#checkAlli").is(':checked')) {
                            $(".pointi").prop("checked", true);
                        } else {
                            $(".pointi").prop("checked", false);
                        }
                    });
                });
                                </script>
                                <div class="panel">
                                <input type="checkbox" id="checkAlli">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOned">Electrical Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOned" class="panel-collapse collapse">
                                        <c:forEach var="x" items="${studentList}">   
                                     <c:set var="p" value="Electrical Engineering"/>
                                     <c:choose> 
                                   <c:when test="${x.admissionYear eq (year - i -1) and x.branch eq p}" >
                                     
                                     
                                     
                                        &nbsp &nbsp&nbsp  <input type="checkbox" class="pointi" value="${x.mobContact}">${x.fullName}<br>
                                        
                                        </c:when>
                                      
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                <script>
                                 $(function () {
                    $("#checkAllh").click(function () {
                        if ($("#checkAllh").is(':checked')) {
                            $(".pointh").prop("checked", true);
                        } else {
                            $(".pointh").prop("checked", false);
                        }
                    });
                });
                                </script>
                                
                                
                                <div class="panel">
                                <input type="checkbox" id="checkAllh">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOnee">Electrical and Electronics Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOnee" class="panel-collapse collapse">
                                       <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Electrical and Electronics Engineering"/>
                                     <c:choose> 
                                      <c:when test="${x.admissionYear eq (year - i -1) and x.branch eq p}" >
                                    
                                     
                                     
      &nbsp &nbsp&nbsp  <input type="checkbox" class="pointh" value="${x.mobContact}">${x.fullName}<br>
                                        
                                        
                                        </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                <script>
                                 $(function () {
                    $("#checkAllg").click(function () {
                        if ($("#checkAllg").is(':checked')) {
                            $(".pointg").prop("checked", true);
                        } else {
                            $(".pointg").prop("checked", false);
                        }
                    });
                });
                                </script>
                                
                                <div class="panel">
                                <input type="checkbox" id="checkAllg">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOnef">Electronics and Communication Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOnef" class="panel-collapse collapse">
                                        <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Electronics and Communication Engineering"/>
                                     <c:choose> 
                                     <c:when test="${x.admissionYear eq (year - i -1) and x.branch eq p}" >
                                    
                                    
                                     
                          &nbsp &nbsp&nbsp  <input type="checkbox" class="pointg" value="${x.mobContact}">${x.fullName}<br>
                                        
                                      
                                        </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                
                                
                                
                                
                                
                                
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>







            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion1" href="#collapseThree">3rd Year
                        </a>
                    </h4>
                </div>
                <div id="collapseThree" class="panel-collapse collapse">
                  <script>
                                 $(function () {
                    $("#checkAllf").click(function () {
                        if ($("#checkAllf").is(':checked')) {
                            $(".pointf").prop("checked", true);
                        } else {
                            $(".pointf").prop("checked", false);
                        }
                    });
                });
                                </script>
                   <div class="panel-body">
                        <div class="panel-body">
                            
                            <div class="panel-group" id="accordion21">
                                <div class="panel">
                                <input type="checkbox" id="checkAllf">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOneg">Mechanical Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOneg" class="panel-collapse collapse">
                                        <c:forEach var="x" items="${studentList}">   
                                     <c:set var="p" value="Mechanical Engineering"/>
                                     <c:choose> 
                                      <c:when test="${x.admissionYear eq (year - i -2) and x.branch eq p}" >
                                     
                                 
                                     
            &nbsp &nbsp&nbsp  <input type="checkbox" class="pointf" value="${x.mobContact}">${x.fullName}<br>
                                        
                                        </c:when>
                                      
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                 <script>
                                 $(function () {
                    $("#checkAlle").click(function () {
                        if ($("#checkAlle").is(':checked')) {
                            $(".pointe").prop("checked", true);
                        } else {
                            $(".pointe").prop("checked", false);
                        }
                    });
                });
                                </script>
                                
                                
                                <div class="panel ">
                                <input type="checkbox" id="checkAlle">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoTwoh">Computer Science And Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoTwoh" class="panel-collapse collapse">
                                         <c:forEach var="x" items="${studentList}">   
                                     <c:set var="p" value="Computer Science And Engineering"/>
                                     <c:choose> 
                                    <c:when test="${x.admissionYear eq (year - i -2) and x.branch eq p}" >
                                     
                                   
                                     
              &nbsp &nbsp&nbsp  <input type="checkbox" class="pointe" value="${x.mobContact}">${x.fullName}<br>
                                        
                                        
                                        </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                <script>
                                 $(function () {
                    $("#checkAlld").click(function () {
                        if ($("#checkAlld").is(':checked')) {
                            $(".pointd").prop("checked", true);
                        } else {
                            $(".pointd").prop("checked", false);
                        }
                    });
                });
                                </script>
                                <div class="panel">
                                <input type="checkbox" id="checkAlld">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOnei">Civil Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOnei" class="panel-collapse collapse">
                                        <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Civil Engineering"/>
                                     <c:choose> 
                                    <c:when test="${x.admissionYear eq (year - i -2) and x.branch eq p}" >
                                     
                                     
                                     
               &nbsp &nbsp&nbsp  <input type="checkbox" class="pointd" value="${x.mobContact}">${x.fullName}<br>
                                        
                                       
                                        </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                <script>
                                 $(function () {
                    $("#checkAllc").click(function () {
                        if ($("#checkAllc").is(':checked')) {
                            $(".pointc").prop("checked", true);
                        } else {
                            $(".pointc").prop("checked", false);
                        }
                    });
                });
                                </script>
                                <div class="panel">
                                <input type="checkbox" id="checkAllc">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOnek">Electrical Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOnek" class="panel-collapse collapse">
                                         <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Electrical Engineering"/>
                                     <c:choose> 
                                      <c:when test="${x.admissionYear eq (year - i -2) and x.branch eq p}" >
                                    
                                    
                                     
   &nbsp &nbsp&nbsp  <input type="checkbox" class="pointc" value="${x.mobContact}">${x.fullName}<br>
                                        
                                       
                                        </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                <script>
                                 $(function () {
                    $("#checkAllb").click(function () {
                        if ($("#checkAllb").is(':checked')) {
                            $(".pointb").prop("checked", true);
                        } else {
                            $(".pointb").prop("checked", false);
                        }
                    });
                });
                                </script>
                                
                                
                                <div class="panel">
                                <input type="checkbox" id="checkAllb">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOnel">Electrical and Electronics Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOnel" class="panel-collapse collapse">
                                    
                                        <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Electrical and Electronics Engineering"/>
                                     <c:choose> 
                                     <c:when test="${x.admissionYear eq (year - i -2) and x.branch eq p}" >
                                    
                                    
                                     
                                &nbsp &nbsp&nbsp  <input type="checkbox" class="pointb" value="${x.mobContact}">${x.fullName}<br>
                                        
                                        </c:when>
                                        
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                 <script>
                                 $(function () {
                    $("#checkAlla").click(function () {
                        if ($("#checkAlla").is(':checked')) {
                            $(".pointa").prop("checked", true);
                        } else {
                            $(".pointa").prop("checked", false);
                        }
                    });
                });
                                </script>
                                
                                <div class="panel">
                                <input type="checkbox" id="checkAlla">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOnem">Electronics and Communication Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOnem" class="panel-collapse collapse">
                                        <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Electronics and Communication Engineering"/>
                                     <c:choose> 
                                    <c:when test="${x.admissionYear eq (year - i -2) and x.branch eq p}" >
                                    
                                    
                                     
                            &nbsp &nbsp&nbsp  <input type="checkbox" class="pointa" value="${x.mobContact}">${x.fullName}<br>
                                        
                                       
                                        </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                
                                
                                
                                
                                
                                
                                
                            </div>
                        </div>
                    </div>
                  
                  
                  
                  
                   </div>
                   
                  
                   
                   
            </div>



 <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion1" href="#collapsefour">4th Year
                        </a>
                    </h4>
                </div>
                <div id="collapsefour" class="panel-collapse collapse">
                  <script>
                                 $(function () {
                    $("#checkAll9").click(function () {
                        if ($("#checkAll9").is(':checked')) {
                            $(".point9").prop("checked", true);
                        } else {
                            $(".point9").prop("checked", false);
                        }
                    });
                });
                                </script>
                   <div class="panel-body">
                        <div class="panel-body">
                            
                            <div class="panel-group" id="accordion21">
                                <div class="panel">
                                <input type="checkbox" id="checkAll9">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOnen">Mechanical Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOnen" class="panel-collapse collapse">
                                        <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Mechanical Engineering"/>
                                     <c:choose> 
                                     <c:when test="${x.admissionYear eq (year - i -3) and x.branch eq p}" >
                                    
                                     
                                     
                     &nbsp &nbsp&nbsp  <input type="checkbox" class="point" value="${x.mobContact}">${x.fullName}<br>
                                        
                                        
                                        </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                <script>
                                 $(function () {
                    $("#checkAll0").click(function () {
                        if ($("#checkAll0").is(':checked')) {
                            $(".point0").prop("checked", true);
                        } else {
                            $(".point0").prop("checked", false);
                        }
                    });
                });
                                </script>
                                
                                <div class="panel ">
                                <input type="checkbox" id="checkAll0">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoTwoo">Computer Science And Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoTwoo" class="panel-collapse collapse">
                                        <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Computer Science And Engineering"/>
                                     <c:choose> 
                                     <c:when test="${x.admissionYear eq (year - i -3) and x.branch eq p}" >
                                    
                                   
                                     
                       &nbsp &nbsp&nbsp  <input type="checkbox" class="point0" value="${x.mobContact}">${x.fullName}<br>
                                        
                                      
                                        </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                <script>
                                 $(function () {
                    $("#checkAll1").click(function () {
                        if ($("#checkAll1").is(':checked')) {
                            $(".point1").prop("checked", true);
                        } else {
                            $(".point1").prop("checked", false);
                        }
                    });
                });
                                </script>
                                
                                <div class="panel">
                                <input type="checkbox" id="checkAll1">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOnep">Civil Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOnep" class="panel-collapse collapse">
                                         <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Civil Engineering"/>
                                     <c:choose> 
                                     <c:when test="${x.admissionYear eq (year - i -3) and x.branch eq p}" >
                                    
                                     
                                     
              &nbsp &nbsp&nbsp  <input type="checkbox" class="point1" value="${x.mobContact}">${x.fullName}<br>
                                        
                                     
                                        </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                 <script>
                                 $(function () {
                    $("#checkAll2").click(function () {
                        if ($("#checkAll2").is(':checked')) {
                            $(".point2").prop("checked", true);
                        } else {
                            $(".point2").prop("checked", false);
                        }
                    });
                });
                                </script>
                                <div class="panel">
                                <input type="checkbox" id="checkAll2">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOneq">Electrical Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOneq" class="panel-collapse collapse">
                                      <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Electrical Engineering"/>
                                     <c:choose> 
                                    <c:when test="${x.admissionYear eq (year - i -3) and x.branch eq p}" >
                                     
                                   
                                     
             &nbsp &nbsp&nbsp  <input type="checkbox" class="point2" value="${x.mobContact}">${x.fullName}<br>
                                        
                                        </c:when>
                                       
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                
                                <script>
                                 $(function () {
                    $("#checkAll3").click(function () {
                        if ($("#checkAll3").is(':checked')) {
                            $(".point3").prop("checked", true);
                        } else {
                            $(".point3").prop("checked", false);
                        }
                    });
                });
                                </script>
                                
                                <div class="panel">
                                <input type="checkbox" id="checkAll3">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOner">Electrical and Electronics Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOner" class="panel-collapse collapse">
                                       <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Electrical and Electronics Engineering"/>
                                     <c:choose> 
                                     <c:when test="${x.admissionYear eq (year - i -3) and x.branch eq p}" >
                                     
                                    
                                     
                                      &nbsp &nbsp&nbsp  <input type="checkbox" class="point3" value="${x.mobContact}">${x.fullName}<br>
                                        
                                      
                                        </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                
                                 <script>
                                 $(function () {
                    $("#checkAll4").click(function () {
                        if ($("#checkAll4").is(':checked')) {
                            $(".point4").prop("checked", true);
                        } else {
                            $(".point4").prop("checked", false);
                        }
                    });
                });
                                </script>
                                <div class="panel">
                                <input type="checkbox" id="checkAll4">
                                    <a data-toggle="collapse" data-parent="#accordion21" href="#collapseTwoOnes">Electronics and Communication Engineering &raquo;
                                    </a>
                                    <div id="collapseTwoOnes" class="panel-collapse collapse">
                                       <c:forEach var="x" items="${studentList}">   
                                      <c:set var="p" value="Electronics and Communication Engineering"/>
                                     <c:choose> 
                                     <c:when test="${x.admissionYear eq (year - i -3) and x.branch eq p}" >
                                    
                                    
                                     &nbsp &nbsp&nbsp  <input type="checkbox" class="point4" value="${x.mobContact}">${x.fullName}<br> 
                                        </c:when>
                                       
                                        </c:choose>
                                    </c:forEach>
                                    </div>
                                </div>
                                
                                
                                
                                
                                
                                
                                
                            </div>
                        </div>
                    </div>
                  
                  
                  
                  
                   </div>
                   
                  <script>
                $(document).ready(function(){
                    $('#createObject').click(function(){
                     var ar=[];
                     ar.push({"msg":$('#theMessage').val()+"~"});
                     $('.point').each(function(){
                            if($(this).is(':checked'))
                            {
                                ar.push({"number":$(this).val()}); 
                            }        
                     });
                     
                    
                     $('.point4').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.point0').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.point3').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.point2').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.point1').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.point9').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.pointa').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.pointb').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.pointc').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     
                     $('.pointd').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.pointe').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     
                     $('.pointf').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     
                     $('.pointg').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     
                     $('.pointh').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     
                     $('.pointi').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.pointj').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.pointk').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     
                     $('.pointl').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.pointm').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     
                     $('.pointn').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.pointo').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.pointp').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     
                     $('.pointq').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     
                     
                     
                     if($('#theMessage').val()== ""){
             			alert("Please write some message!");
             			return false;
             		}
                    
                     var x= JSON.stringify(ar);
                 //alert(x);
           $.ajax({
                    	url:'sendMessages',
                    	type:'POST',
                    	
                    	
                    	data:'loop='+x,
                    	success: function (data){
                    		console.log("ceededededed");
                    		alert("Your message has been sent!");
                    		window.location.href=window.location.href;	
                    	},
                        failure: function (errMsg) {
                        alert(errMsg);
                        }
                     });
       
                        alert(JSON.stringify(ar));
                    });
                    });
                </script>
                   
                   
            </div>
        </div><br>
        Type your message here
 <textarea id="theMessage" class="form-control"></textarea><br>
 <input class="btn btn-default" type="button" value="Add" id="createObject"/>
 <hr>
 
<h4>Faculty</h4> 
<script>

$(document).ready(function(){
    $('#createObject2').click(function(){
     var ar=[];
     ar.push({"msg":$('#facabc').val()+"~"});
    
     
         $('.joint1').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.joint2').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     
                     $('.joint3').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.joint4').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     $('.joint5').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
                     
                     $('.joint6').each(function(){
                         if($(this).is(':checked'))
                         {
                             ar.push({"number":$(this).val()}); 
                         }        
                  });
           
              $.ajax({
                    	url:'sendMessages',
                    	type:'POST',
                    	
                    	
                    	data:'loop='+JSON.stringify(ar),
                    	success: function (data){
                    		alert("sxbsiucsbciubsicubsciu"); },
                        failure: function (errMsg) {
                        alert(errMsg);
                        }
                     });
      
                      alert(JSON.stringify(ar));
                    });
                    });
                </script>
                   
 <div class="panel-group" id="accordion1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion1" href="#One">Mechanical Department
                        </a>
                    </h4>
                </div>
                <div id="One" class="panel-collapse collapse">
               
                   <c:forEach var="q" items="${faculty}">
                    <c:set var="w" value="Mechanical Department"/>
                   <c:choose>
                   
                   <c:when test="${q.department eq w}" >
                  &nbsp &nbsp&nbsp  <input type="checkbox" class="joint6" value="${q.contact}"> ${q.name}<br>
                   
                   
                  </c:when>
                  </c:choose>
                   </c:forEach>
                </div>
            </div>
      <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion1" href="#Two">Computer Science Department
                        </a>
                    </h4>
                </div>
            <div id="Two" class="panel-collapse collapse">
                     <c:forEach var="q" items="${faculty}">
                    <c:set var="w" value="Computer Science Department"/>
                   <c:choose>
                   
                   <c:when test="${q.department eq w}" >
                   &nbsp &nbsp&nbsp  <input type="checkbox" class="joint5" value="${q.contact}"> ${q.name}<br>
                   
                   
                  </c:when>
                  </c:choose>
                   </c:forEach>    
</div>
</div>
<div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion1" href="#Three">Civil Engineering Department
                        </a>
                    </h4>
                </div>
            <div id="Three" class="panel-collapse collapse">
                    <c:forEach var="q" items="${faculty}">
                    <c:set var="w" value="Civil Engineering Department"/>
                   <c:choose>
                   
                   <c:when test="${q.department eq w}" >
                  &nbsp &nbsp&nbsp  <input type="checkbox" class="joint4" value="${q.contact}"> ${q.name}<br>
                   
                   
                  </c:when>
                  </c:choose>
                   </c:forEach>    
                </div>    

</div>

<div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion1" href="#Four">Electrical Department
                        </a>
                    </h4>
                </div>
            <div id="Four" class="panel-collapse collapse">
                   <c:forEach var="q" items="${faculty}">
                    <c:set var="w" value=">Electrical Department"/>
                   <c:choose>
                   
                   <c:when test="${q.department eq w}" >
                 &nbsp &nbsp&nbsp  <input type="checkbox" class="joint3" value="${q.contact}"> ${q.name}<br>
                   
                   
                  </c:when>
                  </c:choose>
                   </c:forEach>  
                </div>    

</div>

<div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion1" href="#Five">Electronics Department
                        </a>
                    </h4>
                </div>
            <div id="Five" class="panel-collapse collapse">
                   <c:forEach var="q" items="${faculty}">
                    <c:set var="w" value="Electronics Department"/>
                   <c:choose>
                   
                   <c:when test="${q.department eq w}" >
                  &nbsp &nbsp&nbsp  <input type="checkbox" class="joint2" value="${q.contact}"> ${q.name}<br>
                   
                   
                  </c:when>
                  </c:choose>
                   </c:forEach>  
                </div>    

</div>
<div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion1" href="#Six">Humanities Department
                        </a>
                    </h4>
                </div>
            <div id="Six" class="panel-collapse collapse">
                    <c:forEach var="q" items="${faculty}">
                    <c:set var="w" value=">Humanities Department"/>
                   <c:choose>
                   
                   <c:when test="${q.department eq w}" >
                &nbsp &nbsp&nbsp  <input type="checkbox" class="joint1" value="${q.contact}"> ${q.name}<br>
                   
                   
                  </c:when>
                  </c:choose>
                   </c:forEach>  
                </div>    

</div>

<br>
<textarea id="facabc" class="form-control"></textarea>
<br>
<input class="btn btn-default" type="button" value="Send" id="createObject2"/>
<br>
<center>
<a class="btn btn-info" target="_blank" href="http://login.bulksmsgateway.in/userbalance.php?user=pranoy1994&password=koronadi123&type=3">Check Balance</a>
</center>
<script>
$(document).ready(function(){
	$('#createObject2').click(function(){
		console.log("ediwenuewdniewudnewuidnewuidewuidnewuidnwieudnewiudnewiudnewuidnewiudnweiudnweuidnewuiwuid");
		if($('#facabc').val()== ""){
			alert("Please write some message!");
			return false;
		}
		
	});
	
});


</script>

</div></div>

<div class="tab-pane fade" id="sectionc">
<h2>Share a feedback</h2>
<div class="alert alert-success" id="success" style="display:none;">
    <strong>Success!</strong> You have successfully shared your feedback thank you.
  </div>
  
  <div class="alert alert-danger" id="fail" style="display:none;">
  <strong>Error!</strong> Server encountered some problem, try again later, sorry!:(
</div>

<c:forEach var="info" items="${fac}">
<input type="hidden" value="${info.name}" id="sname"/>
<input type="hidden" value="Faculty" id="syear"/>
</c:forEach>


<textarea class="form-control" style="height: 173px;" id="thebody"></textarea>
<br>

<button class="btn btn-info" onclick="addFeedback()" id="bton">Share</button>
<script>

function addFeedback()
{
	var data = new FormData();
	data.append("name",$('#sname').val());
	data.append("year",$('#syear').val());
	data.append("body",$('#thebody').val());
	console.log($('#sname').val());
	console.log($('#syear').val());
	console.log($('#thebody').val());
	
	jQuery.ajax({
		url:'saveFeedback',
		data:data,
		type:'POST',
		processData:false,
		cache: false,
		contentType:false,
		success: handleData,
		error: dataHandle
		
	});
}
	function handleData(){
		$('#success').show();
		$('#fail').hide();
		console.log("syugxuyxgs");	
		document.getElementById("bton").disabled = true;
	}
	function dataHandle(){
		$('#fail').show();
		console.log("syugxuyxgs");
		$('#success').hide();
	
	}
	
	</script>

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
       
       <c:forEach var="list" items="${fac}">
        <input type="hidden" value="${list.id}" name="id" id="id"/>
       </c:forEach>
         <label for="password1" style="font-size: 13px;">Enter your password:</label>
        <input type="password"  class="form-control" name="Password123" id="password123" required="required" style="width:200px" />
        <br>
        <label for="password2" style="font-size: 13px;">Enter your password again:</label>
        <input type="password" class="form-control" name="Password321" id="password321" required="required" style="width:200px"/><br>
        <input type="submit" id="newPass" class="btn btn-info">
       <br>
        <br>
        
        
      </div>
      </div>
      <footer class="w3-container w3-teal">
       
      </footer>
    </div>
  <script>
      $(document).ready(function(){
    	$('#newPass').click(function(){
    		var p1=$('#password123').val().trim();
    		var p2=$('#password321').val().trim();
    		
    		if(p1=="" || p2==""){
    			
    			alert("Put something !");return false;
    		}
    		if(p1 == p2){	
    		$.ajax({
    			url:'changeFacultyPass',
    			type:"POST",
    			data:'Password123='+p1+'&id='+$('#id').val(),
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
  <p>Faculty Portal | KMBB CET | <a href="#" onclick="document.getElementById('id01').style.display='block'">Change Password</a> | <a href='invalidateMe' style="colo:white"> Logout</a>&nbsp&nbsp      </p>
</footer>


</body>
</html>
