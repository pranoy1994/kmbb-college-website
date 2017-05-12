<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%if (session.getAttribute("acc") == null){response.sendRedirect("/college-project/work/index");} %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Calendar" %>
<html lang="en">
<head>
<link rel="shortcut icon" href="/college-project/assets/img/logo.png" type="image/png">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <title>Accounts Portal | KMBB CET</title>
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
">Accounts</span></b>
    
    
    <span style="
   color: white;
    position: relative;
    font-size: 8px;
    left: -238px;
    top: 11px;
}
">College of Engineering and Technology</span>
</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav nav-pills">
        <li ><a data-toggle="pill" href="#sectionA">Payment</a></li>
        <li><a data-toggle="pill" href="#sectionB">Bills</a></li>
       
      
      </ul>
      
    </div>
  </div>
</nav>
<div class="container">
 <div class="tab-content">
      <div class="tab-pane fade in active" id="sectionA">

<br>
<br>
<script>
function pro(abc,xyz){
	
	if(xyz == 0){
		$('#btn'+abc).prop("disabled",true);
	}
}
</script>
<script>
function myFunction() {
    // Declare variables
    var input, filter, ul, li, a, i;
    input = document.getElementById('myInput');
   
    filter = input.value.toUpperCase();
    ul = document.getElementById("myUL");
    li = ul.getElementsByTagName('li');

    // Loop through all list items, and hide those who don't match the search query
    for (i = 0; i < li.length; i++) {
    	
        a = li[i].getElementsByTagName("span")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "block";
        } else {
            li[i].style.display = "none";
        }
    }
}
</script>

<div class="container">
<input type="text" class="form-control" id="myInput" onkeyup="myFunction()" placeholder="Search for students.."><br>
</div>
<ul id="myUL" class="w3-ul w3-card-4">
<c:set var="now" value="<%=new java.util.Date()%>" />
  <fmt:formatDate pattern="yyyy-MM-dd" value="${now}" var="dt" />
<c:forEach var="s" items="${studentList}">

  <li class="w3-padding-16">

    <img src="/college-project/image/getImage?id=${s.id}" class="w3-left w3-circle w3-margin-right" style="height:60px;width:60px">
    <span class="w3-large">${s.fullName}</span><span class="w3-right">Amount left-<b>${s.totalFees - s.feesPaid}</b></span><br>
    <span>${s.registrationNumber}<span class="w3-right"><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" id="bton${s.id}" onclick="pro(${s.id},${s.totalFees - s.feesPaid})" data-target="#myModal${s.id}">Pay</button>
</span></span>
    <div id="myModal${s.id}" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Payment for ${s.fullName}</h4>
      </div>
      <div class="modal-body">
      <form method="GET" action="saveTransaction" onsubmit="return validate(${s.id},${s.totalFees})">
      <input type="hidden" name="uname" value="${acc}"/>
      <input type="hidden" name="regNo" value="${s.registrationNumber}"/>
        Enter amount in Rs.
        <input type="text" name="amt" class="form-control" id="amt${s.id}"/>
        <br>
        Enter mode of payment
        <select id="mode${s.id}" class="form-control" name="mode">
        <option value="sel">Select</option>
        <option value="cash">cash</option>
        <option value="card">card</option>
        <option value="dd">DD</option>
        <option value="bt">Bank Transfer</option>
        </select>
      <br>
      Date:
       <input type="date" id="dte${s.id}" class="form-control" name="date"/>
    <%--
       
        <div id="showDate">
        Select Transfer date:
        <input type="date" class="form-control" name="date"/>
        </div>
        <div id="showDisabledDate">
        Date:
         <input type="date" class="form-control" name="date" value="${dt}" disabled/>
        </div>
        --%>
        <br>  
        Enter bill number:
        <input type="text" class="form-control" name="billno" id="bill${s.id}">
        <br>
              <input id="btn${s.id}" type="Submit" class="btn btn-info">        </form>      </div>      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>    </div>  </div></div>  </li>  </c:forEach>
</ul>
<script>
function validate(abc,pqr){
	console.log("validate   "+abc);
	if($('#amt'+abc).val() > pqr){
		alert("Invalid amount!");return false;
	}
	if(!$('#amt'+abc).val().match(/^[0-9]*$/)){
		alert("This amount value is not allowed!");return false;
	}
	
	if($('#amt'+abc).val() == ""){
		alert("Enter amount");
		return false;
	}
	if($('#mode'+abc).val() == "sel"){
		alert("Select mode");
		return false;
		
	}
	if($('#dte'+abc).val() == ""){
		alert("Enter date value");
		return false;
	}
	if($('#bill'+abc).val() == ""){
		alert("Enter bill number");
		return false;
	}
	
}

</script>
<script>
$(document).ready(function(){
	
		//$('#mode').change(function(){			
			$("select[name='mode']").change(function(){
				if($("select[name='mode']").val() == "bt"){
					$('input[name="date"]').val('');
					//$('#dte').prop('disabled',false);
				}else{
					var now = new Date();

					var day = ("0" + now.getDate()).slice(-2);
					var month = ("0" + (now.getMonth() + 1)).slice(-2);

					var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
					$('input[name="date"]').val(today);
					//$('#dte').prop('disabled',true);
				}
		});
		});

</script>





</div>


<div class="tab-pane fade" id="sectionB">
<script>
function myFunction1() {
    // Declare variables
    var input, filter, ul, li, a, i;
    input = document.getElementById('myInput1');
    filter = input.value.toUpperCase();
    ul = document.getElementById("yui");
    li = ul.getElementsByTagName('tr');

    // Loop through all list items, and hide those who don't match the search query
    for (i = 0; i < li.length; i++) {
        a = li[i].getElementsByTagName("td")[0];
        if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
            li[i].style.display = "";
        } else {
            li[i].style.display = "none";
        }    }}
</script><br>
<div class="container">
<input type="text" class="form-control" id="myInput1" onkeyup="myFunction1()" placeholder="Search for students.."><br>
</div>
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
    			url:'changeAccPass',
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
  <p>Accounts Portal | KMBB CET | <a href="#" onclick="document.getElementById('id01').style.display='block'">Change Password</a> | <a href='invalidateMe' style="colo:white"> Logout</a>&nbsp&nbsp      </p>
</footer>


</body>
</html>
