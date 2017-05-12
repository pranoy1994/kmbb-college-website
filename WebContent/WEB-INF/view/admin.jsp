<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Calendar" %>
<html lang="en">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">
     function deleteForm(id){
    	 $('<form enctype="application/json" action="deleteNotice" method="POST"><input type="hidden" name="my" value="' + id + '"></form>').appendTo("body").submit();
    
     }
     </script>
  <title>Administrator Portal | KMBB CET</title>
  <meta charset="utf-8">

  <link rel="shortcut icon" href="/college-project/assets/img/logo.png" type="image/png">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
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
      background-color: #0a0a29;;
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
.navbar-fixed-bottom{
padding:0px;
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
</head><body>

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
">Administrator Portal</span></b>
    
    
    <span style="
   color: white;
    position: relative;
    font-size: 8px;
    left: -312px;
    top: 11px;
}
">College of Engineering and Technology</span>
</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav nav-pills" style="font-size: 12px;">
        <li ><a data-toggle="pill" href="#sectionA">Welcome</a></li>
        <li><a data-toggle="pill" href="#sectionB">Student</a></li>
        <li><a data-toggle="pill" href="#sectionC">Notice</a></li>
        <li><a data-toggle="pill" href="#sectionD">Faculty</a></li>
        <li><a data-toggle="pill" href="#sectionE">Home Screen Images</a></li>
        <li><a data-toggle="pill" href="#sectionF">Hostels</a></li>
    <%--    <li><a data-toggle="pill" href="#sectionG">Placement</a></li> --%>
        <li><a data-toggle="pill" href="#sectionH">Gallery</a></li>
        <li><a data-toggle="pill" href="#sectionI">Messages</a></li>
         <li><a data-toggle="pill" href="#sectionJ">Other admins</a></li>
      </ul>
      
    </div>
  </div>
</nav>
<div class="container">
 <div class="tab-content">
      <div class="tab-pane fade in active" id="sectionA">




<%if (session.getAttribute("user") == null){response.sendRedirect("/college-project/work/index");} %>
<h2>Welcome Administrator</h2>
<p>You have successfully been logged in the KMBB administrator portal, as an administrator it is informed to you that you should keep your password secret as very sensitive data can be <b>altered</b> or <b>deleted</b> from this portal.</p>
<p>As an administrator you have some responsibilities to perform, as per the instruction given by the college you can do the following things:-</p>

<ul>

<li>You can add/edit/remove a new <b>Student Information</b>.</li><br>
<li>You can add/edit/remove <b>Notice List</b>.</li><br>
<li>You can add/edit/remove <b>Faculty Information</b>.</li><br>
<li>You can add/remove <b>Home Screen Images</b>.</li><br>
<li>You can add/edit/remove <b>Hostel Information</b> of both girls and boys.</li><br>
<li>You can add/remove <b>Placement Information</b>.</li><br>
<li>You can add/remove <b>Gallery Photos</b>.</li><br>
<li>You can view/remove the  <b>Messages </b>sent by the people who contacted us and <b>Testimonials</b> shared by the student.</li>


</ul>

<h4></h4>

<input type="hidden" id="refreshed" value="no">

<script type="text/javascript">
	onload=function(){
	var e=document.getElementById("refreshed");
	if(e.value=="no")e.value="yes";
	else{e.value="no";location.reload();}
	}
</script>



</div>


<div class="tab-pane fade" id="sectionB">
  <br>
      
      <script>
function xyz()
{
	
	var x  = document.getElementById("genderSelection").value;
	var y = document.getElementById("hostelSelection");
	
	var i;
    for(i = y.options.length - 1 ; i >= 0 ; i--)
    {
       y.remove(i);
    }

	
	if(x  == "Female"){
		
		var option = document.createElement("option");
		option.text ="No";
		y.add(option);
	
		<c:forEach var="list" items="${girlsHostelList}">
	
		if( ${list.noOfBeds} != ${list.noOfOccupiedBeds}){
			var option = document.createElement("option");
		 option.text = "${list.hostelName}";
		    y.add(option);
		}
		</c:forEach>
	}
	if(x == "Male"){
		var option = document.createElement("option");
		option.text ="No";
		y.add(option);
	
		<c:forEach var="list" items="${boysHostelList}">
		
		if( ${list.noOfBeds} != ${list.noOfOccupiedBeds}){
			var option = document.createElement("option");
		option.text =" ${list.hostelName}";
		y.add(option);
		}
				</c:forEach>
			}

}</script>
      
      <table class="table table-bordered">
    
            <thead>
            <tr><th colspan="2"><b style="font-size:20px">Add New Student</b></th></tr>
            </thead>            
                <tbody>       
             <%--   <tr> <td>
                         <div class="form-group">
    <label for="fullName">Full Name</label><p id="fullName1" style="display:none;color:red;">Enter full name of the student</p><p id="fullName2" style="display:none;color:red;">digits is name? :/ </p>
    <form:input path="fullName" type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter full name of the student"/>
    
  </div>
  </td>--%>
    <form action="saveStudent"  method="POST" enctype="multipart/form-data" onsubmit="return validateNewStudent()">
  <tr><td>
  <div class="form-group">
    <label for="registrationNumber">Registration Number<img src="https://www.oenovaults.com/images/loading.gif" id="loaderIcon" style="display:none;" height="20px" width="20px" />
   
    <span id="user-availability-status">
    
    </span>&nbsp&nbsp&nbsp<span id="status" style="color:red;font-size: 10px;display:none">Must be 10 digits</span>
    <span id="status2" style="color:red;font-size: 10px;display:none">Must be only digits</span>
    </label>
    <script>
  function checkRegNo(){
	  $("#registrationNumber1").hide();
	  $("#user-availability-status").hide();
	  $("#loaderIcon").show();
	  var regex=/^[0-9]+$/;
	  console.log($("#registrationNumber").val());
	  if(($("#registrationNumber").val()).match(regex)){
		  if( $("#registrationNumber").val().length == 10){
	  jQuery.ajax({
		  
		      url:"checkReg",
			  data:'reg='+$("#registrationNumber").val(),
			  type:"GET",
			  success:function(data){$("#user-availability-status").show().html(data)
				  $("#loaderIcon").hide();
			  $("#status").hide();
			  $("#status2").hide();
			  if(data == "&nbsp&nbsp&nbsp<span style='color: red;font-size: 10px;'>You cannot use this<span>")
			  $("#sub-button").prop("disabled", true);
			  if(data == "&nbsp&nbsp&nbsp<span style='color: green;font-size: 10px;'>You can use this<span>")
				  $("#sub-button").prop("disabled", false);
			  },
			  error:function(){}
	  });
		  }else{
			  $("#status").show();
			  $("#loaderIcon").hide();
			  $("#user-availability-status").hide();
			  $("#sub-button").prop("disabled", true);
		  }
	  }else{
		  $("#status2").show();
		  
		  $("#loaderIcon").hide();
		  $("#user-availability-status").hide();
		  $("#sub-button").prop("disabled", true);
	  }
	  
  }
  
  </script><p id="registrationNumber1" style="display:none;color:red;">Enter Registration Number</p>
    <input  onblur="checkRegNo()" type="text" class="form-control" id="registrationNumber" name="registrationNumber" placeholder="Registration Number"/>
  
  
  
  
  </div>
  </td>
 </tr>
  <%--
  <tr><td>
  <div class="form-group">
  <label for="dateofbirth">Date Of Birth</label><p id="dateofbirth1" style="display:none;color:red;">Enter date of birth</p>
<form:input path="dob" type="date" class="form-control" name="dob" id="dateofbirth" />
  </div>
  </td>
  <td>
  <div class="form-group">
    <label for="mobContact">Mobile number</label><p id="mobContact1" style="display:none;color:red;">Enter contact number</p>
    <form:input path="mobContact" type="text" class="form-control" id="mobContact" name="mobContact" placeholder="Enter mobile number"/>
    
  </div>
  </td></tr>
  
  
  
  <tr><td>
  <div class="form-group">
    <label for="email">Email address</label><p id="email1" style="display:none;color:red;">Enter email address</p>
    <form:input path="email" type="email" class="form-control" id="email" aria-describedby="emailHelp" name="email" placeholder="Enter students email address"/>
    </div>
    </td>
     --%>
     <tr>
    <td>
    <div class="form-group">
    <label for="password">Default password</label><p id="password1" style="display:none;color:red;">Enter password</p>
    <input type="text" class="form-control" id="password" name="password" placeholder="Enter default password"/>
  </div>
  </td>
  </tr>
 
  <tr><td>
  <div class="form-group">
    <label for="admissionYear">Admission Year</label><p id="admissionYear1" style="display:none;color:red;">Enter admission year</p><p id="admissionYear2" style="display:none;color:red;">Should be only numbers of 4 digits</p>
    <input type="text" class="form-control" id="admissionYear" name="admissionYear" placeholder="Enter year of admission"/>
  </div>
  </td>
  </tr>
 <tr>
  <td>
  <div class="form-group">
  <label for="genderSelection">Select gender</label><p id="genderSelection1" style="display:none;color:red;">Enter gender</p>
  <select class="form-control" name="gender" id="genderSelection"  onchange="xyz()">
   <option>Select</option>
    <option value="Female">Female</option>
    <option value="Male">Male</option> 
  </select>
