<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%if (session.getAttribute("reg") == null){response.sendRedirect("/college-project/work/index");} %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Calendar" %>
<html lang="en">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

  <title>Student Portal | KMBB CET</title>
  <link rel="shortcut icon" href="/college-project/assets/img/logo.png" type="image/png">
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
">Student Portal</span></b>
    
    
    <span style="
   color: white;
    position: relative;
    font-size: 8px;
    left: -275px;
    top: 11px;
}
">College of Engineering and Technology</span>
</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav nav-pills">
        <li ><a data-toggle="pill" href="#sectionA">Information</a></li>
        <li><a data-toggle="pill" href="#sectionB">Payment</a></li>
        <li><a data-toggle="pill" href="#sectionc">Testimonial</a></li>
      
      </ul>
      
    </div>
  </div>
</nav>
<div class="container">
 <div class="tab-content">
      <div class="tab-pane fade in active" id="sectionA">
      <br>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
<%


%><script>
function validateImg(){
	if(document.getElementById("img").files.length ==  0){
	alert("Please select your photo..");
	return false;
	}
}

</script>
     
     *if any information of yourself is wrong in this table then please contact the college administrator immediately.
      <c:forEach var="list" items="${studentInfo}">

     <table class="table table-bordered">
     <thead>
 <tr>
    <th colspan="3">${list.fullName}</th>
  </tr></thead>
  <tbody>
  <tr>

   <td rowspan="14"><img src="/college-project/image/getImage?id=${list.id}" height="200px" width="170px"/>
   <br><br><form action="saveStudentImage" method="POST" enctype='multipart/form-data' onsubmit = "return validateImg()">
   <input type="file" name="img" id="img" accept="image/*"><br>
   <input type="hidden" name="reg" value="${reg}">
   <input type="submit"value="save" class="btn btn-primary btn-sm">
   </form>
   
   </td>
    <tr>
<td>Registration Number</td>
<td>${list.registrationNumber}</td>
</tr>

<tr>
<td>Branch</td>
<td>${list.branch}</td>
</tr>

<tr>
 <td >Gender</td>
<td> ${list.gender}</td>
</tr>

<tr>
<td >Email</td>
<td>${list.email}</td>
</tr>


<tr>
<td >Lateral Entry</td>
<td>${list.lateral}</td>
</tr>



<tr>
<td >Admission Year</td>
<td>

 <c:if test="${list.lateral == 'Yes'}">
          ${list.admissionYear + 1}
          </c:if>
          <c:if test="${list.lateral == 'No'}">
           ${list.admissionYear}
          </c:if>
          

</td>
</tr>

<tr>
<td >Current Year</td>
<td>
<c:if test="${(year - list.admissionYear) eq 1 }">
1st Year
</c:if>
<c:if test="${(year - list.admissionYear) eq 2 }">
2nd Year
</c:if>
<c:if test="${(year - list.admissionYear) eq 3 }">
3rd Year
</c:if>
<c:if test="${(year - list.admissionYear) eq 4 }">
4th Year
</c:if>
</td>
</tr>
<tr>
<td >Contact number</td>
<td>${list.mobContact}</td>
</tr>

<tr>
<td >Guardian Name</td>
<td>${list.guardianName}</td>
</tr>

<tr>
<td >Hostel Name</td>
<td>${list.hostel}</td>
</tr>

<tr>
<td >Hostel Bed no.</td>
<td>${list.hostelBedNo}</td>
</tr>

<tr>
<td >Fees</td>
 <td> Rs ${list.totalFees}</td>
</tr>

<tr>
<td >Fees paid</td>
<td>Rs ${list.feesPaid}</td>
</tr>
   
    
    </tbody>
    
    
  
 
</table>

 <br>

<center>

