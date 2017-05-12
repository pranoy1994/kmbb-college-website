<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%if (session.getAttribute("exa") == null){response.sendRedirect("/college-project/work/index");} %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Calendar" %>
<html lang="en">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

  <title>Exam Portal | KMBB CET</title>
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
">Exam Department</span></b>
    
    
    <span style="
   color: white;
    position: relative;
    font-size: 8px;
    left: -295px;
    top: 11px;
}
">College of Engineering and Technology</span>
</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav nav-pills">
        <li ><a data-toggle="pill" href="#sectionA">Publish Marks</a></li>
        <li><a data-toggle="pill" href="#sectionB">Delete Marks</a></li>
        
      
      </ul>
      
    </div>
  </div>
</nav>
<div class="container">
 <div class="tab-content">
      <div class="tab-pane fade in active" id="sectionA">
<center><h2>Welcome <c:forEach var="d" items="${pla}">${d.name}<c:set var="u" value="${d.username}"/></c:forEach></h2></center>
<br>
<h3>Publish Internal Marks</h3>
<div>
<div class="col-lg-4  col-md-4 col-sm-4">
<script type="text/javascript">
$(document).ready(function(){
    $('input[name="optradio"]').click(function(){
    	console.log("wddwdwd");
        var inputValue = $(this).attr("value");
        var targetBox = $("." + inputValue);
        
        $(".box").show();
    });
});
</script>
<p>Enter the Year</p>
<div class="radio">
  <label><input type="radio" name="optradio" value="1">1st Year</label>
</div>
<div class="radio">
  <label><input type="radio" name="optradio" value="2">2nd Year</label>
</div>
<div class="radio">
  <label><input type="radio" name="optradio" value="3">3rd Year</label>
</div>
<div class="radio">
  <label><input type="radio" name="optradio" value="4">4rd Year</label>
</div>

</div>
<div class="col-lg-8  col-md-8 col-sm-8">
<div class="box" style="display:none">
<p>Enter the branch</p>
<div class="radio">
<label><input type="radio" name="opt" id="opt1" value="Mechanical-Engineering">Mechanical Engineering</label>
</div>
<div class="radio">
  <label><input type="radio" name="opt" id="opt2" value="Computer-Science-And-Engineering">Computer Science And Engineering</label>
</div>
<div class="radio">
  <label><input type="radio" name="opt" id="opt3" value="Civil-Engineering">Civil Engineering</label>
</div>
<div class="radio">
  <label><input type="radio" name="opt" id="opt4" value="Electrical-Engineering">Electrical Engineering</label>
</div>

<div class="radio">
  <label><input type="radio" name="opt" id="opt5" value="Electrical-and-Electronics-Engineering">Electrical and Electronics Engineering</label>
</div>

<div class="radio">
  <label><input type="radio" name="opt" id="opt6" value="Electronics-and-Communication-Engineering">Electronics and Communication Engineering</label>
</div>


   
</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
    $('input[name="opt"]').click(function(){
    	console.log("wddwdwd");
        var inputValue = $(this).attr("value");
        var yr = $('input[name="optradio"]:checked').val();
        console.log(yr+" "+inputValue);
      
      
        var lol = "."+yr+"-"+inputValue;
        console.log(lol);
        $(".c").not(lol).hide();
        $(lol).show();
        $('#intex').show();
        
    });
});
</script>
<br><br> 
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

<div id="intex" style="display:none">
 Enter Exam Name:
 <input type="text" id="ename" name="ename" class="form-control"/>
 Enter Number of Subjects:
  <input type="text" id="rop" name="sub" class="form-control"/>

</div>
<script type="text/javascript">
$(document).ready(function() {
    $("#rop").keyup(function() {
        var selVal = $(this).val();
        $(".textboxDiv").html(''); $(".textboxDiv2").html('');$("#bton").html('');
        if(selVal > 0) {
        	$('#msg1').hide();
        	$(".textboxDiv").append('<label></label><br>');
            for(var i = 1; i<= selVal; i++) {
            	 $(".textboxDiv2").append('<input type="text" name="pic" class="sub" placeholder="Enter subject name"  /><br>');  
            $(".textboxDiv").append('<input class="chotu" type="text" name="pic" id="mar'+i+'" placeholder="Enter marks obtained in order of subjects" style="width:400px;" /><br>');
            }
            $("#bton").append('<button onclick="submit('+i+')" type="submit" class="btn btn-info">Publish</button>');
             }
    });
});