</div>
</td></tr>
 <tr>
 <td>
  <div class="form-group">
  <label for="lateral">Lateral Entry</label><p id="lateral1" style="display:none;color:red;"></p>
  <select class="form-control" name="lateral" id="lateral">
   
    <option value="No">No</option>
    <option value="Yes">Yes</option> 
  </select>
</div>
 
 </td>
 
 </tr>


<tr>
<td>
<div class="form-group">
  <label for="hostelSelection">Hostel</label>
  <select class="form-control" name="hostelSelection" id="hostelSelection">
    
   
  </select>
</div>

</td>

 <%--



<td>
<div class="form-group">
    <label for="guardianName">Guardian name</label><p id="guardianName1" style="display:none;color:red;">Enter guardian Name</p>
    <form:input path="guardianName" type="text" class="form-control" id="guardianName" name="guardianName" placeholder="Enter the name of the guardian"/>
  </div>
  </td></tr>  --%>
  <tr><td> 
   <div class="form-group">
  <label for="sel1">Select Branch</label><p id="sel1p" style="display:none;color:red;">Enter branch</p>
  <select class="form-control" id="sel1" name="branch">
   <option value="Select Branch">Select Branch</option>
    <option value="Mechanical Engineering">Mechanical Engineering</option>
    <option value="Computer Science And Engineering">Computer Science And Engineering</option> 
    <option value="Civil Engineering">Civil Engineering</option>
    <option value="Electrical Engineering">Electrical Engineering</option>
    <option value="Electrical and Electronics Engineering">Electrical and Electronics Engineering</option>
   <option value="Electronics and Communication Engineering">Electronics and Communication Engineering</option>
  </select>
</div>
</td>
<%--
<td>
<div class="form-group">
  <label for="sel1">Scholarship</label>
  <form:select path= "scholarship" class="form-control" id="sel1">
    <option>No</option>
    <option>Yes</option> 
  </form:select>
 
</div>
</td></tr> --%><tr><td>
<div class="form-group">
    <label for="totalFees">Total fees per year</label><p id="totalFees1" style="display:none;color:red;">Enter total fees of the student</p><p id="totalFees2" style="display:none;color:red;">Should be equal to 4 digits</p>
    <input type="text" class="form-control" id="totalFees" name="totalFees" placeholder="Enter total fees of the student" />
  </div>
</td>
  <%--
  <td>
  <div class="form-group">
  <label for="picture">Upload student image</label> <p id="picture1" style="display:none;color:red;">Select an image</p>
 <form:input path= "picture" class="form-control" id="picture" type="file" name="pic" accept="image/*"/>
 <img id="blah" src="#" alt="your image" width="100px" height="120px" style="display:none;"/>
</div>
<script>
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        
        reader.onload = function (e) {
        	$('#blah').show();
            $('#blah').attr('src', e.target.result);
        }
        
        reader.readAsDataURL(input.files[0]);
    }
}

$("#picture").change(function(){
	$('#blah').hide();
    readURL(this);
});


</script>


</td>
  <tr><td>
  <div class="form-group">
    <label for="feesPaid">Fees paid</label><p id="feesPaid1" style="display:none;color:red;">Enter fees paid </p><p id="feesPaid2" style="display:none;color:red;">Should be greater than 0</p>
    <form:input path="feesPaid" type="text" class="form-control" id="feesPaid" name="feesPaid" placeholder="Enter fees paid the candidate"/>
  </div>
  
   </td> 
   
   --%>     
   <tr><td>
   <button type="submit" class="btn btn-primary" id="sub-button">Submit</button>                
           </td></tr>  
                       </form> 
      </tbody></table>
      <script>
      
      function validateNewStudent()
      {
    	  var chk=false;
      if( $('#fullName').val() == null || $('#fullName').val() == "" ){
      $('#fullName1').show();
       chk=true;
      }else if($('#fullName').val().match(/^[0-9]+$/)){
      $('#fullName2').show();
      $('#fullName1').hide();
      chk=true;
      }else{$('#fullName1').hide();
      $('#fullName2').hide();
      }

      if($('#registrationNumber').val() == null || $('#registrationNumber').val() == "" || !$('#registrationNumber').val().match(/^[0-9]+$/)){
      $("#registrationNumber1").show();chk=true;
      }
      else{
      $("#registrationNumber1").hide();
      }

      if( $('#dateofbirth').val() == null || $('#dateofbirth').val() == ""){
      $('#dateofbirth1').show();chk=true;
      }
      else{
      $('#dateofbirth1').hide();
      }

      if($('#sel1').val()== null || $('#sel1').val()=="Select Branch"){
    	  $('#sel1p').show();
    	  console.log($('#sel1').val()+"isiusciscigsciusgc");
    	  return false;
      }else{
    	  console.log($('#sel1').val());
    	  $('#sel1p').hide();
      }
      
      if($('#mobContact').val() == null || $('#mobContact').val() == "" || !$('#mobContact').val().match(/^[0-9]+$/)){
      $('#mobContact1').show();chk=true;
      }
      else{
      $('#mobContact1').hide();
      }

      if($('#email').val() == null || $('#email').val() == ""){
      $('#email1').show();chk=true;
      }
      else{
      $('#email1').hide();
      }

      if($('#password').val() == null || $('#password').val() == ""){
      $('#password1').show();chk=true;
      }
      else{
      $('#password1').hide();
      }

      if($('#admissionYear').val() == null || $('#admissionYear').val() == "" || $('#admissionYear').val() == 0 || !$('#admissionYear').val().match(/^[0-9]+$/)){
      $('#admissionYear1').show();chk=true;
      $('#admissionYear2').hide();
      }if($('#admissionYear').val().length >4 || $('#admissionYear').val().length <4){$('#admissionYear2').show(); return false;}
      else{
    	  console.log($('#admissionYear').val().length);
      $('#admissionYear1').hide();
      $('#admissionYear2').hide();
      }

      if($('#genderSelection').val() == null || $('#genderSelection').val() == "Select" ){
      $('#genderSelection1').show();chk=true;
      }
      else{
      $('#genderSelection1').hide();
      }

      if($('#guardianName').val() == null || $('#guardianName').val() == "" ){
      $('#guardianName1').show();chk=true;
      }
      else{
      $('#guardianName1').hide();
      }

      if($('#totalFees').val() == null || $('#totalFees').val() == "" || !$('#totalFees').val().match(/^[0-9]+$/) || $('#totalFees').val() == 0){
      $('#totalFees1').show();chk=true;
      return false;
      }
      else{
      $('#totalFees1').hide();
      $('#totalFees2').hide();
      }

      if(document.getElementById("picture").files.length ==  0){
      $('#picture1').show();chk=true;
      }
      else{
      $('#picture1').hide();
      }

      if($('#feesPaid').val() == null || $('#feesPaid').val() == "" || !$('#feesPaid').val().match(/^[0-9]+$/)){
      $('#feesPaid1').show();
      
      }
      else{
      $('#feesPaid1').hide();
      }













if(chk==true)
return false;
else
	return true;
      }
      
      
      </script>
      <br>
      <h3>Find the student by year:-</h3>
     <div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
        1st Year</a>
      </h4>
    </div>
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
    <div id="collapse1" class="panel-collapse collapse">
      <div class="panel-body">
      <ul>
      
      <li><a href="showStudentList?year=${year - i}&branch=Mechanical Engineering" target="_blank">Mechanical Engineering</a></li>
      <li><a href="showStudentList?year=${year - i}&branch=Computer Science And Engineering" target="_blank">Computer Science And Engineering</a></li>
      <li><a href="showStudentList?year=${year - i}&branch=Civil Engineering" target="_blank">Civil Engineering</a></li>
      <li><a href="showStudentList?year=${year - i}&branch=Electrical Engineering" target="_blank">Electrical Engineering</a></li>
      <li><a href="showStudentList?year=${year - i}&branch=Electrical and Electronics Engineering" target="_blank">Electrical and Electronics Engineering</a></li>
      <li><a href="showStudentList?year=${year - i}&branch=Electronics and Communication Engineering" target="_blank">Electronics and Communication Engineering</a></li>
      
      
      </ul>
      
      
      
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
        2nd Year</a>
      </h4>
    </div>
    <div id="collapse2" class="panel-collapse collapse">
      <div class="panel-body">
      
      <li><a href="showStudentList?year=${year - 1 - i}&branch=Mechanical Engineering" target="_blank">Mechanical Engineering</a></li>
      <li><a href="showStudentList?year=${year - 1 - i}&branch=Computer Science And Engineering" target="_blank">Computer Science And Engineering</a></li>
      <li><a href="showStudentList?year=${year - 1 - i}&branch=Civil Engineering" target="_blank">Civil Engineering</a></li>
      <li><a href="showStudentList?year=${year - 1 - i}&branch=Electrical Engineering" target="_blank">Electrical Engineering</a></li>
      <li><a href="showStudentList?year=${year - 1 - i}&branch=Electrical and Electronics Engineering" target="_blank">Electrical and Electronics Engineering</a></li>
      <li><a href="showStudentList?year=${year - 1 - i}&branch=Electronics and Communication Engineering" target="_blank">Electronics and Communication Engineering</a></li>
      
      
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
        3rd Year</a>
      </h4>
    </div>
    <div id="collapse3" class="panel-collapse collapse">
      <div class="panel-body">
      
       <li><a href="showStudentList?year=${year - 2 - i}&branch=Mechanical Engineering" target="_blank">Mechanical Engineering</a></li>
      <li><a href="showStudentList?year=${year - 2 - i}&branch=Computer Science And Engineering" target="_blank">Computer Science And Engineering</a></li>
      <li><a href="showStudentList?year=${year - 2 - i}&branch=Civil Engineering" target="_blank">Civil Engineering</a></li>
      <li><a href="showStudentList?year=${year - 2 - i}&branch=Electrical Engineering" target="_blank">Electrical Engineering</a></li>
      <li><a href="showStudentList?year=${year - 2 - i}&branch=Electrical and Electronics Engineering" target="_blank">Electrical and Electronics Engineering</a></li>
      <li><a href="showStudentList?year=${year - 2 - i}&branch=Electronics and Communication Engineering" target="_blank">Electronics and Communication Engineering</a></li>
      
      
      </div>
    </div>
  </div>
  
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">
        4th Year</a>
      </h4>
    </div>
    <div id="collapse4" class="panel-collapse collapse">
      <div class="panel-body">
      
       <li><a href="showStudentList?year=${year - 3 - i}&branch=Mechanical Engineering" target="_blank">Mechanical Engineering</a></li>
      <li><a href="showStudentList?year=${year - 3 - i}&branch=Computer Science And Engineering" target="_blank">Computer Science And Engineering</a></li>
      <li><a href="showStudentList?year=${year - 3 - i}&branch=Civil Engineering" target="_blank">Civil Engineering</a></li>
      <li><a href="showStudentList?year=${year - 3 - i}&branch=Electrical Engineering" target="_blank">Electrical Engineering</a></li>
      <li><a href="showStudentList?year=${year - 3 - i}&branch=Electrical and Electronics Engineering" target="_blank">Electrical and Electronics Engineering</a></li>
      <li><a href="showStudentList?year=${year - 3 - i}&branch=Electronics and Communication Engineering" target="_blank">Electronics and Communication Engineering</a></li>
      
      
      </div>
    </div>
  </div>