<a class="btn btn-info" data-toggle="modal" data-target="#${list.id}" onclick="myFunction('${list.id}')">Update Your Information</a>
</center>
          <div id="${list.id}" class="modal fade" role="dialog" >
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Edit Student</h4>
      </div>
      <div class="modal-body">
        
        <!--  edit form -->
        
      
        
        <form action="updateMyInfo" method="POST" enctype='multipart/form-data' onsubmit="return validateEditStudent()" >
       <input type="hidden" value="${list.id}" name="id">
       <input type="hidden" name="reg" value="${list.registrationNumber}"/>
        <div class="form-group">
    <label for="fullName">Full Name</label><p id="fullName1" style="display:none;color:red;">Enter full name of the student</p><p id="fullName2" style="display:none;color:red;">digits is name? :/ </p>
   <input  type="text" class="form-control" id="fullName" name="fullName" value="${list.fullName}">
  </div>
  <%--
    <input type="hidden" name="reg" value="${list.registrationNumber}"/>
 <input  type="hidden"  name="password" value="${list.password}"/>
 <input type="hidden" name="branch" value="${list.branch}">
 <input type="hidden" name="admissionYear" value="${list.admissionYear}">
  </div>
  
   <div class="form-group">
    <label for="registrationNumber">Registration Number<img src="https://www.oenovaults.com/images/loading.gif" id="loaderIcon${list.id }" style="display:none;" height="20px" width="20px" />
   
    <span id="user-availability-status${list.id }">
    
    </span>&nbsp&nbsp&nbsp<span id="status${list.id }" style="color:red;font-size: 10px;display:none">Must be 10 digits</span>
    <span id="status2${list.id }" style="color:red;font-size: 10px;display:none">Must be only digits</span>
    </label><p id="registrationNumber1${list.id }" style="display:none;color:red;">Enter Registration Number</p>
    <input  type="text" class="form-control" onblur="checkRegNo('${list.id}')" id="registrationNumber${list.id}" name="registrationNumber" value="${${list.fullName}}"/>
  </div>
 --%>
<!-- fmt date here -->

<c:set var="year" value="${list.dob}"></c:set>
<fmt:formatDate var="dte" value="${list.dob}" pattern="yyyy-MM-dd" />

 
  <div class="form-group">
  <label for="dateofbirth">Date Of Birth</label><p id="dateofbirth1" style="display:none;color:red;">Enter date of birth</p>
<input  type="date" class="form-control" name="dob" id="dateofbirth" value="${dte}"/>
  </div>
  
  <div class="form-group">
    <label for="mobContact">Mobile number</label><p id="mobContact1" style="display:none;color:red;">Enter contact number</p>
    <input type="text" class="form-control" id="mobContact" name="mobContact" value="${list.mobContact}"/>
    
  </div>
  
  <div class="form-group">
    <label for="email">Email address</label><p id="email1" style="display:none;color:red;">Enter email address</p>
    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="email" value="${list.email}"/>
    </div>
    <%--
    <div class="form-group">
    <label for="password">Default password</label><p id="password1${list.id }" style="display:none;color:red;">Enter password</p>
    <input  type="text" class="form-control" id="password${list.id }" name="password" value="${list.password}"/>
  </div>
  
  <div class="form-group">
    <label for="admissionYear">Admission Year</label><p id="admissionYear1${list.id }" style="display:none;color:red;">Enter admission year</p><p id="admissionYear2${list.id }" style="display:none;color:red;">Should be only numbers of 4 digits</p>
    

  </div>

  <div class="form-group">
  <label for="sel1${list.id }">Select gender</label><p id="genderSelection1${list.id }" style="display:none;color:red;">Enter gender</p>
  <select class="form-control" name="gender" id="sel1${list.id }" onchange="xyz2('sel1${list.id }','sel4${list.id}' )">
  <option value="sel">Select your gender</option>   
     <option value="Male">Male</option>   
    <option value="Female">Female</option>
  
   
  </select>
</div>
 --%>
<div class="form-group">
    <label for="guardianName">Guardian name</label><p id="guardianName1" style="display:none;color:red;">Enter guardian Name</p>
    <input type="text" class="form-control" id="guardianName" name="guardianName" value="${list.guardianName}"/>
  </div>
  <%--
  <div class="form-group">
  <label for="sel2${list.id}">Select Branch</label>
  <select class="form-control" id="sel2${list.id}" name="branch">
    <option>Mechanical Engineering</option>
    <option>Computer Science And Engineering</option> 
    <option>Civil Engineering</option>
    <option>Electrical Engineering</option>
    <option>Electrical and Electronics Engineering</option>
   <option>Electronics and Communication Engineering</option>
  </select>