function submit(p){
	var q;
	var w="9";
	var z= $(".peter");
	var t = "x";  
	var subinp = $(".sub");
	var inputs = $(".chotu");
	
	for(var i = 0; i < inputs.length; i++){
		
		if((inputs[i] != ""))
		q=q+","+$(inputs[i]).val();
		
	}

	 alert(q);
//	for(i=1;i<p;i++){
	//	w=w+","+$('#sub'+i).val();
//	}
	for(i = 0 ; i< subinp.length; i++){
		if((subinp[i] != null))
		w=w+","+$(subinp[i]).val();
	}
	alert(w);
	
	for(i=0; i < z.length ;i++){
		t=t+","+$(z[i]).val();
	}
	alert(t);
	
	jQuery.ajax({
		url:'studentMarks',
		type:'POST',
		data:'marks='+q+',&sub='+w+',&reg='+t+',&examName='+$('#ename').val()+", Year-"+$('input[name="optradio"]:checked').val()+","+$('input[name="opt"]:checked').val(),
		success:function(data){
			alert("Marks Published !!");
			window.location.href=window.location.href;
			
		},
		error:function(data){
			alert("Internal Server Error !");
			window.location.href=window.location.href;
		}
		
		
		
	});
	
}
</script>
<div class="1-Mechanical-Engineering c" style="display:none">
 <c:set var="p" value="Mechanical Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
 
<c:when test="${x.admissionYear == (year - i) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k1"></div>