</div>



<br>
<input class="form-control" onfocus="$('#rslt').hide(); $('#rslt').load(location.href + ' #rslt');" name="std" id="srch" placeholder="Enter registration number.."><br><button id="btn" class="btn btn-info">Search</button>
<br>
<script>
$(document).ready(function(){
	$('#btn').click(function(){
		$.ajax({
			url:'searchStudent',
			data:'d='+$('#srch').val(),
			type:'get',
			success:function(data){
				$('#rslt').show();
				var stringLength = data.length; // this will be 16
				var lastChar = data.charAt(stringLength - 1);
				data = data.slice(0, -1);
				$('#rslt').append('<br><h4>Search Reasult</h4><br><a target="_blank" href="showStudent?id='+lastChar+'">'+data+'</a>');
				
				
				
			},
			error:function(){
				alert("Student not found!!");
			}
			
		})
		
		
	});
});

</script>

<div id="rslt">


</div>
</div>
<div class="tab-pane fade" id="sectionC">

<script>
function validateAddNotice(){
	if($('#title67').val() == null || $('#title67').val() == ""){
		$('#labeltitle67').show();
		return false;
	}else{
		$('#labeltitle67').hide();
	}
	if($('#body67').val() == null || $('#body67').val() == ""){
		console.log($('#labelbody67').val());
	$('#labelbody67').show();
	return false
	}else{
		$('#labelbody67').hide();
	}
	}

</script>
 <h2>Notice Board</h2><br>
      <table class="table table-bordered">
      <form:form action="addNotice" modelAttribute="notice" method="POST" name="addNoc" onsubmit="return validateAddNotice()">
      <thead>
            <tr><th colspan="2"><b style="font-size:20px">Add New Notice</b></th></tr>
 </thead> 
 <tbody>       
                <tr> <td>

<div class="form-group">
<fmt:formatDate var="dte" value="${now}" pattern="yyyy-MM-dd" />
<form:input path="date" type="hidden" value="${dte}"/>
    <label for="title">Title</label><p id="labeltitle67" style="display:none;color:red;">Something should be typed !</p>
    <form:input path="notifications" type="text" class="form-control" id="title67" name="title" placeholder="Enter title of the notice"/> 
  </div>
  </td></tr><tr>
  <td>
  <div class="form-group">
    <label for="body">Notice Body</label><p id="labelbody67" style="display:none;color:red;">Something should be typed !</p>
    <form:textarea path="body" rows="4" cols="50" class="form-control" id="body67"></form:textarea>
    
</div>
  </td>
  </tr>
  <tr><td>
   <button type="submit" class="btn btn-primary">Submit</button>                
           </td></tr> 
      </tbody>     
      </form:form></table>
     <br>
     <h2>Notice List</h2>
     <div class="table-responsive">
     <table class="table table-bordered">
     <thead>
     <tr><th>Sr. no</th><th>Date</th><th>Title</th><th>Body</th><th>Options</th></tr>
     </thead>
     <tbody>
     <c:set var="count" value="1" />
     <c:forEach var="note" items="${note}">
     <tr><td>
    ${count}
     <c:set var="count" value="${count+1}" />
     </td>
     <td>
     ${note.date}
     
     
     </td>
     <td>
     ${note.notifications}
     
     </td>
     
     <td>
     <button type= "button" class="btn btn-info btn-set" data-toggle= "modal" data-target= "#myModal${count}" >Open body</button>
     <div class="modal fade" id="myModal${count}" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:black;">${note.notifications}</h4>
        </div>
        <div class="modal-body">
          <p style="color:black;">
       <pre>   ${note.body}
</pre>          </p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
     </td>
     <td>
     <a class="btn btn-info" data-toggle="modal" data-target="#${note.id}" onclick="insideEditBody('txtarea${note.id}','${note.body}')">Edit</a>|
     <a  class="btn btn-info" onclick="deleteForm(${note.id})" style="width: 72px;">Delete </a>
    
     <div class="modal fade" id="${note.id}" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:black;">Edit this notice</h4>
        </div>
        <div class="modal-body">
          <p style="color:black;">
          <form action="editNoitce" method="POST" >
          <input name="id" type="hidden" value="${note.id}"/>
          <div class="form-group">
                 <fmt:formatDate var="dte" value="${now}" pattern="yyyy-MM-dd" />
<input name="date" type="hidden" value="${dte}"/>
                    <label for="title">Title</label><p id="labeltitle12${note.id}" style="display:none;color:red;">Something should be typed !</p>
    <input name="notifications" type="text" class="form-control" id="title12${note.id}" name="title" value="${note.notifications}"/> 
         </div>
         <div class="form-group">
    <label for="body">Notice Body</label> <p id="labeltxtarea12${note.id}" style="display:none;color:red;">Something should be typed !</p>
    <textarea name="body" rows="4" cols="50" class="form-control" id="txtarea${note.id}">${note.body}</textarea>   
</div>
         <button type="submit" class="btn btn-primary" >Submit</button> 
          </form>
          
          
          </p>
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
     </table></div>
     <script>
     function validateEditNotice(abc){
    	 console.log(abc+"      isuhsiuahsiuahsiausiaushiusaiushisuiushaisbaskbkbbksbaksbasjb sahbsk jasb a")
    	 if(document.getElementById("title12"+abc).value == null || document.getElementById("title12"+abc).value == ""){
    			 console.log("labeltitle12"+abc);
    			 document.getElementById("labeltitle12"+abc).style.display = "block";
    			 return false;
    			 
    		 }else{
    			 document.getElementById("labeltitle12"+abc).style.display = "none";
    		 }

    	if(document.getElementById("txtarea"+abc).value == null || document.getElementById("txtarea"+abc).value == ""){
    		console.log("labeltxtarea12"+abc);
    			 document.getElementById("labeltxtarea1219").style.display = "block";
    			 return false;
    			 
    		 }else{
    			 document.getElementById("labeltxtarea12"+abc).style.display = "none";
    		 }



    	}
     
     </script>
     
     
