<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="/college-project/assets/img/logo.png" type="image/png">
<%if (session.getAttribute("user") == null){response.sendRedirect("/college-project/work/index");} %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
  <script
	src="//ajax.googleapis.com/ajax/libs/angularjs/1.2.18/angular-resource.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>This is the list of student</title>
<style type="text/css">

body{


}
.table-bordered {
    
    color: black;
}
</style>


</head>
<body style="font-size: 11px;">



<br>
 <script>
function xyz(theId, theHostelId, g, b, a, h, p)
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
	myFunction(g, b, a, h, p);
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
  function myFunction(x, y, z, h, p)
{
	  console.log(x, y, z, h,p);
	  
	  var lateral = document.getElementById("lateralpop"+z).value=p;
	  
	  var gender = document.getElementById("sel1"+z).value=x; 
	  console.log("x");
	  var branch = document.getElementById("sel2"+z).value=y;
	  console.log("x");
	 
	  console.log("x");
	  document.getElementById("sel4"+z).value=h;

	  
	  
	  }       
  
               </script>
<script>
  function checkRegNo(abc){
	  $("#registrationNumber1"+abc).hide();
	  $("#user-availability-status"+abc).hide();
	  $("#loaderIcon"+abc).show();
	  var regex=/^[0-9]+$/;
	  console.log($("#registrationNumber"+abc).val());
	  if(($("#registrationNumber"+abc).val()).match(regex)){
		  if( $("#registrationNumber"+abc).val().length == 10){
	  jQuery.ajax({
		  
		      url:"checkReg",
			  data:'reg='+$("#registrationNumber"+abc).val(),
			  type:"GET",
			  success:function(data){$("#user-availability-status"+abc).show().html(data)
				  $("#loaderIcon"+abc).hide();
			  $("#status"+abc).hide();
			  $("#status2"+abc).hide();
			  },
			  error:function(){}
	  });
		  }else{
			  $("#status"+abc).show();
			  $("#loaderIcon"+abc).hide();
			  $("#user-availability-status"+abc).hide();
		  }
	  }else{
		  $("#status2"+abc).show();
		  
		  $("#loaderIcon"+abc).hide();
		  $("#user-availability-status"+abc).hide();
	  }
	  
  }
  
  </script>
<h2>
Student list
</h2>
<br>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Sr. no.</th>
        <th>Photo</th>
        <th>Full Name</th>
        <th>DOB</th>
        <th>Registration number</th>
        <th>Gender</th>
        <th>Email</th>
        <th>Admission Year</th>
        <th>Contact Number</th>
        <th>Guardian Name</th>
        <th>Lateral Entry</th>
        <th>Hostel Name</th>
        <th>Fees</th>
        <th>Fees Paid</th>
        <th>Options</th>
      </tr>
    </thead>
    <tbody>
    <% int i=1; %>
  
    	<c:forEach var="list" items="${lst}">
      <tr>
    
        <td><%=i++ %></td>
        <td><img src="/college-project/image/getImage?id=${list.id}" height="80px" width="70px"/></td>
        <td>${list.fullName}</td>
        <fmt:formatDate var="dte" value="${list.dob}" pattern="dd-MM-yyyy" />
        <td>${dte}</td>
        <td>${list.registrationNumber}</td>
        
        <td>${list.gender}</td>
         <td>${list.email}</td>
          <td>
          
          <c:if test="${list.lateral == 'Yes'}">
          ${list.admissionYear + 1}
          </c:if>
          <c:if test="${list.lateral == 'No'}">
           ${list.admissionYear}
          </c:if>
          
          </td>
           <td>${list.mobContact}</td>
            <td>${list.guardianName}</td>
           <td>${list.lateral}</td>
             <td>${list.hostel} <strong>${list.hostelBedNo}</strong></td>
              <td>${list.totalFees}</td>
               <td>${list.feesPaid}</td>
             
             
               
               <td><a class="btn btn-info" data-toggle="modal" data-target="#${list.id}" onclick=" xyz('sel1${list.id }', 'sel4${list.id}','${list.gender}' , '${list.branch}', '${list.id}', '${list.hostel}','${list.lateral}' )">Update</a><hr>
                <a href="deleteStudent?my=${list.id}&year=${list.admissionYear}&branch=${list.branch}&hostel=${list.hostel}&gender=${list.gender}&hstlNo=${list.hostelBedNo}" class="btn btn-info" onclick=" if(!(confirm('Are you sure you want to delete?'))) return false" style="width: 72px;">Delete </a></td>
               
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
        
      
        
        <form action="updateStudent" method="POST" enctype='multipart/form-data' onsubmit="return validateEditStudent('${list.id}')" >
       <input type="hidden" value="${list.id}" name="id">
        <div class="form-group">
    <label for="fullName">Full Name</label><p id="fullName1${list.id}" style="display:none;color:red;">Enter full name of the student</p><p id="fullName2${list.id}" style="display:none;color:red;">digits is name? :/ </p>
    <input  type="text" class="form-control" id="full${list.id}" name="fullName" value="${list.fullName}">
    
  </div>
  
   <div class="form-group">
    <label for="registrationNumber">Registration Number<img src="https://www.oenovaults.com/images/loading.gif" id="loaderIcon${list.id }" style="display:none;" height="20px" width="20px" />
   
    <span id="user-availability-status${list.id }">
    
    </span>&nbsp&nbsp&nbsp<span id="status${list.id }" style="color:red;font-size: 10px;display:none">Must be 10 digits</span>
    <span id="status2${list.id }" style="color:red;font-size: 10px;display:none">Must be only digits</span>
    </label><p id="registrationNumber1${list.id }" style="display:none;color:red;">Enter Registration Number</p>
    <input  type="text" class="form-control" onblur="checkRegNo('${list.id}')" id="reg${list.id}" name="registrationNumber" value="${list.registrationNumber}"/>
  </div>
 
