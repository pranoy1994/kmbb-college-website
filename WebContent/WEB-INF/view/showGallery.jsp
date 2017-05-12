<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="java.util.Calendar" %>
<html lang="en">
<head>
  <title>Gallery | KMBB CET</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="/college-project/assets/img/logo.png" type="image/png">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://www.jqueryscript.net/demo/Responsive-Photo-Gallery-with-jQuery-and-Bootstrap-3/photo-gallery.js"></script>
  
  <%--
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.1.1/ekko-lightbox.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.1.1/ekko-lightbox.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.1.1/ekko-lightbox.js.map"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.1.1/ekko-lightbox.js.map"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.1.1/ekko-lightbox.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.1.1/ekko-lightbox.min.css.map">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.1.1/ekko-lightbox.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.1.1/ekko-lightbox.min.js.map"></script>
  --%>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
img{
 width: 100%;
    height: auto;
}
 @media screen and (min-width: 768px){
          .modal-dialog {
              width:4000px;
              padding-top: 90px;
          }          
      }
      
      ul {         
          padding:0 0 0 0;
          margin:0 0 0 0;
      }
      ul li {     
          list-style:none;
          margin-bottom:25px;           
      }
      ul li img {
          cursor: pointer;
      }
 .next {
        float:right;
        text-align:right;
    }
      /*override modal for demo only*/
      .modal-dialog {
          max-width:700px;
          padding-top: 90px;
      }
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
.modal-dialog {}
.thumbnail {margin-bottom:6px;}

.carousel-control.left,.carousel-control.right{
  background-image:none;
  margin-top:10%;
  width:5%;
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
     
      <img src="/college-project/assets/img/logo.png" style="width:60px;height:60px;position: relative;
    top: -11px;"/>
    <b style="
    font-size: 50px; color:white"> KMBB <span style="
    font-size: small;
    -webkit-font-smoothing: subpixel-antialiased;
    font-family: cursive;
">Gallery</span></b>
    
    
    <span style="
   color: white;
    position: relative;
    font-size: 8px;
    left: -204px;
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
<center style="font-size: 37px;
    font-family: fantasy;"><b> <%=request.getParameter("my") %></b></center>
<br><br>
<ul class="row">
<c:forEach var="we" items="${picId}">
<li class="col-lg-2 col-md-2 col-sm-3 col-xs-4">
<img src="/college-project/image/getGalleryPhoto?id=${we.id}" height="330px" width="450px" style="width:100%;cursor:pointer">
 </li>
 
 </c:forEach>
</ul>



<%-- old logic
<div class="container">



 <% int c=0; %>
 <table class="table table-bordered">
<center style="font-size: 37px;
    font-family: fantasy;"><b> <%=request.getParameter("my") %></b></center>
<tbody>

 <c:forEach var="we" items="${picId}">

<%c++; %>

<%
if(c  == 1 || c  == 8 || c  == 15 || c  == 22 || c == 29 || c  == 36 ){
%><tr>
<%} %>

<td >



<img src="/college-project/image/getGalleryPhoto?id=${we.id}" height="330px" width="450px" style="width:100%;cursor:pointer" class="img-fluid">


<br>
</td>

<%
if(c%7 == 0 ){
%></tr>
<%} %>



 </c:forEach>
 
 
 </tbody>
 </table>
 </div>
 
 
       

--%>

</div>

<br>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">         
          <div class="modal-body">                
          </div>
        </div>
      </div>
    </div>
    
</body>
</html>