<script>

     function insideEditBody(abc,b)
     {

    	 document.getElementById(abc).defaultValue = b;
    	 console.log(b);
    	 
     }
     
     
     </script>
</div>




<div class="tab-pane fade" id="sectionD">

 <h2>Add a faculty</h2>
     <script>
     function validateAddFaculty(){
    	 
    	 if($('#name22').val() == "null" || $('#name22').val() == ""){
    		 $('#labelname22').show();
    		 return false;
    		 }else{$('#labelname22').hide();}

    		 if($('#designation22').val() == "null" || $('#designation22').val() == ""){
    		 $('#labeldesignation22').show();
    		 return false;
    		 }else{$('#labeldesignation22').hide();}

    		 if(document.getElementById('photo22').files.length == 0){
    		 $('#labelphoto22').show();
    		 return false;
    		 }else{$('#labelphoto22').hide();}

    		 if($('#qualification22').val() == "null" || $('#qualification22').val() == ""){
    		 $('#labelqualification22').show();
    		 return false;
    		 }else{$('#labelqualification22').hide();}
    	 
     }
     
     
     </script>
     
     <form action="saveFaculty"  method="POST" enctype="multipart/form-data" onsubmit="return validateAddFaculty()">
     <table class="table table-bordered">
     <tbody>
     <tr>
     <td>
     <div class="form-group">
    <label for="name22">Name</label><p id="labelname22" style="display:none;color:red;">Something should be typed!</p>
    <input  type="text" class="form-control" id="name22" name="name" placeholder="Enter name of the faculty"/>
  </div>
     </td>
     <td>
     <div class="form-group">
    <label for="department">Department</label>
    <select  class="form-control" id="department" name="department">
   <option>Mechanical Department</option>
   <option>Computer Science Department</option>
   <option>Civil Engineering Department</option>
   <option>Electrical Department</option>
   <option>Electronics Department</option>
   <option>Humanities Department</option>
  </select>
  </div>
     </td>
     </tr>
     <tr>
     <td>
     <div class="form-group">
    <label for="designation22">Username</label><p id="labeldesignation22" style="display:none;color:red;">Enter the username of the faculty!</p><p id="a34" style="display:none;color:green">Available</p><p id="n34" style="display:none;color:green;color:red">Taken</p>
    <input  type="text" class="form-control" id="uname123321" onblur="checkFacUname()" name="username" placeholder="Enter the username of the faculty"/>
  </div>
     </td>
     <td>
     <div class="form-group">
    <label for="qualification22">Password</label><p id="labelqualification22" style="display:none;color:red;">Enter the default password of the faculty!</p>
    <input type="text" class="form-control" id="qualification22" name="password" placeholder="Enter the default password of the faculty"/>
  </div>
     </td>
     </tr>
     <tr>
     <td>
     <button id="btn-0" type="submit" class="btn btn-primary" style="
    position: relative;
    top: 20px;
">Submit</button>  </td> </tr>
     </tbody>
     </form> </table>
     <script>
     function checkFacUname(){
    	
    	 console.log("anidneuidneiwunef");
    	 $.ajax({
    			url:'validateFacUser',
    			data:'uname='+$('#uname123321').val(),
    			type:'GET',
    			success:function(data){
    				if(data == "a"){
    					console.log("Yes");
    					$('#n34').hide();		
    		            $('#a34').show();	
    		            $('#btn-0').prop("disabled",false);
    				
    				}	if(data == "n"){
    					console.log("No");
    						$('#n34').show();
    						 $('#a34').hide();
    						$('#btn-0').prop("disabled",true);
    					}    			},
    			error:function(data){
    				
    			}
    			
    			
    		});
    	 
    	 
     }
     </script>
<h2>Faculty details</h2><br>



  <ul>
 <li> <a href="facultyDetails?dept=Mechanical Department" target="_blank" class="btn">Mechanical Department</a><br></li>
 <li> <a href="facultyDetails?dept=Computer Science Department" target="_blank" class="btn">Computer Science Department</a><br></li>
 <li> <a href="facultyDetails?dept=Civil Engineering Department" target="_blank" class="btn">Civil Engineering Department</a><br></li>
 <li> <a href="facultyDetails?dept=Electrical Department" target="_blank" class="btn">Electrical Department</a><br></li>
 <li> <a href="facultyDetails?dept=Electronics Department" target="_blank" class="btn">Electronics Department</a><br></li>
  <li> <a href="facultyDetails?dept=Humanities Department" target="_blank" class="btn">Humanities Department</a><br></li>
   </ul>


</div>


<div class="tab-pane fade" id="sectionE">
<script>
function validateHomeScreenImages(){
	if(document.getElementById('picture33').files.length == 0){
		$('#pic77').show();
		return false;
	}else{
		$('#pic77').hide();
	}
	if($('#caption33').val() == null || $('#caption33').val() == ""){
		$('#cap77').show();
		return false;
	}else{
		$('#cap77').hide();
	}
	
}

</script>
<h2>Add home screen images</h2>
     <table class="table table-bordered">
    <form:form action="addHomeScreenImages" method="POST"  modelAttribute="addHomeScreenImages" name="addHomeScreenImages"  enctype="multipart/form-data" onsubmit="return validateHomeScreenImages()">
     <tr><td>

 <div class="form-group">
  <label for="picture">Upload student image          <i style="color:red; font-size:11px">            for best user experience the aspect ratio should be 21:9</i></label>
 <form:input path= "photos" class="form-control" id="picture33" type="file" name="photos" accept="image/*"/>
<p id="pic77" style="display:none;color:red;">Please select a picture!</p>
</div>

</td>
<td>
<div class="form-group">
  <label for="caption">Enter caption</label>
 <form:input path= "caption" class="form-control" id="caption33" type="text" name="caption" />
<p id="cap77" style="display:none;color:red;">Please enter some caption!</p>
</div>


</td>
</tr>
      <tr><td><input type="submit" class="btn btn-default" value= "Submit"></td></tr>
     </form:form>
     </table>
     <h2>Current home screen images</h2>
     <div class="table-responsive">
     <table class= "table table-bordered">
     <c:forEach var="pics" items="${homeScreenPictures }">
     
   
     <tr><td style="width:20px">
     <img alt="image" src="/college-project/image/getHomeScreenImage?id=${pics.id }" style="height:200px">
     Caption:- ${pics.caption}
     </td>
     <td><a href="deleteHomeScreenPictures?id=${pics.id}" class="btn btn-default" onclick=" if(!(confirm('Are you sure you want to delete?'))) return false" >delete</a></td>
     </tr>
     </c:forEach>
     </table>
</div>
</div>


<div class="tab-pane fade" id="sectionF">
<script>
function validateEditGirlsHostel(abc){
	
	

	 if(document.getElementById("name88"+abc).value == null || document.getElementById("name88"+abc).value == ""){
		 console.log("name");
		 document.getElementById("labelname88"+abc).style.display = "block";
		 return false;
		 
	 }else{
		 document.getElementById("labelname88"+abc).style.display = "none";
	 }
	 if(document.getElementById("noOfBeds88"+abc).value == null || document.getElementById("noOfBeds88"+abc).value == "" || !document.getElementById("noOfBeds88"+abc).value.match(/^[0-9]+$/)){
		 console.log("beds");
		 document.getElementById("labelnoOfBeds88"+abc).style.display = "block";
		 return false;
		 
	 }else{
		 document.getElementById("labelnoOfBeds88"+abc).style.display = "none";
		 
	 } if(document.getElementById("occupied88"+abc).value == null || document.getElementById("occupied88"+abc).value == "" || !document.getElementById("occupied88"+abc).value.match(/^[0-9]+$/)){
		 console.log("occupied");
		 document.getElementById("labeloccupied88"+abc).style.display = "block";
		 return false;
		 
	 }else{ document.getElementById("labeloccupied88"+abc).style.display = "none";
		 
	 } if(document.getElementById("girl88"+abc).value == null || document.getElementById("girl88"+abc).value == ""){
		 console.log("address");
		 document.getElementById("labelgirl88"+abc).style.display = "block";
		 return false;
	 }else{
		 document.getElementById("labelgirl88"+abc).style.display = "none";
	 }
	 
	 
	 
}