<!-- fmt date here -->

<c:set var="year" value="${list.dob}"></c:set>
<fmt:formatDate var="dte" value="${list.dob}" pattern="yyyy-MM-dd" />

 
  <div class="form-group">
  <label for="dateofbirth">Date Of Birth</label><p id="dateofbirth1${list.id }" style="display:none;color:red;">Enter date of birth</p>
<input  type="date" class="form-control" name="dob" id="date${list.id }" value="${dte}"/>
  </div>
  
  <div class="form-group">
    <label for="mobContact">Mobile number</label><p id="mobContact1${list.id }" style="display:none;color:red;">Enter contact number</p>
    <input type="text" class="form-control" id="mob${list.id }" name="mobContact" value="${list.mobContact}"/>
    
  </div>
  
  <div class="form-group">
    <label for="email">Email address</label><p id="email1${list.id }" style="display:none;color:red;">Enter email address</p>
    <input type="email" class="form-control" id="e${list.id }" aria-describedby="emailHelp" name="email" value="${list.email}"/>
    </div>
    
    
     <div class="form-group">
  <label for="lateral">Lateral Entry</label><p id="lateral1" style="display:none;color:red;"></p>
  <select class="form-control" name="lateral" id="lateralpop${list.id}">
   
    <option value="No">No</option>
    <option value="Yes">Yes</option> 
  </select>
</div>
    <input type="hidden" name="bodrel" value="${list.lateral}">
    <div class="form-group">
    <label for="password">Default password</label><p id="password1${list.id }" style="display:none;color:red;">Enter password</p>
    <input  type="text" class="form-control" id="pas${list.id }" name="password" value="${list.password}"/>
  </div>
 
<c:if test="${list.lateral == 'Yes'}">
 <div class="form-group">
    <label for="admissionYear">Admission Year</label><p id="admissionYear1${list.id }" style="display:none;color:red;">Enter admission year</p><p id="admissionYear2${list.id }" style="display:none;color:red;">Should be only numbers of 4 digits</p>
    <input  type="text" class="form-control" id="adm${list.id }" name="admissionYear" value="${list.admissionYear + 1}"/>
  </div>
 
 
  </c:if>
  
  <c:if test="${list.lateral == 'No'}">
  <div class="form-group">
    <label for="admissionYear">Admission Year</label><p id="admissionYear1${list.id }" style="display:none;color:red;">Enter admission year</p><p id="admissionYear2${list.id }" style="display:none;color:red;">Should be only numbers of 4 digits</p>
    <input  type="text" class="form-control" id="adm${list.id }" name="admissionYear" value="${list.admissionYear}"/>
  </div>
  </c:if>

 <div class="form-group">
  <label for="sel1${list.id }">Select gender</label><p id="genderSelection1${list.id }" style="display:none;color:red;">Enter gender</p>
  <select class="form-control" name="gender" id="sel1${list.id }" onchange="xyz2('sel1${list.id }','sel4${list.id}' )">
  
     <option value="Male">Male</option>   
     <option value="Female">Female</option>
     </select>
</div>

<div class="form-group">
    <label for="guardianName">Guardian name</label><p id="guardianName1${list.id}" style="display:none;color:red;">Enter guardian Name</p>
    <input type="text" class="form-control" id="gua${list.id}" name="guardianName" value="${list.guardianName}"/>
  </div>
  
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

<div class="form-group">
  <label for="sel4${list.id}">Hostel</label>
  <select  class="form-control" name="hostel" id="sel4${list.id}">
   <option>Nothing</option> 
   
  </select>
</div>
<input type = "hidden" name="oldGender" value="${list.gender}"/>
<input type = "hidden" name="oldHostelName" value="${list.hostel}"/>
<input type ="hidden" name="hostelBedNo" value="${list.hostelBedNo}"/>

<div class="form-group"><p id="totalFees1${list.id }" style="display:none;color:red;">Enter total fees of the student</p><p id="totalFees2${list.id }" style="display:none;color:red;">Should be equal to 4 digits</p>
    <label for="totalFees">Total fees per year</label>
    <input type="text" class="form-control" id="tot${list.id }" name="totalFees" value="${list.totalFees}"/>
  </div>
  
  <div class="form-group">
    <label for="feesPaid">Fees paid</label><p id="feesPaid1${list.id }" style="display:none;color:red;">Enter fees paid </p><p id="feesPaid2${list.id }" style="display:none;color:red;">Should be greater than 0</p>
    <input type="text" class="form-control" id="fee${list.id }" name="feesPaid" value="${list.feesPaid}"/>
  </div>
  <%--
  <div class="form-group">
  <label for="picture">Upload student image</label><p id="picture1${list.id }" style="display:none;color:red;">Select an image</p>
 
 
 <input class="form-control" id="picture${list.id }" type="file" name="picture" accept="image/*" value='Leave it blank if the current image is the same image'/>


