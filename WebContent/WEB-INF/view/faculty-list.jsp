<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="/college-project/assets/img/logo.png" type="image/png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <%if (session.getAttribute("user") == null){response.sendRedirect("/college-project/work/index");} %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>This is faculty list</title>
<style>
.table-bordered {
    border: 4px solid #ddd;
}
</style>
</head>
<body style="background-color: #f5f5f5;font-size: 11px;">



<div class="container">          
  <table class="table table-bordered">
  <caption style="font-size:20px">Faculty List of <%=request.getParameter("dept") %></caption>
    <thead>
      <tr>
        <th>Sr. no.</th>
        <th>Photo</th>
        <th>Name</th>
        <th>Department</th>
        <th>Designation</th>
        <th>Qualification</th>
         <th>Username</th>
         <th>Contact</th>
        <th>Options</th>
      </tr>
    </thead>
    <tbody>
    <% int i=1; %>
    <c:forEach var="list" items="${facultylist}">
    <tr>
    <td>
    <%out.print(i);i++; %>
    </td>
    <td>
    <img alt="image" src="/college-project/image/getFacultyImage?id=${list.id}" height="80px" width="70px">
    </td>
    
    <td>
    ${list.name}
    </td>
    <td>
    ${list.department}
    </td>
    
    <td>
    ${list.designation}
    </td>
    
    <td>
    ${list.qualification}
    </td>
    
     <td>
    ${list.username}
    </td>
     <td>
    ${list.contact}
    </td>
    
    <td>
    <a data-toggle="modal" data-target="#${list.id}" onclick="changeDepartment('${list.id}','${list.department}')" class="btn btn-info">edit</a>| <a href="deleteFaculty?id=${list.id}&dept=${list.department}" class="btn btn-info">delete</a>
    </td>
    
    </tr>
    <div id="${list.id}" class="modal fade" role="dialog">
     <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Edit Faculty</h4>
      </div>
      <div class="modal-body">
      
      <form action="editFacultyInAdmin" method="POST" enctype='multipart/form-data' onsubmit="return validateEditFaculty('${list.id}')">
      <input type="hidden" value="${list.id}" name="id"/>
      <div class="from-group">
      <label for="name">Name
      </label><p id="labelname22${list.id}" style="display:none;color:red;">Something should be typed!</p>
      <input type="text" class="form-control" id="name22${list.id}" name="name" placeholder="Enter name of the faculty" value="${list.name}"/>
      </div>
       <div class="form-group">
    <label for="department">Department</label>
    <select class="form-control" id="department${list.id}" name="department">
   <option value="Mechanical Department">Mechanical Department</option>
   <option value="Computer Science Department">Computer Science Department</option>
   <option value="Civil Engineering Department">Civil Engineering Department</option>
   <option value="Electrical Department">Electrical Department</option>
   <option value="Electronics Department">Electronics Department</option>
   <option value="Humanities Department">Humanities Department</option>
  </select>
  </div>
  
   <div class="form-group">
    <label for="designation">Designation</label><p id="labeldesignation22${list.id}" style="display:none;color:red;">Enter the designation of the faculty!</p>
    <input type="text" class="form-control" id="designation22${list.id}" name="designation" value="${list.designation}" placeholder="Enter the designation of the faculty"/>
  </div>
  
 <%-- <div class="form-group">
  <label for="photo">Upload faculty image</label><p id="labelphoto22${list.id}" style="display:none;color:red;">Select an image!</p>
 <input class="form-control" id="photo22${list.id}" type="file" name="photo" accept="image/*"/>

</div>--%>

<div class="form-group">
    <label for="qualification">Qualification</label><p id="labelqualification22${list.id}" style="display:none;color:red;">Enter qualification of the faculty!</p>
    <input type="text" class="form-control" id="qualification${list.id}" name="qualification" value="${list.qualification}" placeholder="Enter the qualification details of the faculty"/>
  </div>
  
  <div class="form-group">
    <label for="contact">Contact number</label><p id="labelcontact22${list.id}" style="display:none;color:red;">Enter contact no!</p>
    <input type="text" class="form-control" id="contact${list.id}" name="contact" value="${list.contact}" placeholder="Enter your contact no"/>
  </div>
  
  
  
   <div class="form-group">
    <label for="designation">Gender</label><p id="labelgender22${list.id}" style="display:none;color:red;">Select your gender!</p>
    <select name="gender" id="sel${list.id}" class="form-control">
    <option value="sel">Select</option>
    <option value="Male">Male</option>
    <option value="Female">Female</option>
    </select>
  </div>
  
  <div class="form-group">
    <label for="uname">Username</label><p id="uname22${list.id}" style="display:none;color:red;">Enter username</p>
    <input type="text" class="form-control" id="un${list.id}" name="uname" value="${list.username}" placeholder="Enter the usernamae"/>
  </div>
 
 <div class="form-group">
    <label for="contact">Default Password</label><p id="password22${list.id}" style="display:none;color:red;">Enter contact no!</p>
    <input type="text" class="form-control" id="pass${list.id}" name="password" value="${list.password}" placeholder="Enter the default password"/>
  </div>
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
    </tbody>
    </table>
    <script>
    
    function changeDepartment(abc,dep){
    	document.getElementById("department"+abc).value = dep;
    	
    }
    
    function validateEditFaculty(abc){
    	
    	if($('#un'+abc).val() == "")
    		{
    		$('#uname22'+abc).show();
    		return false;
    		}
    	if($('#pass'+abc).val()== ""){
    		$('#password22'+abc).show();
    		return false;
    	}
    	
    	
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

   		 if($('#qualification22'+abc).val() == "null" || $('#qualification22'+abc).val() == ""){
   		 $('#labelqualification22'+abc).show();
   		 return false;
   		 }else{$('#labelqualification22'+abc).hide();}
   	 
    	
    	
    	
    	
    	
    }
    
    </script>
    
    
    
    </div>
</body>
</html>