</script>
  <h2><u>Hostels</u></h2>
     <h4>Girls</h4>
     <table class="table table-bordered">
     
    <thead><tr><th>Name</th><th>Address</th><th>Total Beds</th><th>Beds Occupied</th><th>Options</th></tr></thead>
     <tbody>
     
     <c:forEach var="list" items="${girlsHostelList}">
     
     <tr><td> ${list.hostelName}  </td><td> ${list.address}  </td><td>${list.noOfBeds }   </td><td> ${list.noOfOccupiedBeds}  </td><td> <a class="btn btn-info" data-toggle="modal" data-target="#gs${list.id}" onclick="girl('girl88${list.id}','${list.address}')">edit</a> | <a href="deleteThisHostel?id=${list.id}&hostel=girls&hostelName=${list.hostelName}" class="btn btn-default" >Delete</a> </td></tr>
    <div id="gs${list.id}" class="modal fade" role="dialog">
     <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Edit Girls Hostel</h4>
      </div>
      <div class="modal-body">
    
      <form action="editHostel" method="POST" onsubmit="return validateEditGirlsHostel('${list.id}')">
      
      <input name="id" type="hidden" value="${list.id}" name="id"/>
      <input type="hidden" name="gen" value="grl">
      <input type="hidden" name="oldHostelName" value="${list.hostelName}">
      <div class="form-group">
      <label for="hostelName">Name</label><p id="labelname88${list.id}" style="display:none;color:red;">Something should be typed!</p>
      <input name="hostelName" type="text" class="form-control" name="hostelName" id="name88${list.id}" value="${list.hostelName}"/>      
      </div>
      
      <div class="form-group">
      <label for="beds">Number of beds</label><p id="labelnoOfBeds88${list.id}" style="display:none;color:red;">Invalid number!</p>
      <input name="noOfBeds" type="text" class="form-control" name="beds" id="noOfBeds88${list.id}" value="${list.noOfBeds}"/>      
      </div>
      
    
      <input name="noOfOccupiedBeds" type="hidden"  name="occupied" value="${list.noOfOccupiedBeds}"/>      
      
      
      <div class="form-group">
      <label for="add">Address</label><p id="labelgirl88${list.id}" style="display:none;color:red;">Something should be typed !</p>
      <textarea name="address" class="form-control" name="address88" id="girl88${list.id}">${list.address}</textarea>
      </div>
      
      <input type="submit" value="submit" class="btn btn-default">
      
      </form>
      </div> 
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
      </div>
      </div>
      </div>
      
     </c:forEach> 
     </tbody>
     </table>
    <script>
    function girl(abc,axy){
    	console.log(abc,axy);
    	document.getElementById(abc).defaultValue = axy;
    	
    }
    
    </script>
     <script>
    function boy(abc,axy){
    	console.log(abc,axy);
    	document.getElementById(abc).defaultValue = axy;
    	
    }
    
    </script>
    <script>
   function validateEditBoysHostel(abc)
    {
	   if(document.getElementById("name77"+abc).value == null || document.getElementById("name77"+abc).value == ""){
			 console.log("name");
			 document.getElementById("labelname77"+abc).style.display = "block";
			 return false;
			 
		 }else{
			 document.getElementById("labelname77"+abc).style.display = "none";
		 }
		 if(document.getElementById("noOfBeds77"+abc).value == null || document.getElementById("noOfBeds77"+abc).value == "" || !document.getElementById("noOfBeds77"+abc).value.match(/^[0-9]+$/)){
			 console.log("beds");
			 document.getElementById("labelnoOfBeds77"+abc).style.display = "block";
			 return false;
			 
		 }else{
			 document.getElementById("labelnoOfBeds77"+abc).style.display = "none";
			 
		 } if(document.getElementById("occupied77"+abc).value == null || document.getElementById("occupied77"+abc).value == "" || !document.getElementById("occupied77"+abc).value.match(/^[0-9]+$/)){
			 console.log("occupied");
			 document.getElementById("labelOccupied77"+abc).style.display = "block";
			 return false;
			 
		 }else{ document.getElementById("labelOccupied77"+abc).style.display = "none";
			 
		 } if(document.getElementById("boy"+abc).value == null || document.getElementById("boy"+abc).value == ""){
			 console.log("address");
			 document.getElementById("labeladdress77"+abc).style.display = "block";
			 return false;
		 }else{
			 document.getElementById("labeladdress77"+abc).style.display = "none";
		 }
		 
    }
    </script>
      <h4>Boys</h4>
     <table class="table table-bordered">
     
    <thead><tr><th>Name</th><th>Address</th><th>Total Beds</th><th>Beds Occupied</th><th>Options</th></tr></thead>
     <tbody>
     
     <c:forEach var="list" items="${boysHostelList}">
     <tr><td>${list.hostelName}   </td><td>${list.address}</td><td>${list.noOfBeds }</td>
     <td>${list.noOfOccupiedBeds} </td>
     <td><a class="btn btn-info" data-toggle="modal" data-target="#bs${list.id}" onclick="boy('boy${list.id}','${list.address}')">edit</a> | <a href="deleteThisHostel?id=${list.id}&hostel=boys&hostelName=${list.hostelName}" class="btn btn-default" onclick=" if(!(confirm('Are you sure you want to delete?'))) return false" >Delete</a></td></tr>
    
     <div id="bs${list.id}" class="modal fade" role="dialog">
     <div class="modal-dialog">

    <!-- Modal content-->
      <div class="modal-content">
      <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
      <h4 class="modal-title">Edit Boys Hostel</h4>
      </div>
      <div class="modal-body">
      <form action="editHostel" method="POST" onsubmit="return validateEditBoysHostel('${list.id}')">
      
       <input type="hidden" name="gen" value="boy">
      <input type="hidden" name="oldHostelName" value="${list.hostelName}">
      <input name="id" type="hidden" value="${list.id}" name="id"/>
      <div class="form-group">
      <label for="hostelName">Name</label><p id="labelname77${list.id}" style="display:none;color:red;">Something should be typed!</p>
      <input name="hostelName"  type="text" class="form-control" name="hostelName" id="name77${list.id}" value="${list.hostelName}"/>      
      </div>
      
      <div class="form-group">
      <label for="beds">Number of beds</label><p id="labelnoOfBeds77${list.id}" style="display:none;color:red;">Invalid number!</p>
      <input name="noOfBeds" type="text" class="form-control" name="beds" id="noOfBeds77${list.id}" value="${list.noOfBeds}"/>      
      </div>
      
      
      <input name="noOfOccupiedBeds" type="hidden" class="form-control" name="occupied" id="occupied77${list.id}" value="${list.noOfOccupiedBeds}"/>      
      
      
      <div class="form-group">
      <label for="add">Address</label><p id="labeladdress77${list.id}" style="display:none;color:red;">Something should be typed !</p>
      <textarea name="address" class="form-control" name="add" id="boy${list.id}"></textarea>
      </div>
      <input type="submit" value="submit" class="btn btn-default"/>
      
      </form>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
      </div>
      </div>
      </div>
      
 
 </c:forEach>
     
     </tbody>
     </table>
     <hr>
     <h4>Add a new hostel</h4>
     <script>
     function validateGirlsHostel(){
    	 if($('#name8').val() == null || $('#name8').val() == ""){
    		 $('#labelname8').show();
    		 return false;
    	 }else{
    		 $('#labelname8').hide();
    	 }
    	 
    	 if($('#noOfBeds8').val() == null || $('#noOfBeds8').val() == "" || $('#noOfBeds8').val() == "0" || !$('#noOfBeds8').val().match(/^[0-9]+$/)){
    		 
    		 $('#labelnoOfBeds8').show();
    		 return false;
    	 }else{
    		 $('#labelnoOfBeds8').hide();
    	 }
    	 if($('#address8').val() == null || $('#address8').val() == ""){
    		 $('#labeladdress8').show();
    		 return false;
    		 
    	 }else{
    		 $('#labeladdress8').hide();
    	 }
     }
     
     function validateBoysHostel(){
    	 
    	 if($('#name7').val() == null || $('#name7').val() == ""){
    		 $('#labelname7').show();
    		 return false;
    	 }else{
    		 $('#labelname7').hide();
    	 }
    	 
    	 if($('#noOfBeds7').val() == null || $('#noOfBeds7').val() == "" || $('#noOfBeds7').val() == "0" || !$('#noOfBeds7').val().match(/^[0-9]+$/)){
    		 
    		 $('#labelnoOfBeds7').show();
    		 return false;
    	 }else{
    		 $('#labelnoOfBeds7').hide();
    	 }
    	 if($('#address7').val() == null || $('#address7').val() == ""){
    		 $('#labeladdress7').show();
    		 return false;
    		 
    	 }else{
    		 $('#labeladdress7').hide();
    	 }
     }
    	 
     
     
     </script>
     
   <table class="table table-bordered">
  <thead><tr><td>   <h4>Girls</h4></td><td><h4>Boys</h4></td></tr></thead>
  <tbody><tr><td>
     <form:form action="addGirlsHostel" modelAttribute="girlshostel" method="POST" name="girlshostel" onsubmit="return validateGirlsHostel()">
     <div class="form-group">
     <label for="name">Name</label><p id="labelname8" style="display:none;color:red;">Something should be typed!</p>
     <form:input path="hostelName" id="name8" class="form-control" type="text"/>
     </div>
     
     <div class="form-group">
     <label for="noOfBeds">Number of beds</label><p id="labelnoOfBeds8" style="display:none;color:red;">Invalid number!</p>
     <form:input path="noOfBeds" type="text" id="noOfBeds8" class="form-control"/>
     </div>
      <div class="form-group">
     <label for="address">Address</label><p id="labeladdress8" style="display:none;color:red;">Something should be typed !</p>
     <form:textarea path="address" id="address8" class="form-control"/>
     </div>
     <form:input path="noOfOccupiedBeds" type="hidden" value="0"/>
     <input type="submit" value="save" class="btn btn-info"/>
     </form:form>
     </td><td>
    <form:form action="addBoysHostel" modelAttribute="boyshostel" method="POST" name="boyshostel" onsubmit="return validateBoysHostel()">
     <div class="form-group">
     <label for="name">Name</label><p id="labelname7" style="display:none;color:red;">Something should be typed!</p>
     <form:input path="hostelName" id="name7" class="form-control" type="text"/>
     </div>
     
     <div class="form-group">
     <label for="noOfBeds">Number of beds</label><p id="labelnoOfBeds7" style="display:none;color:red;">Invalid number!</p>
     <form:input path="noOfBeds" type="text" id="noOfBeds7" class="form-control"/>
     </div>
      <div class="form-group">
     <label for="address">Address</label><p id="labeladdress7" style="display:none;color:red;">Something should be typed !</p>
     <form:textarea path="address" id="address7" class="form-control"/>
     </div>
      <form:input path="noOfOccupiedBeds" type="hidden" value="0"/>
     <input type="submit" value="save" class="btn btn-info"/>
     </form:form>
     
     </td></tr>
     </tbody>
     </table>
    