</div>
--%>
<%--
<div class="form-group">
  <label for="sel3${list.id}">Hostel</label><p id="hstl" style="color:red;display:none">select hostel</p>
  <select  class="form-control" id="sel3${list.id}" name="hstlreq" >
    <option value="sop">Select</option>
    <option value="No">No</option>
    <option value="Yes">Yes</option> 
  </select>
</div>

<input type="hidden" name="gender" value="${list.gender}"/>
<input type="hidden" name="hostel" value="${list.hostel}"/>
<input type="hidden" name="hostelBedNo" value="${list.hostelBedNo}"/>
<input type="hidden"  name="totalFees" value="${list.totalFees}"/>
<input type="hidden"  name="feesPaid" value="${list.feesPaid}"/>
--%>
 <script>
  function myFunction(x)
{
	  console.log(x);
	  //var gender = document.getElementById("sel1"+x).value=${list.gender}; 
	  $("#sel1"+x).val("${list.gender}");
	  console.log("x");
	 
	  console.log("x");
	 
	
	  console.log("x");
	  

	  
	  
	  }       
  
               </script>


<%--
<div class="form-group">
  <label for="sel4${list.id}">Hostel</label>
  <select  class="form-control" name="hostel" id="sel4${list.id}">
   <option>Nothing</option> 
   
  </select>
</div>
<input type = "hidden" name="oldGender" value="${list.gender}"/>
<input type = "hidden" name="oldHostelName" value="${list.hostel}"/>
<input type ="hidden" name="hostelBedNo" value="${list.hostelBedNo }"/>

<div class="form-group"><p id="totalFees1${list.id }" style="display:none;color:red;">Enter total fees of the student</p><p id="totalFees2${list.id }" style="display:none;color:red;">Should be equal to 4 digits</p>
    <label for="totalFees">Total fees per year</label>
    <input type="text" class="form-control" id="totalFees${list.id }" name="totalFees" value="${list.totalFees}"/>
  </div>
  
  <div class="form-group">
    <label for="feesPaid">Fees paid</label><p id="feesPaid1${list.id }" style="display:none;color:red;">Enter fees paid </p><p id="feesPaid2${list.id }" style="display:none;color:red;">Should be greater than 0</p>
    <input type="text" class="form-control" id="feesPaid${list.id }" name="feesPaid" value="${list.feesPaid}"/>
  </div>

  <div class="form-group">
  <label for="picture">Upload student image</label><p id="picture1" style="display:none;color:red;">Select an image</p>
 <input class="form-control" id="picture" type="file" name="picture" accept="image/*"/>

</div>

--%>
  
  <button id="submit" class="btn btn-primary">Submit</button>  
            
        </form>
        
        <!--  edit form end -->
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
          







</c:forEach>
 <script>
function xyz(theId, theHostelId, g, b, a, s, h)
{
	
console.log("1");
	
	
	console.log(theId);
	var x  = document.getElementById(theId).value; console.log(x);
	var y = document.getElementById(theHostelId);
	console.log(x);
	var i;
    for(i = y.options.length - 1 ; i >= 0 ; i--)
    {
       y.remove(i);
    }

	
	if(g  == "Female"){
		console.log("inside options creator");
		var option = document.createElement("option");
		option.text ="No";
		y.add(option);
	
		<c:forEach var="list" items="${girlsHostelList}">
		console.log("inside options creator foreach");
		if( ${list.noOfBeds} != ${list.noOfOccupiedBeds}){
			var option = document.createElement("option");
		 option.text = "${list.hostelName}";
		    y.add(option);
		}
		</c:forEach>
	}
	if(g == "Male"){
		console.log("inside options creator male");
		var option = document.createElement("option");
		option.text ="No";
		y.add(option);
		console.log("inside options creator male2");
		<c:forEach var="list" items="${boysHostelList}">
		
		if( ${list.noOfBeds} != ${list.noOfOccupiedBeds}){
			var option = document.createElement("option");
		option.text =" ${list.hostelName}";
		y.add(option);
		}
				</c:forEach>
			}
	myFunction(g, b, a, s, h);
	console.log(3);

}