<img id="blah" src="#" alt="your image" width="100px" height="120px" style="display:none;"/>

--%>



<div class="form-group">
  
  <button id="submit" class="btn btn-primary">Submit</button>  
            </div>
        
        </form>
            </div>
        <!--  edit form end -->
        </div>
        
      </div>
      
          
               
               
      </tr>
      </c:forEach>
    </tbody>
  </table>
 
<script>
      
      function validateEditStudent(abc)
      {
    	  console.log(document.getElementById("full"+abc).value);
    	 console.log(abc);
    	 
      if( document.getElementById("full"+abc).value == null || document.getElementById("full"+abc).value == "" ){
    	 // console.log(document.getElementById("full"+abc).value == null);
    	  console.log(abc);
      document.getElementById("fullName1"+abc).style.display = "block";
      return false;
      }else if(document.getElementById("full"+abc).value.match(/^[0-9]+$/)){console.log(abc);
      document.getElementById("fullName2"+abc).style.display = "block";
      document.getElementById("fullName1"+abc).style.display = "none";
      return false;
      }else{document.getElementById("fullName1"+abc).style.display = "none";
       document.getElementById("fullName2"+abc).style.display = "none";console.log("xsxscxsx");
      }
var cv=document.getElementById("reg"+abc).value;
      console.log(cv);
      if(document.getElementById("reg"+abc).value == null || document.getElementById("reg"+abc).value == "" || !cv.match(/^[0-9]+$/)){                  
      document.getElementById("registrationNumber1"+abc).style.display = "block";return false;var regex = /^[0-9]+$/;
      console.log("kcbscbashcbasjcbajscbhjascbajscb"+regex.test(cv));
      console.log(cv.match(/^[0-9]/));}
      else{
      document.getElementById("registrationNumber1"+abc).style.display = "none";console.log("xsxscxsx111");
      }

      if( document.getElementById("date"+abc).value == null || document.getElementById("date"+abc).value == ""){
      document.getElementById("dateofbirth1"+abc).style.display = "block";return false;
      }
      else{
      document.getElementById("dateofbirth1"+abc).style.display = "none";
      }

      if(document.getElementById("mob"+abc).value == null || document.getElementById("mob"+abc).value == "" || !document.getElementById("mob"+abc).value.match(/^[0-9]+$/)){
      document.getElementById("mobContact1"+abc).style.display = "block";return false;
      }
      else{
      document.getElementById("mobContact1"+abc).style.display = "none";
      }

      if(document.getElementById("e"+abc).value == null || document.getElementById("e"+abc).value == ""){
      document.getElementById("email1"+abc).style.display = "block";return false;
      }
      else{
      document.getElementById("email1"+abc).style.display = "none"
      }

      if(document.getElementById("pas"+abc).value == null || document.getElementById("pas"+abc).value == ""){
      document.getElementById("password1"+abc).style.display = "block";return false;
      }
      else{
      document.getElementById("password1"+abc).style.display = "none";
      }

      if(document.getElementById("adm"+abc).value == null || document.getElementById("adm"+abc).value == "" || document.getElementById("admissionYear"+abc).value == 0 || !document.getElementById("admissionYear"+abc).value.match(/^[0-9]+$/)){
      document.getElementById("admissionYear1"+abc).style.display = "block";return false;
      }
      else{
    	  
      document.getElementById("admissionYear1"+abc).style.display = "none";
      document.getElementById("admissionYear2"+abc).style.display = "none";
      }

      

      if(document.getElementById("gua"+abc).value == null || document.getElementById("gua"+abc).value == "" ){
      document.getElementById("guardianName1"+abc).style.display = "block";return false;
      }
      else{
      document.getElementById("guardianName1"+abc).style.display = "none";
      }

      if(document.getElementById("tot"+abc).value == null || document.getElementById("tot"+abc).value == "" || !document.getElementById("totalFees"+abc).value.match(/^[0-9]+$/) || document.getElementById("totalFees"+abc).value == 0){
      document.getElementById("totalFees1"+abc).style.display = "block";return false;
      }else{
      document.getElementById("totalFees1"+abc).style.display = "none";
     document.getElementById("totalFees2"+abc).style.display = "none";
      }

 

      if(document.getElementById("fee"+abc).value == null || document.getElementById("fee"+abc).value == "" || !document.getElementById("feesPaid"+abc).value.match(/^[0-9]+$/)){
      document.getElementById("feesPaid1"+abc).style.display = "block";return false;
      
      }
      else{
      document.getElementById("feesPaid1"+abc).style.display = "none";
      }

      }











      </script>



</body>
</html>