</div>



<%--
<div class="tab-pane fade" id="sectionG">
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
<input type="hidden" name="my" value="admin"/>
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
<div id="225">
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
<td><button onclick="delPlac(${placementList.id})" class="btn btn-danger">Remove</button>

</td>
</tr>

</c:forEach>

</tbody>

</table>
</div>
<script>
function delPlac(abc){
	$.ajax({
		url:'deletePlacement',
		type:'GET',
		data:'id='+abc,
		success:function(data){
			alert("Information Deleted !!");
			$("#225").load(location.href + " #225");
		},
		error:function(data){
			alert("Internal Server Error !!");
		}
	})
	
}


</script>

</div>
 --%>

<div class="tab-pane fade" id="sectionH">
<h3>Gallery</h3>

<h4>Add a new album</h4>



<p id="msg" style="display:none">Saved Successfully</p>
<div class="form-group"> 
<label for="album">
Album name:
</label>
<p id='label' style="display:none;color:red;">This should be filled up</p>
<input type="text" id="album" class="form-control" />

</div>
<%----  //old logic
<div class="form-group"> 
<label for="dropdown">Enter number of pictures:
</label>
<input name="numPic" id="dropdown" class="form-control">
</div>


<p id="fle" style="display:none;color:red;">Files need to be selected</p>
<div id="textboxDiv" class="form-group">

</div>

--%><br>
<input type="file" class="test form-control" name="pic" id="pop" placeholder="Enter a picture" accept="image/*" multiple/>
<br><br>
<input type="submit" id="btn-sbmt" onclick="return saveGallery()" class="btn btn-default" value="Submit"><img src="https://www.oenovaults.com/images/loading.gif" id="loaderIcon1" style="display:none;" height="20px" width="20px" >
<p id="msg1" style="display:none;color:green;">Saved Successfully</p> 


<script>
function saveGallery(){
	var e = document.getElementById("pop");
	$('#msg1').hide();
	console.log("This is inside thhe sjjn");
	if($('#album').val() == ''){
		$('#label').show();return false;
	}
	if(e.files.length == 0){
		alert("Files need to be selected!!");
		return false;
	}
	
	var i;
	console.log($("#album").val()!=null);
	console.log($("#album").val()!="");
	if($("#album").val()!=""){
		
	jQuery.ajax({
		url:"saveAlbumName",
			data:"name="+$("#album").val(),
				type:"GET"
		
		
	});
	var c=0;
	$('#btn-sbmt').prop("disabled",true);
	
	console.log("c="+c);
	console.log("this is--->"+e.files.length);
	$("#loaderIcon1").show();
	for(i=0;i<e.files.length;i++){
		
		
		
		var data1 = new FormData();
		data1.append('album',$("#album").val());
		var xq = "textVal"+(i.toString());
		//data1.append('img',$("#textVal"+i.toString())[0].files[0]);
		//data1.append('img',document.getElementById("textVal1").files[0]);
		
		//compression->
		//var o = compress()
		var c=1;
		data1.append('img',e.files[i]);
		console.log(e.files[i].name);
		console.log("vhgvhgvhgvhgvhgvhgv");		
	jQuery.ajax({
		processData: false,
		contentType : false,          
		url:"saveGallery",
		data:data1,
		type:"POST",
		
		cache : false,
		success:function(data){
			if(i == e.files.length){
		console.log("jisjijiwjsiwjsiwjsws");
			$('#msg1').show();
			$("#loaderIcon1").hide();
			$('#btn-sbmt').prop("disabled",false);
			
			$('#label').hide();
			$("#667").load(location.href + " #667");
			}
		},
		error:function(data){}	
	});
	
	}}else{
		$("#loaderIcon1").hide();
		$("#fle").show();
		
		
	}
	
	
}
</script>

<%--
<script>
function saveGallery(){
	$("#loaderIcon1").show();
	$('#msg1').hide();
	console.log("This is inside thhe sjjn");
	
	var e = document.getElementsByClassName("test");
	var i;
	console.log($("#album").val()!=null);
	console.log($("#album").val()!="");
	if($("#album").val()!=""){
		
	jQuery.ajax({
		url:"saveAlbumName",
			data:"name="+$("#album").val(),
				type:"GET"
		
		
	});
	var c=0;
	console.log(typeof (e[1].files[0]));
	for(i=0;i<$("#dropdown").val();i++){
	if(typeof e[i].files[0] != 'undefined'){
		console.log("zindigi");
	c++;
	}
	}
	console.log("c="+c);
	if(c == $("#dropdown").val()){
	for(i=0;i<$("#dropdown").val();i++){
		
		
		
		var data1 = new FormData();
		data1.append('album',$("#album").val());
		var xq = "textVal"+(i.toString());
		//data1.append('img',$("#textVal"+i.toString())[0].files[0]);
		//data1.append('img',document.getElementById("textVal1").files[0]);
		data1.append('img',e[i].files[0]);
		console.log(e[i].files[0].name);
		console.log("vhgvhgvhgvhgvhgvhgv");		
	jQuery.ajax({
		processData: false,
		contentType : false,          
		url:"saveGallery",
		data:data1,
		type:"POST",
		
		cache : false,
		success:function(data){
		console.log("jisjijiwjsiwjsiwjsws");
			$('#msg1').show();
			$("#loaderIcon1").hide();
			document.getElementById('dropdown').selectedIndex = 0;
			$("#textboxDiv").html('');
		},
		error:function(data){}	
	});
	
	}}else{
		$("#loaderIcon1").hide();
		$("#fle").show();
		
	}
	
	}else{
		$("#label").show();
		$("#loaderIcon1").hide();
		$('#msg1').hide();
	}
}

</script>





<script type="text/javascript">
$(document).ready(function() {
    $("#dropdown").keyup(function() {
        var selVal = $(this).val();
        $("#textboxDiv").html('');
        if(selVal > 0) {
        	$('#msg1').hide();
        	$("#textboxDiv").append('<label>Select Photos:</label><br>');
            for(var i = 1; i<= selVal; i++) {
               // $("#textboxDiv").append('<input type="file" class="test form-control" name="pic" id="textVal'+i+'" placeholder="Enter a picture" accept="image/*" /><br>');
            }
           // $("#textboxDiv").append('<input type="submit" onclick="return saveGallery()" class="btn btn-default" value="Submit">&nbsp&nbsp<img src="https://www.oenovaults.com/images/loading.gif" id="loaderIcon1" style="display:none;" height="20px" width="20px" >');
        }
    });
});
</script>
--%>
<h2>Delete an album</h2>
<div id=667>
<table class="table">
<thead>
<tr>
<td>
Gallery name
</td>
<td>
Delete
</td>
</tr>
</thead>
<tbody>
<c:forEach var="r" items="${albumName}">
<tr>
<td>
${r.albumName}
</td>
<td>
<button class="btn btn-danger" onclick="delAlb('${r.albumName}')">Delete</button>

</td></tr></c:forEach></tbody></table></div>
<script>
function delAlb(abc){
	$.ajax({
		url:'deleteAlbum',
		type:'GET',
		data:'name='+abc,
		success:function(data){
			alert("Album Deleted !!");
			$("#667").load(location.href + " #667");
		},
		error:function(data){
			alert("Internal Server Error !!");
		}
	})
	
}