<script>
$(document).ready(function(){
	$('#opt1').click(function(){console.log("inside the click");
   if($('.1-Mechanical-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k1").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k1").html('');
});
});

</script>
<br>

</c:when>
</c:choose>

</c:forEach>
</div>
<div class="1-Computer-Science-And-Engineering c" style="display:none">

<c:set var="p" value="Computer Science And Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>


<div id="k2"></div>

<script>
$(document).ready(function(){
	$('#opt2').click(function(){console.log("inside the click");
   if($('.1-Computer-Science-And-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k2").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k2").html('');
});
});

</script>

<br>

</c:when>
</c:choose>

</c:forEach>



</div>


<div class="1-Civil-Engineering c" style="display:none">

<c:set var="p" value="Civil Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>

<div id="k3"></div>

<script>
$(document).ready(function(){
	$('#opt3').click(function(){console.log("inside the click");
   if($('.1-Civil-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k3").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k3").html('');
});
});

</script>
<br>

</c:when>
</c:choose>

</c:forEach>





</div>

<div class="1-Electrical-Engineering c" style="display:none">
<c:set var="p" value="Electrical Engineering"/>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>

<div id="k4"></div>

<script>
$(document).ready(function(){
	$('#opt4').click(function(){console.log("inside the click");
   if($('.1-Electrical-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k4").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k4").html('');
});
});

</script>
<br>

</c:when>
</c:choose>

</c:forEach>






</div>

<div class="1-Electrical-and-Electronics-Engineering c" style="display:none">
<c:set var="p" value="Electrical and Electronics Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k5"></div>

<script>
$(document).ready(function(){
	$('#opt5').click(function(){console.log("inside the click");
   if($('.1-Electrical-and-Electronics-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k5").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k5").html('');
});
});

</script>

<br>

</c:when>
</c:choose>

</c:forEach>





</div>

<div class="1-Electronics-and-Communication-Engineering c" style="display:none">
<c:set var="p" value="Electronics and Communication Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<input type="hidden" class="peter" value="${x.registrationNumber}"/>


<div id="k6"></div>

<script>
$(document).ready(function(){
	$('#opt6').click(function(){console.log("inside the click");
   if($('.1-Electronics-and-Communication-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k6").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k6").html('');
});
});

</script>
<br>
</c:when>
</c:choose>

</c:forEach>






</div>

<div class="2-Mechanical-Engineering c" style="display:none">

 <c:set var="p" value="Mechanical Engineering"/>
 <br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -1) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k7"></div>

<script>
$(document).ready(function(){
	$('#opt1').click(function(){console.log("inside the click opt2");
   if($('.2-Mechanical-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k7").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k7").html('');
});
});

</script>
<br>

</c:when>
</c:choose>

</c:forEach>
</div>
<div class="2-Computer-Science-And-Engineering c" style="display:none">

<c:set var="p" value="Computer Science And Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -1) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k8"></div>

<script>
$(document).ready(function(){
	$('#opt2').click(function(){console.log("inside the click opt2");
   if($('.2-Computer-Science-And-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k8").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k8").html('');
});
});

</script>
<br>
</c:when>
</c:choose>

</c:forEach>



</div>


<div class="2-Civil-Engineering c" style="display:none">

<c:set var="p" value="Civil Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -1) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k9"></div>

<script>
$(document).ready(function(){
	$('#opt3').click(function(){console.log("inside the click opt2");
   if($('.2-Civil-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k9").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k9").html('');
});
});

</script>
<br>

</c:when>
</c:choose>

</c:forEach>





</div>

<div class="2-Electrical-Engineering c" style="display:none">
<c:set var="p" value="Electrical Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -1) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k10"></div>

<script>
$(document).ready(function(){
	$('#opt4').click(function(){console.log("inside the click opt2");
   if($('.2-Electrical-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k10").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k10").html('');
});
});

</script>
<br>

</c:when>
</c:choose>

</c:forEach>






</div>

<div class="2-Electrical-and-Electronics-Engineering c" style="display:none">
<c:set var="p" value="Electrical and Electronics Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -1) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k11"></div>

<script>
$(document).ready(function(){
	$('#opt5').click(function(){console.log("inside the click opt2");
   if($('.2-Electrical-and-Electronics-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k11").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k11").html('');
});
});

</script>
<br>

</c:when>
</c:choose>

</c:forEach>





</div>

<div class="2-Electronics-and-Communication-Engineering c" style="display:none">
<c:set var="p" value="Electronics and Communication Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i - 1) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k12"></div>

<script>
$(document).ready(function(){
	$('#opt6').click(function(){console.log("inside the click opt2");
   if($('.2-Electronics-and-Communication-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k12").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k12").html('');
});
});

</script>
<br>
</c:when>
</c:choose>

</c:forEach>






</div>


<div class="3-Mechanical-Engineering c" style="display:none">

 <c:set var="p" value="Mechanical Engineering"/>
 <br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -2) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k13"></div>

<script>
$(document).ready(function(){
	$('#opt1').click(function(){console.log("inside the click opt2");
   if($('.3-Mechanical-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k13").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k13").html('');
});
});

</script><br>

</c:when>
</c:choose>

</c:forEach>
</div>
<div class="3-Computer-Science-And-Engineering c" style="display:none">

<c:set var="p" value="Computer Science And Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -2) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k14"></div>

<script>
$(document).ready(function(){
	$('#opt2').click(function(){console.log("inside the click opt2");
   if($('.3-Computer-Science-And-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k14").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k14").html('');
});
});

</script><br>

</c:when>
</c:choose>

</c:forEach>



</div>


<div class="3-Civil-Engineering c" style="display:none">

<c:set var="p" value="Civil Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -2) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k15"></div>

<script>
$(document).ready(function(){
	$('#opt3').click(function(){console.log("inside the click opt2");
   if($('.3-Civil-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k15").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k15").html('');
});
});

</script>
<br>

</c:when>
</c:choose>

</c:forEach>





</div>

<div class="3-Electrical-Engineering c" style="display:none">
<c:set var="p" value="Electrical Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -2) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k16"></div>

<script>
$(document).ready(function(){
	$('#opt4').click(function(){console.log("inside the click opt2");
   if($('.3-Electrical-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k16").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k16").html('');
});
});

</script><br>

</c:when>
</c:choose>

</c:forEach>






</div>

<div class="3-Electrical-and-Electronics-Engineering c" style="display:none">
<c:set var="p" value="Electrical and Electronics Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -2) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k17"></div>

<script>
$(document).ready(function(){
	$('#opt5').click(function(){console.log("inside the click opt2");
   if($('.3-Electrical-and-Electronics-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k16").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k16").html('');
});
});

</script><br>

</c:when>
</c:choose>

</c:forEach>





</div>

<div class="3-Electronics-and-Communication-Engineering c" style="display:none">
<c:set var="p" value="Electronics and Communication Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i - 2) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k17"></div>

<script>
$(document).ready(function(){
	$('#opt6').click(function(){console.log("inside the click opt2");
   if($('.3-Electronics-and-Communication-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k17").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k17").html('');
});
});

</script><br>

</c:when>
</c:choose>

</c:forEach>






</div>


<div class="4-Mechanical-Engineering c" style="display:none">

 <c:set var="p" value="Mechanical Engineering"/>
 <br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -3) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k18"></div>

<script>
$(document).ready(function(){
	$('#opt1').click(function(){console.log("inside the click opt2");
   if($('.4-Mechanical-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k18").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k18").html('');
});
});

</script><br>

</c:when>
</c:choose>

</c:forEach>
</div>
<div class="4-Computer-Science-And-Engineering c" style="display:none">

<c:set var="p" value="Computer Science And Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -3) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k19"></div>

<script>
$(document).ready(function(){
	$('#opt2').click(function(){console.log("inside the click opt2");
   if($('.4-Computer-Science-And-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k19").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k19").html('');
});
});

</script><br>

<br>

</c:when>
</c:choose>

</c:forEach>



</div>


<div class="4-Civil-Engineering c" style="display:none">

<c:set var="p" value="Civil Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -3) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k20"></div>

<script>
$(document).ready(function(){
	$('#opt3').click(function(){console.log("inside the click opt2");
   if($('.4-Civil-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k20").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k20").html('');
});
});

</script><br>

</c:when>
</c:choose>

</c:forEach>





</div>

<div class="4-Electrical-Engineering c" style="display:none">
<c:set var="p" value="Electrical Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -3) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k21"></div>

<script>
$(document).ready(function(){
	$('#opt4').click(function(){console.log("inside the click opt2");
   if($('.4-Electrical-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k21").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k21").html('');
});
});

</script><br>

</c:when>
</c:choose>

</c:forEach>






</div>

<div class="4-Electrical-and-Electronics-Engineering c" style="display:none">
<c:set var="p" value="Electrical and Electronics Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i -3) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k22"></div>

<script>
$(document).ready(function(){
	$('#opt5').click(function(){console.log("inside the click opt2");
   if($('.4-Electrical-and-Electronics-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k22").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k22").html('');
});
});

</script><br>

</c:when>
</c:choose>

</c:forEach>





</div>

<div class="4-Electronics-and-Communication-Engineering c" style="display:none">
<c:set var="p" value="Electronics and Communication Engineering"/>
<br><br>
  <div class="textboxDiv2"></div>
  <br><br>
<c:forEach var="x" items="${studentList}">
 <c:choose> 
<c:when test="${x.admissionYear == (year - i - 3) and x.branch == p}" > 
${x.fullName}(${x.registrationNumber})<div class="textboxDiv"></div>
<div id="k23"></div>

<script>
$(document).ready(function(){
	$('#opt6').click(function(){console.log("inside the click opt2");
   if($('.4-Electronics-and-Communication-Engineering').css('display') == 'block'){console.log("inside the click------------");
	   $("#k23").append('<input type="hidden" class="peter" value="${x.registrationNumber}"/>');
   }else
	   $("#k23").html('');
});
});

</script>
<br>

</c:when>
</c:choose>

</c:forEach>






</div>



<div id="bton"></div>


</div>
</div>
<div class="tab-pane fade" id="sectionB">
 <center><h2>Delete Marks</h2></center>
 <h4>Click to delete published results</h4>
<ul>
 <c:forEach var = "we" items="${marks}">
<li>
 <a href="deleteExamName?my=${we.name}&u=${exa}">${we.name}</a><br>
 </li>
 </c:forEach>
 </ul>
 
 
 
 
 
 
 



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
    			url:'changeExamPass',
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
  <p>Exam Portal | KMBB CET | <a href="#" onclick="document.getElementById('id01').style.display='block'">Change Password</a> | <a href='invalidateMe' style="colo:white"> Logout</a>&nbsp&nbsp      </p>
</footer>


</body>
</html>