function xyz2(theId, theHostelId)
{
	
console.log("1");
	
	
	console.log(theId);
	var x  = document.getElementById(theId).value; console.log(x);
	var y = document.getElementById(theHostelId);
	console.log(x);
	var i;
    for(i = y.options.length - 1 ; i >= 0 ; i--)
    {
       y.remove(i);
    }

	
	if(x  == "Female"){
		console.log("inside options creator");
		var option = document.createElement("option");
		option.text ="No";
		y.add(option);
	
		<c:forEach var="list" items="${girlsHostelList}">
		console.log("inside options creator foreach");
		if( ${list.noOfBeds} != ${list.noOfOccupiedBeds}){
			var option = document.createElement("option");
		 option.text = "${list.hostelName}";
		 console.log("inside female function");
		    y.add(option);
		}
		</c:forEach>
	}
	if(x == "Male"){
		console.log("inside options creator male");
		var option = document.createElement("option");
		option.text ="No";
		y.add(option);
		console.log("inside options creator male2");
		<c:forEach var="list" items="${boysHostelList}">
		
		if( ${list.noOfBeds} != ${list.noOfOccupiedBeds}){
			var option = document.createElement("option");
		option.text =" ${list.hostelName}";
		y.add(option);
		}
				</c:forEach>
			}
	
}



</script>

 

<script>
  function checkRegNo(abc){
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
			  },
			  error:function(){}
	  });
		  }else{
			  $("#status").show();
			  $("#loaderIcon").hide();
			  $("#user-availability-status").hide();
		  }
	  }else{
		  $("#status2").show();
		  
		  $("#loaderIcon").hide();
		  $("#user-availability-status").hide();
	  }
	  
  }
  
  </script>
  <script>
      
      function validateEditStudent(abc)
      {
    	  console.log(document.getElementById("fullName").value == null);
    	 
      if( document.getElementById("fullName").value == null || document.getElementById("fullName").value == "" ){
    	  console.log(document.getElementById("fullName").value == null);
    	  console.log(abc);
      document.getElementById("fullName1").style.display = "block";
      return false;
      }else if(document.getElementById("fullName").value.match(/^[0-9]+$/)){console.log(abc);
      document.getElementById("fullName2").style.display = "block";
      document.getElementById("fullName1").style.display = "none";
      return false;
      }else{document.getElementById("fullName1").style.display = "none";
       document.getElementById("fullName2").style.display = "none";console.log("xsxscxsx");
      }

    
    

      if( document.getElementById("dateofbirth").value == null || document.getElementById("dateofbirth").value == ""){
      document.getElementById("dateofbirth1").style.display = "block";return false;
      }
      else{
      document.getElementById("dateofbirth1").style.display = "none";
      }

      if(document.getElementById("mobContact").value == null || document.getElementById("mobContact").value == "" || !document.getElementById("mobContact").value.match(/^[0-9]+$/)){
      document.getElementById("mobContact1").style.display = "block";return false;
      }
      else{
      document.getElementById("mobContact1").style.display = "none";
      }

      if(document.getElementById("email").value == null || document.getElementById("email").value == ""){
      document.getElementById("email1").style.display = "block";return false;
      }
      else{
      document.getElementById("email1").style.display = "none"
      }

    
    
      

      if(document.getElementById("guardianName").value == null || document.getElementById("guardianName").value == "" ){
      document.getElementById("guardianName1").style.display = "block";return false;
      }
      else{
      document.getElementById("guardianName1").style.display = "none";
      }

     

      if(document.getElementById("picture").files.length ==  0){
       document.getElementById("picture1").style.display = "block";return false;
      }
      else{
     document.getElementById("picture1").style.display = "none";
      }

     

      }
      
      
      </script>
  
 <hr>
  
  <br><br>
  <h3>Results</h3>
  <c:set var="y" value="${reg}"/>
  <c:forEach var="r" items="${marks}">
  <c:set var="h" value="${r.regNo}"/>
  
  <c:if test="${h == y}">