</script>
</div>
<div class="tab-pane fade" id="sectionI">
<script>
function deleteMsg(abc){
	$.ajax({
		url:'deleteMsg',
	    data:'id='+abc,
	    type:'GET',
	    success:function(data){
	    	alert("Message Deleted !!");
	    	$("#786").load(location.href + " #786");
	    	
	    },
	    error:function(data){
	    	alert("Internal Servar Error !");
	    }
		
	});
	
}


</script>
<h2>Messages Received</h2>
<div id="786">
<table class="table table-bordered">
<thead>
<tr><th>Date</th><th>Name</th><th>Email</th><th>Message</th><th>Options</th></tr>
</thead>
<tbody>
<c:forEach var="msg" items="${msg}">


<tr>
<td >${dte}</td>
<td>
${msg.name}
</td>
<td>
${msg.email}
</td>
<td>
${msg.message}
</td>
<td>
<button onclick="deleteMsg(${msg.id})" class="btn btn-danger">Delete</button>

</td>
</tr>
</c:forEach>
</tbody>
</table>

</div>

<h2>Testimonials Published</h2>
<div id="900">
<table class="table table-bordered">
<thead>
<tr>
<th>Student name</th><th>Admission Year</th><th>Body</th><th>Options</th>
</tr>
</thead>
<tbody>
<c:forEach var="x" items="${tst}">
<tr>
<td>
${x.studentName}
</td>
<td>
${x.year}
</td>
<td>
${x.body}
</td>
<td>
<button onclick="deleteFed(${x.id})" class="btn btn-danger">Delete</button>

</td>
</tr>

</c:forEach>

</tbody>

</table>
</div>
<script>
function deleteFed(abc){
	$.ajax({
		url:'deleteFed',
	    data:'my='+abc,
	    type:'GET',
	    success:function(data){
	    	alert("Message Deleted !!");
	    	$("#900").load(location.href + " #900");
	    	
	    },
	    error:function(data){
	    	alert("Internal Servar Error !");
	    }
		
	});
	
}


</script>

</div>
<div class="tab-pane fade" id="sectionJ">
<script>
function validatePlaUname(){
	
	var uname = $('#pla-1').val();
	if(uname == ""){
		$('#u-a-e-1').hide();		
        $('#a-1').hide();	
        return false;
		
	}
	$.ajax({
		url:'validatePlaUser',
		data:'uname='+uname,
		type:'GET',
		success:function(data){
			if(data == "a"){
				$('#u-a-e-1').hide();		
	            $('#a-1').show();	
	            $('#btn-1').prop("disabled",false);
			
			}
				if(data == "n"){
					$('#u-a-e-1').show();
					 $('#a-1').hide();
					$('#btn-1').prop("disabled",true);
				}
		},
		error:function(data){
			
		}
		
		
	});
}


</script>


 <h3>Create Placement department user</h3>
 <br>
 <div class="col-lg-4  col-md-4 col-sm-4">
<input class="form-control" type="text" name="pla-uname" id="pla-1" onblur="validatePlaUname()" placeholder="Enter username">
 </div>
  <div class="col-lg-4  col-md-4 col-sm-4">
<input class="form-control" type="password" name="pla-pass" id="pla-2" placeholder="Enter password">
  </div>
 
   <div class="col-lg-4  col-md-4 col-sm-4">
   <script>
       function delPla(abc){
    		 $.ajax({
    		
    			 url:'deleteOtherAdmins',
    		     data:'dept=PlacementDepartment&id='+abc,
    		     type:'GET',
    			 success:function(data){
    				 alert("User Deleted!");
    				 $("#ref1").load(location.href + " #ref1");
    				 
    			 },
    		     error:function(data){
    		    	 alert("Internal Server Error!")
    		     }
    			 
    		 });
       } 
    		  
       
       
       function delLib(abc){
  		 $.ajax({
  		
  			 url:'deleteOtherAdmins',
  		     data:'dept=LibraryDeparement&id='+abc,
  		     type:'GET',
  			 success:function(data){
  				 alert("User Deleted!");
  				 $("#ref2").load(location.href + " #ref2");
  				 
  			 },
  		     error:function(data){
  		    	 alert("Internal Server Error!")
  		     }
  			 
  		 });
     } 
  		  
       function delExa(abc){
    		 $.ajax({
    		
    			 url:'deleteOtherAdmins',
    		     data:'dept=ExamDepartment&id='+abc,
    		     type:'GET',
    			 success:function(data){
    				 alert("User Deleted!");
    				 $("#ref3").load(location.href + " #ref3");
    				 
    			 },
    		     error:function(data){
    		    	 alert("Internal Server Error!")
    		     }
    			 
    		 });
       } 
       
       function delAcc(abc){
  		 $.ajax({
  		
  			 url:'deleteOtherAdmins',
  		     data:'dept=AccountsDepartment&id='+abc,
  		     type:'GET',
  			 success:function(data){
  				 alert("User Deleted!");
  				 $("#ref4").load(location.href + " #ref4");
  				 
  			 },
  		     error:function(data){
  		    	 alert("Internal Server Error!")
  		     }
  			 
  		 });
     } 
    	
       </script>
   <button class="btn btn-info" id="btn-1">Submit</button>&nbsp&nbsp&nbsp<b id="u-a-e-1" style="color:red;display:none">Username already exist</b><b id="a-1" style="color:green;display:none">Available</b>
   
   <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal-1">Users</button>

<!-- Modal -->
<div id="myModal-1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Placement Department Users</h4>
      </div>
      <div id="ref1" class="modal-body">
      
       <c:forEach var="p" items="${pd}">
      
       Name-<b>${p.name}</b>
      <br>
      Username-<b> ${p.username}</b>
       <br>
      <br>
      <center><button class="btn btn-danger" onclick="delPla(${p.id})" id="del-btn">delete</button></center>
       
       <hr>
       </c:forEach>
       
      
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

   <script>
   $(document).ready(function(){
	   $('#btn-1').click(function(){
		  if($('#pla-2').val() == ""){alert("Password cannot be blank!");return false;} 
		  if($('#pla-1').val() == ""){alert("Username cannot be blank!");return false;} 
		  $.ajax({
			 url:'savePlaAcc',
		     type:'POST',
		     data:'uname='+$('#pla-1').val()+'&pass='+$('#pla-2').val(),
		     success:function(data){
		    	 alert("User created successfully !!");
		    	 $('#pla-1').val("");
		    	 $('#pla-2').val("");
		    	 $('#u-a-e-1').hide();		
		            $('#a-1').hide();	
		            $("#ref1").load(location.href + " #ref1");
		     },
		     error:function(data){
		    	 alert("Internal server error!!");
		    	 $('#pla-1').val("");
		    	 $('#pla-2').val("");
		    	 $('#u-a-e-1').hide();		
		            $('#a-1').hide();	
		     }
			  
			  
		  });
	   });
	   
   })
   
   </script>
   
   
   </div>
   <hr>
   <br>
   <h3>Create Library department user</h3>
   <script>
function validateLibUname(){
	
	var uname = $('#lib-1').val();
	if(uname == ""){
		$('#u-a-e-2').hide();		
        $('#a-2').hide();	
        return false;
		
	}
	$.ajax({
		url:'validateLibUser',
		data:'uname='+uname,
		type:'GET',
		success:function(data){
			if(data == "a"){
				$('#u-a-e-2').hide();		
	            $('#a-2').show();	
	            $('#btn-2').prop("disabled",false);
			
			}
				if(data == "n"){
					$('#u-a-e-2').show();
					 $('#a-2').hide();
					$('#btn-2').prop("disabled",true);
				}
		},
		error:function(data){
			
		}
		
		
	});
}


</script>
   
   <br>
 <div class="col-lg-4  col-md-4 col-sm-4">
<input class="form-control" type="text" name="pla-uname" id="lib-1" onblur="validateLibUname()" placeholder="Enter username">
 </div>
  <div class="col-lg-4  col-md-4 col-sm-4">
<input class="form-control" type="password" name="pla-pass" id="lib-2" placeholder="Enter password">
  </div>
 
   <div class="col-lg-4  col-md-4 col-sm-4">
   <button class="btn btn-info" id="btn-2">Submit</button>&nbsp&nbsp&nbsp<b id="u-a-e-2" style="color:red;display:none">Username already exist</b><b id="a-2" style="color:green;display:none">Available</b>
   
    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal-2">Users</button>

<!-- Modal -->
<div id="myModal-2" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Placement Department Users</h4>
      </div>
      <div id="ref2" class="modal-body">
      
       <c:forEach var="p" items="${ld}">
      
       Name-<b>${p.name}</b>
      <br>
      Username-<b> ${p.username}</b>
       <br>
      <br>
      <center> <button class="btn btn-danger" onclick="delLib(${p.id})" id="del-btn">delete</button></center>
       
       <hr>
       </c:forEach>
       
      
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
   <script>
   $(document).ready(function(){
	   $('#btn-2').click(function(){
		  if($('#lib-2').val() == ""){alert("Password cannot be blank!");return false;} 
		  if($('#lib-1').val() == ""){alert("Username cannot be blank!");return false;} 
		  $.ajax({
			 url:'saveLibAcc',
		     type:'POST',
		     data:'uname='+$('#lib-1').val()+'&pass='+$('#lib-2').val(),
		     success:function(data){
		    	 alert("User created successfully !!");
		    	 $('#lib-1').val("");
		    	 $('#lib-2').val("");
		    	 $('#u-a-e-2').hide();		
		            $('#a-2').hide();	
		            $("#ref2").load(location.href + " #ref2");
		     },
		     error:function(data){
		    	 alert("Internal server error!!");
		    	 $('#lib-1').val("");
		    	 $('#lib-2').val("");
		    	 $('#u-a-e-2').hide();		
		            $('#a-2').hide();	
		     }
			  
			  
		  });
	   });
	   
   })
   
   </script>
   
   
   </div>
   
   <br><br>
   <h3>Create Exam department user</h3>
    <script>
function validateExaUname(){
	
	var uname = $('#exa-1').val();
	if(uname == ""){
		$('#u-a-e-3').hide();		
        $('#a-3').hide();	
        return false;
		
	}
	$.ajax({
		url:'validateExaUser',
		data:'uname='+uname,
		type:'GET',
		success:function(data){
			if(data == "a"){
				$('#u-a-e-3').hide();		
	            $('#a-3').show();	
	            $('#btn-3').prop("disabled",false);
			
			}
				if(data == "n"){
					$('#u-a-e-3').show();
					 $('#a-3').hide();
					$('#btn-3').prop("disabled",true);
				}
		},
		error:function(data){
			
		}
		
		
	});
}


</script>
   <br>
 <div class="col-lg-4  col-md-4 col-sm-4">
<input class="form-control" type="text" name="pla-uname" id="exa-1" onblur="validateExaUname()" placeholder="Enter username">
 </div>
  <div class="col-lg-4  col-md-4 col-sm-4">
<input class="form-control" type="password" name="pla-pass" id="exa-2" placeholder="Enter password">
  </div>
 
   <div class="col-lg-4  col-md-4 col-sm-4">
   <button class="btn btn-info" id="btn-3">Submit</button>&nbsp&nbsp&nbsp<b id="u-a-e-3" style="color:red;display:none">Username already exist</b><b id="a-3" style="color:green;display:none">Available</b>
   <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal-3">Users</button>

<!-- Modal -->
<div id="myModal-3" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Exam Department Users</h4>
      </div>
      <div id="ref3" class="modal-body">
      
       <c:forEach var="p" items="${ed}">
      
       Name-<b>${p.name}</b>
      <br>
      Username-<b> ${p.username}</b>
       <br>
      <br>
      <center> <button class="btn btn-danger" onclick="delExa(${p.id})" id="del-btn">delete</button></center>
       
       <hr>
       </c:forEach>
       
      
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
   <script>
   $(document).ready(function(){
	   $('#btn-3').click(function(){
		  if($('#exa-2').val() == ""){alert("Password cannot be blank!");return false;} 
		  if($('#exa-1').val() == ""){alert("Username cannot be blank!");return false;} 
		  $.ajax({
			 url:'saveExaAcc',
		     type:'POST',
		     data:'uname='+$('#exa-1').val()+'&pass='+$('#exa-2').val(),
		     success:function(data){
		    	 alert("User created successfully !!");
		    	 $('#exa-1').val("");
		    	 $('#exa-2').val("");
		    	 $('#u-a-e-3').hide();		
		            $('#a-3').hide();	
		            $("#ref3").load(location.href + " #ref3");
		    	 
		     },
		     error:function(data){
		    	 alert("Internal server error!!");
		    	 $('#exa-1').val("");
		    	 $('#exa-2').val("");
		    	 $('#u-a-e-3').hide();		
		            $('#a-3').hide();	
		     }
			  
			  
		  });
	   });
	   
   })
   
   </script>
   
   
   </div>
   <br><br>
   <h3>Create Accounts department user</h3>
   <script>
function validateExaUname(){
	
	var uname = $('#acc-1').val();
	if(uname == ""){
		$('#u-a-e-4').hide();		
        $('#a-4').hide();	
        return false;
		
	}
	$.ajax({
		url:'validateAccUser',
		data:'uname='+uname,
		type:'GET',
		success:function(data){
			if(data == "a"){
				$('#u-a-e-4').hide();		
	            $('#a-4').show();	
	            $('#btn-4').prop("disabled",false);
			
			}
				if(data == "n"){
					$('#u-a-e-4').show();
					 $('#a-4').hide();
					$('#btn-4').prop("disabled",true);
				}
		},
		error:function(data){
			
		}
		
		
	});
}


</script>
   <br>
 <div class="col-lg-4  col-md-4 col-sm-4">
<input class="form-control" type="text" name="pla-uname" id="acc-1" onblur="validateExaUname()" placeholder="Enter username">
 </div>
  <div class="col-lg-4  col-md-4 col-sm-4">
<input class="form-control" type="password" name="pla-pass" id="acc-2" placeholder="Enter password">
  </div>
 
   <div class="col-lg-4  col-md-4 col-sm-4">
   <button class="btn btn-info" id="btn-4">Submit</button>&nbsp&nbsp&nbsp<b id="u-a-e-4" style="color:red;display:none">Username already exist</b><b id="a-4" style="color:green;display:none">Available</b>
  
  <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal-4">Users</button>

<!-- Modal -->
<div id="myModal-4" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Accounts Department Users</h4>
      </div>
      <div id="ref4" class="modal-body">
      
       <c:forEach var="p" items="${ad}">
      
       Name-<b>${p.name}</b>
      <br>
      Username-<b> ${p.username}</b>
       <br>
      <br>
      <center><button class="btn btn-danger" onclick="delAcc(${p.id})" id="del-btn">delete</button></center>
       
       <hr>
       </c:forEach>
       
      
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
  
  
   <script>
   $(document).ready(function(){
	   $('#btn-4').click(function(){
		  if($('#acc-2').val() == ""){alert("Password cannot be blank!");return false;} 
		  if($('#acc-1').val() == ""){alert("Username cannot be blank!");return false;} 
		  $.ajax({
			 url:'saveAccAcc',
		     type:'POST',
		     data:'uname='+$('#acc-1').val()+'&pass='+$('#acc-2').val(),
		     success:function(data){
		    	 alert("User created successfully !!");
		    	 $('#acc-1').val("");
		    	 $('#acc-2').val("");
		    	 $('#u-a-e-4').hide();		
		            $('#a-4').hide();	
		            $("#ref4").load(location.href + " #ref4");
		     },
		     error:function(data){
		    	 alert("Internal server error!!");
		    	 $('#acc-1').val("");
		    	 $('#acc-2').val("");
		    	 $('#u-a-e-4').hide();		
		            $('#a-4').hide();	
		     }
			  
			  
		  });
	   });
	   
   })
   
   </script>
   </div>
   <br>
   <br>
   <br>
   <br>
   <br>
   <br><br>
   <br>
   <br>
   </div>
<script>
 function chkPassword(){
	 console.log(document.getElementById('password123').value+" "+document.getElementById('password321').value);
	 if(document.getElementById('password123').value != document.getElementById('password321').value){
		 $('#showmsg').show();
		 return false;
		 console.log("wdwdqwdqw");
		 
	 }
	
	 
	 
	 }
	 
	 
 
</script>
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
       
        <input type="hidden" value="admin" name="name" id="name"/>
         <label for="password1" style="font-size: 13px;">Type your new password:</label>
        <input type="password"  class="form-control" name="Password123" id="password123" required="required" style="width:200px" />
        <br>
        <label for="password2" style="font-size: 13px;">Retype the  password again:</label>
        <input type="password" class="form-control" name="Password321" id="password321" required="required" style="width:200px"/><br>
        
        <input type="submit" id="newPass" class="btn btn-info">
      <br> 
        <br>
        
        
      </div>
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
    			url:'changeMe',
    			type:"POST",
    			data:'Password123='+p1+'&name='+$('#name').val(),
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
    </div>
  </div>




</div>





<br>
<br>
   <br>
   <br>

<footer class="navbar-fixed-bottom" style="background-color: #0a0a29;
    padding: 0px; color:white;text-align: right;">
    
    
  <p>Administrator Portal | KMBB CET | <a href="#" onclick="document.getElementById('id01').style.display='block'" title="click to change your passsword">Change Password</a> | <a href='invalidateMe'> Logout</a>&nbsp&nbsp  </p>
</footer>

</body>
</html>