<u>${r.examName}</u><br><br>
${r.subMarks}
<hr>

  </c:if>
 

  </c:forEach>
  
</div>
<div class="tab-pane fade" id="sectionB">
 
<c:forEach var="info" items="${studentInfo}">
      <h2>Payment</h2>
     
      <c:set var="tf" value="${info.totalFees}"/>
      <c:set var="fp" value="${info.feesPaid }"></c:set>
      
      <p>You have <b>Rs ${tf - fp}</b>  amount to pay<p>
     <script>
     function fp(){
      <c:if test="${(tf - fp) eq 0}">
      $('#form-show').hide();
      console.log("inside this");
      </c:if>
     }
     
     </script>
     
     
     
      <br>
     
       <div class="container">
      <h3>Pay Now</h3>
      <br>
      Enter amount:
      <input type="text" id="amt" class="form-control" value="" style="width:200px"/>
      <br>
      
      
      
      <button class="btn btn-info" id="rzp-button1">Pay</button>
      
      </div>
     
      
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
$(document).ready(function(){
	$('#rzp-button1').click(function(){
		
	

var options = {
    "key": "rzp_test_1fHSy6MLOWuY0d",
    "amount": $('#amt').val()*100, // 2000 paise = INR 20
    "name": "PRO",
    "description": "Purchase Description",
    "image": "/your_logo.png",
    "handler": function (response){
        alert("Your payment has been successfully processed !! Thank you");
        $.ajax({
        	url:'final',
        	data:'amount='+$('#amt').val()+"&reg=${reg}"+"&status="+response.razorpay_payment_id+"&ph=${info.mobContact}",
        	type:'POST',
        	success:function(data){
        		window.location.reload(true);
        		
        	}
        	
        	
        	
        });
    },
    "prefill": {
        "name": '',
        "email": "${info.email}"
    },
    "notes": {
        "address": "Hello World"
    },
    "theme": {
        "color": "#F37254"
    }
};
var rzp1 = new Razorpay(options);


    rzp1.open();
    e.preventDefault();

});
	
});

</script>
 </c:forEach>
 <br>
 <h3>Your Bill History</h3>
<table class="table table-bordered">
<thead><tr><th>Reg. no</th><th>amount</th><th>mode</th><th>date & time</th><th>Bill no.\DD no.\Cheque no.</th></tr></thead>
<tbody id="yui">
 <c:forEach var="d" items="${bill}">
<tr>
<td>${d.regNo}</td>
<td>Rs. ${d.amount}</td>
<td>${d.mode}</td>
<td>${d.dateTime}</td>
<td>${d.billNo}</td>

</tr>
 
 </c:forEach>
 </tbody>
</table>
</div>
<div class="tab-pane fade" id="sectionc">

<h2>Share a feedback</h2>
<div class="alert alert-success" id="success" style="display:none;">
    <strong>Success!</strong> You have successfully shared your feedback thank you.
  </div>
  
  <div class="alert alert-danger" id="fail" style="display:none;">
  <strong>Error!</strong> Server encountered some problem, try again later, sorry!:(
</div>

<c:forEach var="info" items="${studentInfo}">
<input type="hidden" value="${info.fullName}" id="sname"/>
<input type="hidden" value="${info.admissionYear}" id="syear"/>
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
	
	
	
	function chkPassword(){
		 console.log(document.getElementById('password123').value+" "+document.getElementById('password321').value);
		 if(document.getElementById('password123').value != document.getElementById('password321').value){
			 $('#showmsg').show();
			 return false;
			 console.log("wdwdqwdqw");
			 
		 }
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
        
        <c:forEach var="info" items="${studentInfo}">
        <input type="hidden" value="${info.id}" name="id" id="id"/>
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
    			url:'changeStudent',
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
  <p>Student Portal | KMBB CET | <a href="#" onclick="document.getElementById('id01').style.display='block'">Change Password</a> | <a href='invalidateMe' style="colo:white"> Logout</a>&nbsp&nbsp      </p>
</footer>


</body>
</html>
