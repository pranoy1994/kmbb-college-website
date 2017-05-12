<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.Calendar" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

 <script src="/college-project/assets/js/jquery-1.10.2.js"></script>
    <!--  Core Bootstrap Script -->
    <script src="/college-project/assets/js/bootstrap.js"></script>
    <!--  Flexslider Scripts --> 
         <script src="/college-project/assets/js/jquery.flexslider.js"></script>
     <!--  Scrolling Reveal Script -->
    <script src="/college-project/assets/js/scrollReveal.js"></script>
    <!--  Scroll Scripts --> 
    <script src="/college-project/assets/js/jquery.easing.min.js"></script>
    <!--  Custom Scripts --> 
         <script src="/college-project/assets/js/custom.js"></script>
         
         
         
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="stylesheet" href="/college-project/assets/css/bootstrap.min.css">
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    <link rel="stylesheet" href="/college-project/assets/css/w3.css">
    <title>KMBB-Engineering College Bhubaneswar|Provides best Placements</title>
    <link rel="shortcut icon" href="/college-project/assets/img/logo.png" type="image/png">
    
    <!-- FONT AWESOME CSS -->
<link href="/college-project/assets/css/font-awesome.min.css" rel="stylesheet" />
     <!-- FLEXSLIDER CSS -->
<link href="/college-project/assets/css/flexslider.css" rel="stylesheet" />
    <!-- CUSTOM STYLE CSS -->
    <link href="/college-project/assets/css/style.css" rel="stylesheet" />    
  <!-- Google	Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css' />
	<style type="text/css">
	
	.carousel-inner img {
    width: 100%;
    margin: auto;
    min-height: 50%;
}

.carousel-inner > .item > a > img, .carousel-inner > .item > img, .img-responsive, .thumbnail a > img, .thumbnail > img {
    display: block;
    max-width: 100%;

}

h1::after {
    content: none;
    }
    
 .set-row-pad {
    padding-top: 30px;
    padding-left: 4px;
    padding-bottom: 50px;
}
   

#content {
  float: left ;
  width: 40% ;
  
}
#navbar {
  float: right;
  width: 60%;
  
  
}

body {
padding:0em;
    background: #e5e5e5;
    font: 13px/1.4 open sans;
    }
  .vertical-line{
  border-left: thick solid #1041CD;
  width: 1px;
  }
  #another{
    background-color: #000;
    color: #fff;
}
#menu {
   
    min-height: 90px;
}

.w3-modal {
    z-index: 3;
    display: none;
    padding-top: 100px;
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
}



.col-item{
box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
    border: 1px solid #ededed;
    background: #FFF;
    margin-bottom: 25px;
    position: relative;


}
.subject-box .photo a.box-image {
    width: 100%;
    height: 100px;
    display: block;
    font-size: 80px;
    line-height: 100px;
    color: #fff;
    filter: alpha(opacity=100);
    filter: alpha(opacity=100);
    -moz-opacity: 1;
    opacity: 1;
}

.col-item .info {
    padding: 10px;
    border-radius: 0 0 5px 5px;
    margin-top: 1px;
}
.subject-box .photo {
    background-image: url(../assets/img/bg_sub-header.png);
    background-color: #00a8ff;
    width: 100%;
    text-align: center;
    overflow: hidden;
    filter: alpha(opacity=50);
    filter: alpha(opacity=50);
    -moz-opacity: .50;
    opacity: .5;
}

.cat_row {
    background: #f8f8f8;
    padding: 7px 7px 5px 7px;
    font-size: 12px;
    font-weight: 600;
}



.button {
    background-color: #4f5fc7; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}

.logo-custom {
    max-height: 59px;
}

#features-sec{
background: url(/college-project/assets/img/pageBG2.jpg) no-repeat center center;
    padding-top: 10px;
    padding-bottom: 60px;
    
    padding: 0;
    -webkit-background-size: cover;
    background-size: cover;
   
    background-attachment: fixed;
}

.row {
    margin-right: 0px;
    margin-left: 0px;
}

#course-sec{
background: url(/college-project/assets/img/pageBKG.png) no-repeat center center;
    padding-top: 10px;
    padding-bottom: 60px;
    
    padding: 0;
    -webkit-background-size: cover;
    background-size: cover;
   
    background-attachment: fixed;
}
.logo-text {
    margin: -70px 70px 90px;
    font-size: 49px;
    color: white;
    position: absolute;
    margin-top: 1px;
}

.logo-text span {
    font-size: 5px;
    position: absolute;
    margin-top: -13px;
    right: 9px;
   
}

#right{
position: relative;
    top: 200px;
    right: 15px;
}
#left{
position: relative;
    top: 200px;
    left: 15px;
}
.carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      min-height:200px;
  }

  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }

#contact-sec {
    padding-top: 10px;
    padding-bottom: 60px;
    padding: 0;
    -webkit-background-size: cover;
    background-size: cover;
    color: #fff;
    background-attachment: fixed;
    background: url(/college-project/assets/img/wdwdwq.jpg) no-repeat center center;
     -webkit-background-size: cover;
    background-size: cover;
   
    background-attachment: fixed;
}

@media (max-width: 1044px){
.navbar-collapse {
    width: auto;
    border-top: 0;
    -webkit-box-shadow: none;
    box-shadow: none;
}
}


	</style>
	
	
	<style>
               .button1:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}
.button2:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}

               
               </style>  
</head>
<body style="margin-top: 70px;" >
   
 <div class="navbar navbar-inverse navbar-fixed-top " id="menu">
  <center><div><div style="font-size:9px" id="clockbox"></div></div></center>
        
            <div class="navbar-header">
           
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index">
                <img class="logo-custom" src="/college-project/assets/img/logo.png" alt="" style="width:50px;height:50px;" />
                </a> 
                <a href="/college-project/work/index"><p class= "logo-text">
                KMBB<br>
                
                <span >College of Engineering and Technology</span>
                </p>
                </a>
               
            </div>
            <script type="text/javascript">
tday=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday");
tmonth=new Array("January","February","March","April","May","June","July","August","September","October","November","December");

function GetClock(){
var d=new Date();
var nday=d.getDay(),nmonth=d.getMonth(),ndate=d.getDate(),nyear=d.getYear();
if(nyear<1000) nyear+=1900;
var nhour=d.getHours(),nmin=d.getMinutes(),nsec=d.getSeconds(),ap;

if(nhour==0){ap=" AM";nhour=12;}
else if(nhour<12){ap=" AM";}
else if(nhour==12){ap=" PM";}
else if(nhour>12){ap=" PM";nhour-=12;}

if(nmin<=9) nmin="0"+nmin;
if(nsec<=9) nsec="0"+nsec;

document.getElementById('clockbox').innerHTML=""+tday[nday]+", "+tmonth[nmonth]+" "+ndate+", "+nyear+" "+nhour+":"+nmin+":"+nsec+ap+"";
}

window.onload=function(){
GetClock();
setInterval(GetClock,1000);
}
</script>
            <div class="navbar-collapse collapse move-me " style="margin-top: 0px;">
                
                <ul class="nav navbar-nav navbar-right" style="margin: 0px; margin-left: 10px; font-size: xx-small;">
                    <li ><a href="#home">HOME</a></li>
                     <li><a href="#features-sec">FEATURES</a></li>
                    <li><a href="#faculty-sec">BOARD MEMBERS</a></li>
                     <li><a href="#course-sec">DEPARTMENTS</a></li>
                     
                     <li>
           
  <a href="#" data-toggle="dropdown">FACILITIES
  <span class="caret"></span></a>
  <ul class="dropdown-menu">
    <li><a data-toggle="modal" data-target="#uniq" href="#">Uniqueness</a></li>
    <li><a data-toggle="modal" data-target="#life" href="#">Life Beyond Class Room</a></li>
    <li><a data-toggle="modal" data-target="#ped" href="#">Pedagogy</a></li>
      <li><a data-toggle="modal" data-target="#lib" href="#">Library</a></li>
        <li><a data-toggle="modal" data-target="#hos" href="#">Hostel Facility</a></li>
  </ul>

                     
                     </li>
                 
                     
                     
                     
                     
                     
                     
                     
                     
                     <li>
                     <a href="#"  data-toggle="dropdown">ADMISSIONS
  <span class="caret"></span></a>
  <ul class="dropdown-menu">
  <%--  <li><a href="#">Admission Office</a></li> --%>
    <li><a data-toggle="modal" data-target="#eli">Eligibility</a></li>
    <li><a data-toggle="modal" data-target="#crs">Course Fees</a></li>
     </ul>                
                     </li>
                     <li><a href="gallery" target="_blank">GALLERY</a></li>
                 <li>    <a href="#" data-toggle="dropdown">EVENTS
  <span class="caret"></span></a>
  <ul class="dropdown-menu">
    <li><a data-toggle="modal" data-target="#sw" href="#">Seminar/Workshops</a></li>
    <li><a data-toggle="modal" data-target="#ch" href="#">Cultural Heritage</a></li>
    <li><a data-toggle="modal" data-target="#sg" href="#">Sports and Games</a></li>
      <li><a data-toggle="modal" data-target="#af" href="#">Annual Function</a></li>
        <li><a data-toggle="modal" data-target="#so" href="#">Social Outreach</a></li>
  </ul>
</li>
               <li><a href="#another">LOGIN</a></li>
                     <li><a href="#contact-sec">CONTACT</a></li>      
                </ul>
            </div>
                   </div>   
  
    <div id="uniq" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Uniqueness</h4>
      </div>
      <div class="modal-body">
        <p>Important Features
        </p>
        <ul class="w3-ul w3-small">
 <li>Highly qualified and committed faculty and project based pedagogy.</li>
<li>Regular visit of faculty from reputed institutions like IITs, NITs etc.</li>
<li>Regular seminars / symposia on current issues.</li>
<li>100% placement support through integrated personality development and grooming for employability.</li>
<li>State of Art Infrastructure.</li>
<li>Complete Wi-Fi coverage of campus.</li>
<li>Well-stocked modern library with digital library facility and audio/video collection access.</li>
<li>Strong links with industry both inside and outside of the country.</li>
<li>Regular visit of the faculties to the hostel for personalised teaching.</li>
<li>Tailor made course to bridge the industry and academia gap to increase employability.</li>
<li>The tuition fees waiver scheme for the students who will score more than 8.0 CGPA.</li>
 
</ul>
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


<div id="life" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Life Beyond Class Room</h4>
      </div>
      <div class="modal-body">
        <p>Extra-curricular activities form an important part of the grooming of the students at KMBB College of Engineering and Technology. In order to produce well-rounded technology leaders of the future the college places importance on participation in activities outside the classroom and provide incentive for the same. Besides the regular sports, games, annual day competitions and College Festival related activities, the following options exist for students to participate and develop their personality and leadership ability.</p>
      <h4>NSS</h4>
      <p>National service scheme is a program of the ministry of youth affairs and sports which provides students an oppurtunity to undertake social developement and engage with the community in a meaningful way.The NSS volunteers of KMBB college of engineering and technology as part of the BPUT,undertake many constructive activities such as blood donation,tree plantation,village adoptation etc.under the leadership of the NSS officer.</p>
      <h4>SPIC MACAY</h4>
      <p>The college has a chapter of the society for promotion of Indian classical music and culture,which organizes various activities to promtote culture and heritage among the students.The chapter organises regular events of classical music and arts.</p>
      <h4>Association for india's Development(AID, <a href="http://aidindia.org" target="_blank">www.aidindia.org</a>)</h4>
      <p>AID is a USA based students organisation,which helps undertake socially constructive developement activities.AID India's Odisha chapter is active on KMBB campus in creating a sense of social commitment among students and also give them oppurtunities to engage with the local community through use of appropriate technology.</p>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<div id="ped" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Pedagogy</h4>
      </div>
      <div class="modal-body">
        <p>The pedagogy at KMBB College of Engineering &Technology revolves around the objective of making a complete engineer out of the young student who enters its portals. This is achieved by exposing students to the exciting world of 'hands-on learning by doing' in the well equipped labs and workshops of the college. Where ever possible a real life project is used to facilitate learning as well as make the effort that much more enjoyable where the teacher and students become partners in exploring new ideas. Class room learning will be regularly supplemented by seminars, guest lectures and special courses delivered in distance mode or on-line.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<div id="lib" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Library</h4>
      </div>
      <div class="modal-body">
      
       
       
        <p><br>Library will not only stock the required titles and volumes as per AICTE requirement, it will be built around the revolutionising power of the ever growing vastness of the Internet and the world-wide web. Using best possible hardware, network and internet connectivity, students will be exposed early to the world of technology enabled learning.</p>
      <table style="width: 100%;padding:5px"><tr><th>Name</th><th>Authors</th></tr>
  <br>
    <h4> Our Book Repository</h4><br>
      <c:forEach var="b" items="${bk}">
      <tr><td>${b.name}</td><td>${b.authors}</td></tr>
           
      
      
      </c:forEach>
      </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>

<div id="hos" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Hostel Facility</h4>
      </div>
      <div class="modal-body">
      <img src="http://prmceam.ac.in/wp-content/uploads/2015/09/library.jpg" style="height:277px; width:100%"/>
        <p><br>The college strongly believes in completely residential campus to be established at the earliest. Currently most of the students are provided with off-campus hostel facility in Khurda Town and Bhubaneswar. The College is committed to build hostels for both boys and girls in the campus before the start of the new Academic session.</p>
        </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>



   <div id="eli" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Eligibility Criteria</h4>
      </div>
      <div class="modal-body">
       
        <img src="http://kmbb.in/images/top-logo.jpg"><br>
       <b style="font-size:16px">Admission to 1st Year Degree courses in Engineering </b><br>
<ul><li>
Passed or appearing in 2016,</li>
<li><b>10+2 examination of CHSE, Orissa/12 th of CBSE/12th of ICSE</b>
with Physical & Mathematics as compulsory subjects along With one of the subjects from Chemistry / Biotechnology / Biology / Information Technology / Geology / Statistic.</li>
<li>
 The candidate should have Passed individual subject and must have obtained at least 45% marks (40% in case of candidate belonging to SC/ST category) in the above subjects taken together. &
<b>
JEE Mains rank</b></li></ul><br>
<b style="font-size:16px">
Admission to Lateral Entry </b>
(For admission into 2nd year Degree courses in Engineering)
<ul>
<li>
Passed or appearing in 2016, in three year diploma examination (two Year in case of Lateral entry Diploma) in Engineering from State Council of Technical Education and Training (SCTE&VT), Odisha or from an AICTE approve Institute / from a recognize University as defined by UGC with at least 45% marks(40% in case of candidate belonging to SC/ST category) in appropriate branch of Engineering / Technology and 
<b>
OJEE rank</b></li></ul>
<b>ELIGIBILITY CRITERIA FOR SAMBAD-AMA ODISHA SCHOLARSHIP FOR THREE YEARS B.Tech. (Lateral entry)DEGREE</b>

Passed or appearing in 2016, for the Bachelor's Degree examination of three years duration in Science from any University of Odisha or from a recognized University as defined by UGC, with at least 45% marks(40% in case of candidate belonging to SC/ST category) and must have passed XII standard with Mathematics as a subject.
        
        

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    
    
    <div id="sw" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Seminar/Workshops</h4>
      </div>
      <div class="modal-body">
        <p><b>KMBB College of Engineering and Technology</b> has lined up a series of workshops and seminars to acquaint its students with the nuances of developments in technology and for interface with achievers in the field.</p>
      <p><b>Robotics</b> was the topic of the workshop organized on 15.03.2016 under the aegis of the Research and Development cell of KMBB College of Engineering and Technology in collaboration with IIT, Madras. Er. Ayush Kumar of IIT, Madras delivered the keynote address. A thread bare analysis on the latest developments in Robotics was made by Er. Sumeet Saran from IIT, Madras. Dr. Dhanadakanta Mishra, Director (Academics), Dr. Aswini Kumar Mohanty, Principal,Prof. Debitosh Acharya, Asst. Director, Research & Development and Dr. Bichitrananda Patra, HOD, Comp. Science of KMBB College made valuable contributions to make the workshop lively. Director, Administration Prof. Saroj Kumar Panda exhorted the students to organize such workshops regularly.</p>
      <p><i><b>16 of the participating students were selected to take part in the National Level workshop on Robotics, to be organized in IIT, Madras KMBB College earned the unique destination of being the only Engineering College of Odisha to send delegates to Madras</b></i></p>
      <p><b>JAVA- its application in Social Media</b> was the topic of the Workshop organized on 16.10.2015 in KMBB College of Engineering and Technology. Er.Trilochan Tarai, Chief of 'Java Race' delivered the key-note address. Experts on the subject answered several questions put forth by students and members of staff of the college. It was a fruitful exercise in learning new developments in Java Technology.</p>
      <p><b>KMBB has been recognized as "JAVA SOFTWARE CENTRE OF EXCELLENCE"</b></p>
      <p>Prof. Dr. Dhanadakanta Mishra, Director(Academics) launched a New Book- JAVA CORE CONCEPT AND APPLICATION by Er. T. Tarai on this occasion.

Director (Academics) Dr. Dhanadakanta Mishra and Director (Administration) Prof. Saroj Kumar Panda expressed happiness on this rare achievement and pledged support to more such workshops in future.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>



<div id="ch" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Cultural Heritage</h4>
      </div>
      <div class="modal-body">
        <p><b>SPICMACAY</b>, an All India Cultural Movement has tied-up with top 10 colleges of Odisha. KMBB College of Engineering and Technology is privileged to be one of them to popularize Indian Classical Music and Culture among our students. SPICMACAY helped organize performances in the college on four different occasions during this session.</p>
      <br>
      <ul class="w3-ul w3-small">
  <li>On 04.08.2015, Kuchhipudi Dance was performed by Sri V.V.N Chalapathi Rao.</li>
  <li>A Sambalpuri Folk Dance programme was held on 12.02.2016 by the artists of Sambalpur Kala Parishad.</li>
  <li> Pt. Tarun Bhattacharya played the Santoor accompanied by Mr.Jyotirmaya Choudhury on Tabala on the 27th of Feb. 2016.</li>
<li>On 07.04.2016, Pt. Debasish Bhattacharya, an eminent Sarod Maestro of the country, demonstrated Indian Classical music on the Sarod.</li>
</ul>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


<div id="sg" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Sports and Games</h4>
      </div>
      <div class="modal-body">
        <p><b>KMBB College of Engineering and Technology</b> organized various sporting events (Indoor & Outdoor) among its students. Kabbadi, Volley ball, Badminton, Chess and Carrom competitions were held among men and women students. Successful participants were awarded prizes and certificates on the Annual Sports Day.</p>
      <p><b>ANNUAL ATHLETIC MEET </b></p>
      <p>The Annual Athletic Meet of <b>KMBB College of Engineering and Technology</b> was held on the 30th of January 2016 in the College playground. Mr. Lalit Mohanty, District Sports Officer, Khordha declared the meet open. Students in large numbers participated in 17 events held. Sri Aditya Narayan Samal of 1st Yr. ECE and Miss Anindita Ghosal of 2nd Year CS&E were adjudged the best athletes among men and women respectively. Winners in different events received their prizes from Mr. Jitu Mohanty, Ex-Ranji Trophy player, who was the Chief Guest in the closing ceremony.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


<div id="af" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Annual Function</h4>
      </div>
      <div class="modal-body">
        <p>The Annual Function of K.M.B.B College of Engineering and Technology was held on the 26th and 27th of February 2016. Chairman Sri Soumya Ranjan Patnaik inaugurated the function, where Dr. Abhay Nayak, Registrar, NISER, Bhubaneswar was the Chief Guest and Er. Deepak Mallick, M.D. IDAX Consultancy, (a young entrepreneur of the state) was the Guest of Honour.</p>
      <p>Variety entertainment programmes were performed by K.M.B.B students on the first day of the function. James and his melody troupe entertained the students and the audience on the concluding day of the function.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


<div id="so" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Social Outreach</h4>
      </div>
      <div class="modal-body">
        <p>Dt. 13.04.2016: The day was 'MAHA BISHUBA SANKARANTI'. Students and members of staff of KMBB College of Engineering and Technology organized a free distribution of Drinking water and 'PANA' camp in the Hanuman Temple premises near CRP Square. The camp was inaugurated by the Chairman of SAMBAD- AMA ODISHA CHARITABLE TRUST, Sri Soumya Ranjan Patnaik and coordinated by Prof. P.K. Singh of the Mechanical Engineering Department. </p>
      <p><b>NO ONE WILL DIE FOR WANT OF BLOOD</b></p>
      <p>A blood donation camp was held in KMBB College of Engineering and Technology on 07.04.2016 with cooperation from SAMBAD –AMA ODISHA CHARITABLE TRUST. The camp was inaugurated by Prof. Saroj Kumar Panda, Director (Administration), Dr. Dhandakanta Mishra, Director (Academics) was the first donor, which encouraged the students to come forward in large numbers. 106 units of blood was collected, which was appreciated by the Chairman of SAMBAD –AMA ODISHA, Sri Soumya Ranjan Patnaik.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    
    
    
    
    
    
    
    <div id="crs" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Course Fees</h4>
      </div>
      <div class="modal-body">
       *Subject to change as per the rules laid down by Management of KMBB & AICTE
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
  <tbody><tr>
    <td colspan="2" align="center">
    <h4> 1stYear Fees Structure for the Session 2016-20</h4>    </td>
  </tr>
  <tr>
    <td align="center">
      <p><strong>TUITION  FEES</strong></p></td>
    <td align="center">Rs/- 
     
      
      <strong>53,000 </strong> </td>
  </tr>
  <tr>
    <td align="center">
      <p><strong>PREPLACEMENT</strong></p></td>
    <td align="center">Rs/-
     
      
     <strong>2,500</strong></td>
  </tr>
  <tr>
    <td align="center">
      <p><strong>BOOKS</strong></p></td>
    <td align="center">Rs/-
     
      
      <strong>2,000 </strong> </td>
  </tr>
  <tr>
    <td align="center">
      <p><strong>BPUT  REGISTRATION</strong></p></td>
    <td align="center">Rs/-
     
      
      <strong>5,000 </strong> </td>
  </tr>
  <tr>
    <td align="center">
      <p><strong>BLAZER  &amp; UNIFORM</strong></p></td>
    <td align="center">Rs/-
     
      
      <strong>3,500 </strong> </td>
  </tr>
  <tr>
    <td align="center">
      <p> <strong>BOARDER</strong> - <strong>HOSTELS    ACCOMODATION&amp; FOODING</strong></p></td>
    <td align="center">Rs/-
     
      
      <strong>49,000 </strong> </td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
    <td align="center">
      <p><span class="style1"><strong>TOTAL</strong>
          <strong>1,15,000 </strong>/-</span></p>
      </td>
  </tr>
</tbody></table>
       
        <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#999999" style="margin-top:30px;">
              <tbody><tr bordercolor="#CCCCCC">
                <td colspan="2" align="center">
                <h4>2ndYear to 4th Year Fees Structure for the Session 2016-20   </h4>    </td>
              </tr>
              <tr>
                <td align="center" bordercolor="#CCCCCC">
                  <p><strong>TUITION  FEES</strong></p></td>
                <td align="center">Rs/- 
                  
                  <strong>53,000 </strong> </td>
              </tr>
              <tr>
                <td align="center" bordercolor="#CCCCCC">
                  <p><strong>PREPLACEMENT</strong></p></td>
                <td align="center">Rs/-
                  
                 <strong>2,500</strong></td>
              </tr>
              <tr>
                <td align="center" bordercolor="#CCCCCC">
                  <p><strong>BOOKS, SEMINARS AND   STUDENT ACTIVITIES</strong></p></td>
                <td align="center">Rs/-
                  
                  <strong>10,500 </strong> </td>
              </tr>
              
              <tr>
                <td align="center" bordercolor="#CCCCCC">
                  <p><strong> BOARDER -HOSTELS      ACCOMODATION&amp; FOODING </strong>+</p></td>
                <td align="center">Rs/-
                  
                  <strong>49,000 </strong> </td>
              </tr>
              <tr>
                <td align="center" bordercolor="#CCCCCC">&nbsp;</td>
                <td align="center">
                  <p><span class="style1"><strong>TOTAL-</strong> 
                      <strong>1,15,000 </strong>/-</span></p>
                  </td>
              </tr>
            </tbody></table>
*Rs 1,500 extra for BPUT registration per semester from 2nd Year
       
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
    
    
    
    
    
    
    
    
      <!--NAVBAR SECTION END-->
     
     <div class="home-sec" id="home">
    <c:set var="i" value="${0}" />
     <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
   
    
    <c:forEach var="homePics" items="${homeScreenPictures}">
      <li data-target="#myCarousel" data-slide-to="${i}" ></li>
      <c:set var="i" value="${i + 1}" />
     
      </c:forEach>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
     <c:set var="i" value="${0}" />
      
      <c:forEach var="homePics" items="${homeScreenPictures}">
     <c:choose>
     <c:when test="${ i eq 0 }">
      <div class="item active">
        <img alt="image" src="/college-project/image/getHomeScreenImage?id=${homePics.id }" style="display: block;
  max-width:100%;
  max-height:580px;
  width: auto;
  height: auto;" />
            <c:set var="i" value="${ i + 1 }" />
            <div class="carousel-caption">
          <h3 style="font-size: 50px;"><b>${homePics.caption}</b></h3>
          
        </div> 
      </div>
      </c:when>
      <c:otherwise>
       <div class="item">
        <img alt="image" src="/college-project/image/getHomeScreenImage?id=${homePics.id }" style="display: block;
  max-width:100%;
  max-height:580px;
  width: auto;
  height: auto;" />
            <div class="carousel-caption">
         <h3 style="font-size: 50px;"><b>${homePics.caption}</b></h3>
          
        </div> 
      </div>
      </c:otherwise>
      </c:choose>
</c:forEach>
     
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span id="left" class="glyphicon" aria-hidden="true">
     <!--    <img src="/college-project/assets/img/left.png">-->
      </span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span id="right" class="glyphicon" aria-hidden="true">
     <!--  <img src="/college-project/assets/img/right.png"> --> 
      </span>
      <span class="sr-only">Next</span>
    </a>
</div>
</div><script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<%--
 <script>
           
           $(document).ready(function(){


        	   var c=1;
        	   $.getJSON( 'https://newsapi.org/v1/articles?source=the-times-of-india&sortBy=top&apiKey=272aff2b2610497897b580497e92f7a4',function(result){    
        		   $.each(result.articles,function(){
        			   if(c != 4)
        				   {c++;
        			$('#news').append('<table><tr><td><a target="_blank" href="'+this['url']+'"><img src='+this['urlToImage']+' height=80px width= 140px/></a></td><td style="padding:16px;"><a target="_blank" href="'+this['url']+'"><p>'+this['title']+'</p></a></td></tr></table><hr>');
        				   }
        			   else
        				   return false;
        		   
        		   });
        		   
        		   
        	   });
              
               
           
       });
           
           </script>
             
              --%>
            
       <!--HOME SECTION END-->   
    <div  class="tag-line" >
         <div class="container">
           <div class="row" >
           <div class="col-lg-4  col-md-4 col-sm-4">
           <h2 data-scroll-reveal="enter from the bottom after 0.1s" >
       
        <i class="fa fa-circle-o-notch"></i>NOTICE
         <i class="fa fa-circle-o-notch"></i> </h2> 
          <div class="col-lg-6 col-md-6 col-sm-6 " data-scroll-reveal="enter from the bottom after 0.4s" >
                
               
                 
   <marquee scrollamount="3" scrolldelay="100" width="200" height="200" direction="up" behavior="scroll" loop="10000" onmouseover="stop();" onmouseout="start();" style="font-size: 15px;">
   
   <c:forEach var="listNotifications" items="${notification}">
   
   ${listNotifications.date}<br>
  <a href="" data-toggle="modal" data-target="#list${listNotifications.id}"> <p style="color:black;"><b>${listNotifications.notifications}</b></p></a>
  

  
   <hr>
    </c:forEach>
   </marquee>
  
     <c:forEach var="listNotifications" items="${notification}">
     <div id="list${listNotifications.id}" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">${listNotifications.notifications}</h4>
      </div>
      <div class="modal-body">
      <p>${listNotifications.date}</p>
    <div style="white-space: pre-line;    background-color: white;
    font-family: sans-serif;
    font-size: 15px;border: navajowhite;">  ${listNotifications.body}</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
  
   </c:forEach>
   
   
  
                
                
                
           </div>
           </div>
           
               <div class="col-lg-8  col-md-8 col-sm-8">
               
        <h2 data-scroll-reveal="enter from the bottom after 0.1s" >
       
        <i class="fa fa-circle-o-notch"></i>About Us
         <i class="fa fa-circle-o-notch"></i> </h2>
         <p style="font-size: 15px;">
         Established by Sambad-Ama Odisha Charitable Trust, the KMBB College of Engineering and Technology which is one of the top 10 BPUT engineering colleges in Odisha is professionally managed by a highly experienced Board of Governors. With its commitment to all-round excellence, its students will be exposed to a high quality academic experience. Away from the crowded city life the Institute is located by the side of NH-5 at Daleiput near Khurda in a scenic natural environment. Built on a patch of 40 acres of land the campus is being developed to house hostels for boys and girls, academic staff quarters, auditorium, gymnasium besides academic and administrative buildings. The college is approved by AICTE under Ministry of HRD, Govt of India and affiliated to Biju Patnaik University of Technology (BPUT), Rourkela.
           </p>        <h2 data-scroll-reveal="enter from the bottom after 0.1s" >
                    <i class="fa fa-circle-o-notch"></i>Objective of Sambad - Aama Odisha
         <i class="fa fa-circle-o-notch"></i> </h2><p style="font-size: 15px;">
         'NO ONE SHOULD DIE IN ODISHA FOR WANT OF BLOOD' is the slogan of Aama Odisha which has touched the hearts of millions of Odisha. Today Sambad-Aama Odisha Charitable Trust is making another commitment "NO MERITORIOUS STUDENT SHOULD BE DEPRIVED OF HIGHER STUDIES IN ENGINEERING FOR WANT OF MONEY".  Since its inception, it has been working for social and educational upliftment of the poor and downtrodden. It has been encouraging meritorious students to pursue higher studies through its various scholarships schemes over the years. The Trust has launched a grand scholarship scheme for B.Tech students in KMBB College of Engineering &Technology from 2014.
                  </p> </div>
               </div>
             </div>
        
    </div>
    <!--HOME SECTION TAG LINE END-->   
         <div id="features-sec" >
             <div class="row text-center">
                 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
                     <h1 data-scroll-reveal="enter from the bottom after 0.2s"  class="header-line">FEATURE LIST </h1>
                     <p data-scroll-reveal="enter from the bottom after 0.3s" >
                     
                         </p>
                 </div>

             </div>
             <!--/.HEADER LINE END-->


  

  <div id="id04" class="w3-modal w3-animate-opacity">
    <div class="w3-modal-content w3-card-8">
      <header class="w3-container w3-teal"> 
        <span onclick="document.getElementById('id04').style.display='none'" 
        class="w3-button w3-large w3-display-topright">&times;</span>
        <h2>Quality education at KMBB CET</h2>
      </header>
      <div class="w3-container">
        <p>KMBB CET provides the best quality in education, below are the some features</p>
        <ul><li><b>Seminar Classes</b>
        <p>Seminar classes are helpful for improving the motivational skill, presentation skill and confidence level of the student.</p>
        </li>
        <li>
        <b>labs/Workshop</b><p>
        
        Machine labs provide the real-world information of industries to the students, which are helpful for the students for improving the technical skills of the student.
        
        </p>
        
        </li>
        <li>
        <b>Study Tour:</b>
        <p>
        Monthly study tours are provided by the college for the students to so that the students could get some industrial
        exposure, giving them the information of the technologies which are in use in real-world industry.
        
        </p>
        
        
        </li>
<li>
<b>Extracurricular Activities:</b>
<p>Extracurricular Activities are very much essential for the student which are provide by the college 
which increases the positive self development of the student.
</p>

</li>
<li>
<b>Computer Labs:</b>
<p>Computer labs are provided for the students for diffrent specialization purpose like programming, 3D design etc.</p>
</li>
<li>
<b>Workshops:</b>
<p>These are the technological workshops like Robotics, Ethical hacking and etc, which are held in the college, lot of students 
from our college as well as from the other college participate in this event.
</p>
</li>

        </ul>
      </div>
      <footer class="w3-container w3-teal">
        
      </footer>
    </div>
  </div>

          <div class="row" >
             
                 <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.4s">
                     <div class="about-div">
                   <!--   <i class="fa fa-paper-plane-o fa-4x icon-round-border" ></i>-->
                   <img src="/college-project/assets/img/quality_education.png" height="100px" width="100px" >
                   <h3 >Quality Education</h3>
                 <hr />
                       <hr />
                   <p >
                      KMBB CET provides the best quality in education, below are the some features.
                   </p>
               <a onclick="document.getElementById('id04').style.display='block'" class="btn btn-info btn-set"  >FEATURES</a>
                </div>
                   </div>
                   <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.5s">
                     <div class="about-div">
                    <!--  <i class="fa fa-bolt fa-4x icon-round-border" ></i> -->
                    <img src="/college-project/assets/img/scholarship.png" height="100px" width="100px" >
                   <h3 >SCHOLARSHIPS</h3>
                 <hr />
                       <hr />
                   <p >
                       KMBB CET provides attractive scholarships to meritorious students, click below to know more. 
                       
                   </p>
               <a onclick="document.getElementById('id02').style.display='block'" class="btn btn-info btn-set"  >SCHEMES</a>
                              
<div id="id02" class="col-lg-12  col-md-12 col-sm-12 w3-modal">
 <div class="w3-modal-content w3-card-4 w3-animate-zoom">
  <header class="w3-container w3-blue"> 
   <span onclick="document.getElementById('id02').style.display='none'" 
   class="w3-button w3-blue w3-xlarge w3-display-topright">&times;</span>
   <h2>Eligibility Criteria - Aamo Odisha Technical Scholarship</h2>
  </header>

  <div class="w3-bar w3-border-bottom">
 
 
<button class="tablink w3-bar-item w3-button" onclick="openCity(event, 'Regular')">Regular</button>
<button class="tablink w3-bar-item w3-button" onclick="openCity(event, 'Lateral')">Lateral</button>
  </div>
 
  <div id="Regular" class="w3-container city">
  <h5>ELIGIBILITY CRITERIA FOR SAMBAD-AMA ODISHA SCHOLARSHIP FOR FOUR YEARS B.Tech. DEGREE </h5>
  <p style="color:red;">SCHOLARSHIP AMMOUNT: Rs 2,00, 000/-(two lakhs rupees )</p>
  <p><u>For Students of General category :</u></p>
  <p>Minimum 70% Marks in Aggregate in Matriculation or equivalent Board examination &minimum 50% in Physics, Math & Chemistry/Statistics/Computer science/Biology in +2 or equivalent examination.</p>
  <p><u>For Students SC/ST category :</u></p>
  <p>Minimum 60% Marks in Aggregate in Matriculation or equivalent Board examination &minimum 45% in Physics, Math & Chemistry /Statistics/Computer science/Biology in +2 or equivalent examination.</p>
  </div>
  
  <div id="Lateral" class="w3-container city">
  
  <h5>ELIGIBILITY CRITERIA FOR SAMBAD-AMA ODISHA SCHOLARSHIP FOR THREE YEARS B.Tech. (Lateral entry)DEGREE</h5>
  <p style="color:red;">SCHOLARSHIP AMMOUNT: Rs 1, 50, 000/-(one lakh fifty thousand rupees)</p>
  <p><u>For Students of General category :</u></p>
  <p>Minimum 70% Marks in Aggregate in Matriculation or equivalent Board examination &minimum 60% marks in Diploma or 50% in +3 examination with Physics, Math & Chemistry.</p>
  <p><u>For Students SC/ST category :</u></p>
  <p>Minimum 60% Marks in Aggregate in Matriculation or equivalent Board examination &minimum 55% marks in Diploma or 45% in +3 examination with Physics, Math & Chemistry.</p>
  
  
  </div>
  
  
  

  
  <div class="w3-container w3-light-grey w3-padding">
   <button class="w3-btn w3-right w3-white w3-border" 
   onclick="document.getElementById('id02').style.display='none'">Close</button>
  </div>
 </div>
</div>
               
               
               
                </div>
                   </div>
                 <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.6s">
                     <div class="about-div">
                     
                     <img src="/college-project/assets/img/placement.png" height="100px" width="100px" >
                   <h3 >PLACEMENTS </h3>
                 <hr />
                       <hr />
                   <p >
                       KMBB CET provides best placements to students in reputed companies in all over India, click below to see our recruitment drive history. 
                       
                   </p>
               <a  onclick="document.getElementById('id01').style.display='block'" class="btn btn-info btn-set"  >PLACEMENT DRIVES</a>
               
               
<div id="id01" class="w3-modal">
 <div class="w3-modal-content w3-card-4 w3-animate-zoom">
  <header class="w3-container w3-blue"> 
   <span onclick="document.getElementById('id01').style.display='none'" 
   class="w3-button w3-blue w3-xlarge w3-display-topright">&times;</span>
   <h2>Placement Drives at KMBB</h2>
  </header>

  <div class="w3-bar w3-border-bottom">
  <c:set var="now" value="<%=new java.util.Date()%>" />
  <fmt:formatDate pattern="yyyy" value="${now}" var="yr" />
 <c:forEach var="i" begin="2013" end="${yr}">
<button class="tablink w3-bar-item w3-button" onclick="openCity(event, '${i}')">${i}</button>
</c:forEach> 
   
  </div>
  <c:forEach var="i" begin="2013" end="${yr}">
  <div id="${i}" class="w3-container city">
  <c:forEach var="p" items="${placement}">
  
  <c:set var="rt" value="${p.year}"/>
  
  <c:if test="${i eq rt}">
  <h3><img src="/college-project/image/getPlacementLogo?id=${p.id}" height="60px" width="60px"/>
  ${p.companyName}</h3>
 
  <c:forTokens items=" ${p.studentsPlaced}" delims="," var="name">
  <ul>
  <li>${name}</li>
  </ul>
  </c:forTokens>
  </c:if>
  
  </c:forEach>
  </div>
  </c:forEach>
  
  

  
  <div class="w3-container w3-light-grey w3-padding">
   <button class="w3-btn w3-right w3-white w3-border" 
   onclick="document.getElementById('id01').style.display='none'">Close</button>
  </div>
 </div>
</div>



<script>
document.getElementsByClassName("tablink")[0].click();

function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].classList.remove("w3-light-grey");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.classList.add("w3-light-grey");
}
</script>
 
               
               
               
               
               
               
               
                </div>
                   </div>
                 
                 
               </div>
             </div>
   <!-- FEATURES SECTION END-->
    <div id="faculty-sec" >
    <div class="container set-pad">
             <div class="row text-center">
                 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
                     <h1 data-scroll-reveal="enter from the bottom after 0.1s" class="header-line">OUR BOARD MEMBERS </h1>
                     <p data-scroll-reveal="enter from the bottom after 0.3s">
                     
                         </p>
                 </div>

             </div>
             <!--/.HEADER LINE END-->

           <div class="row" >
           
               
                 <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.4s">
                     <div class="faculty-div">
                     <img src="/college-project/assets/img/faculty/chairman.jpg"  class="img-rounded" height= "200px" width= "180px" />
                   <h3 >Sri Soumya Ranjan Patnaik</h3>
                 <hr />
                         <h4>Chairman<br /></h4>
                   
                       <button type= "button" class="btn btn-info btn-set" data-toggle= "modal" data-target= "#myModal" >Message</button>
                    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="color:black;">Chairman's Message</h4>
        </div>
        <div class="modal-body">
          <p style="color:black;">KMBB College of Engineering and Technology has been set up in memory of my late parents to establish a center of excellence in technical education. While the students will be expected to put in hard work, academic integrity will be the cornerstone of all teaching-learning transactions.The institute believes that with the involvement of all stakeholders, students will not only excel academically, but also develop an integrated personality with excellent communication skills, that would ensure quality placement for all. 

With the SAMBAD - Ama Odisha Trust providing strong support, it is my strong belief that the KMBB College of Engineering & Technology like 'Sambad' will be the No.1 Engineering College of the State. This year the fourth batch of KMBB students are going to graduate with flying colours overcoming many challenges. The students have achieved significant success in their placement efforts in a very difficult year. We look forward to build on these successes and go forward with renewed vigour to achieve our goal. I welcome all new students and assure their parents of a bright future for their wards under the care of the KMBB team.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
                        <a href="http://www.soumyapatnaik.in/" class="btn btn-info btn-set" target="_blank" >Website</a>
                       
                <button type="button" class="btn btn-info btn-set" data-toggle="modal" data-target="#myModal23">Video</button>

<!-- Modal -->
<div id="myModal23" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body">
       	
         <iframe width="100%" height="260" src="https://www.youtube.com/embed/OBTWjJtsCas" frameborder="0" allowfullscreen></iframe>
            
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
                
                  
                </div>
                   </div>
                 <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.5s">
                     <div class="faculty-div">
                     
                      <img src="/college-project/assets/img/DSC_0158.jpg"  class="img-rounded" height="200px" width="180px" style="-moz-transform: scaleX(-1);
        -o-transform: scaleX(-1);
        -webkit-transform: scaleX(-1);
        transform: scaleX(-1);
        filter: FlipH;
        -ms-filter: 'FlipH';"/>
                   <h3 >Sri Saroj Kumar Panda</h3>
                 <hr />
                         <h4>Director Administrative</h4>
                         
                         
                          <button type="button" class="btn btn-info btn-set" data-toggle="modal" data-target="#myModal2389">Message</button>
                           <button type="button" class="btn btn-info btn-set" data-toggle="modal" data-target="#pro">Profile</button>
                          

<!-- Modal -->
                  
                         
                         
                         
                               <!-- Modal -->
<div id="pmsg" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color:black;">Principal's Message</h4>
      </div>
      <div class="modal-body" style="color:black;">
        <p>
        I welcome you to KMBB College of Engineering and Technology. KMBB may be only a 4 year old institution, but it has dared to take on a task that even well established institutions have not attempted. The focus of the institution is squarely on academics and student-faculty interaction in and outside the class rooms. To that end the college has some of the best laboratory facilities to provide the students with quality hand-on experience.</p>
        <p>

At the same time the recently installed Smart Class can make the classroom lectures a very different kind of multi-media enriched experience. What we are trying to do is to break the unhealthy trend of monotonous lectures and create a new pedagogy that would have projects and hands-on learning at its center. We expect that the students will enjoy the process of learning just as much as the teachers who will be an equal partner in this journey of discovery. We believe and are confident that if our strategy of a new pedagogy is successful, not only we will create exceptional professionals of high calibre, but also create excellent placement opportunities. 
</p><p>
The planned fully residential campus spread on a 40 acre area will provide ample opportunity for the students and faculty to have a round-the-clock academic experience that is at the heart of the drive for excellence that would set KMBB College apart from its peers. Like the character of 'Rancho' in the very thought provoking film ' 3 Idiots' students at KMBB can be expected to be groomed to have a passionate approach to learning for the love of it rather than the fear of examinations! The vision of KMBB will be one where 'the only punishment a student will ever be subjected to is to simply disallow him from the enticement of the daily campus activities.
        
        </p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


                       <!-- Modal -->
<div id="pprfl" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color:black;">Principal's Profile</h4>
      </div>
      <div class="modal-body" style="color:black;">
       Dr. Dhanada Kanta Mishra is an academic administrator of proven reputation. A graduate of NIT, Trichy in civil engineering, he obtained his Masters degree in Structural Engineering from University of Oklahoma at Norman and Ph. D. in Civil Engineering Materials from University of Michigan at Ann Arbor. Subsequently he worked for the R&D division of Associated Cement Companies Ltd. and for Rocla Technology in Sydney Australia. More recently he has worked for KIIT University as its first Dean, R&D and Principal of JITM in Paralakhemundi. He is also founder chairman of Human Development Foundation. Besides publishing widely in national and international literature, Dr. Mishra has guided several students for their projects. While he was himself a NTS scholarship holder and awarded with the Chi-epsilon honours at University of Oklahoma, the student team under his guidance won the Mondialogo international award instituted by UNESCO and Daimler-chrysler two years in running for outstanding appropriate technology innovations. He is also involved in a number of socio-development activities in particular promoting use of technology for social development.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
                   
                </div>
                
                   </div>
               <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.6s">
                     <div class="faculty-div">
                     <img src="/college-project/assets/img/o.jpg"  class="img-rounded" height="200px" width="180px"/>
                   <h3 >Dr. Dhanada Kanta Mishra</h3>
                 <hr />
                         <h4>Principal/Director Academics </h4>
                   
                      <button type= "button" class="btn btn-info btn-set" data-toggle= "modal" data-target= "#pmsg" >Message</button>
                     
                   <button type= "button" class="btn btn-info btn-set" data-toggle= "modal" data-target= "#pprfl" >Profile</button>
               
                         
                   <p >
                      
                       
                   </p>
                </div>
                   </div>
                 
               </div>
             </div>
        </div>
    <!-- FACULTY SECTION END-->
    
    
      <div id="course-sec">
   
             <div class="row text-center">
                 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
                     <h1 data-scroll-reveal="enter from the bottom after 0.1s" class="header-line">DEPARTMENTS</h1>
                   
                     <p data-scroll-reveal="enter from the bottom after 0.3s" align="left">
                    
                         </p>
                 </div>

             </div>
             <!--/.HEADER LINE END-->

           <div class="row set-row-pad" >
   
   
    <div class="col-lg-12  col-md-12 col-sm-12 ">
    
    <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
    <div class="col-item subject-box">
                                <!--<span class="ribbon_course"></span>-->
                                <div class="photo" style="background-color: rgb(233, 30, 99);">
                                    <a href="/subject/153/basic-manufacturing-process?utm_source=homepage&amp;utm_medium=web&amp;utm_campaign=featured-subjects" class="box-image">ME</a>
                                </div>
                                
                                <div class="info">
                                    <div class="row">
                                        <div class="course_info col-md-12 col-sm-12 text-center" style="width:100%;">
                                            <a href="/subject/153/basic-manufacturing-process?utm_source=homepage&amp;utm_medium=web&amp;utm_campaign=featured-subjects">Mechanical Engineering</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
    <div class="col-item subject-box">
                                <!--<span class="ribbon_course"></span>-->
                                <div class="photo" style="background-color: rgb(233, 30, 99);">
                                    <a href="/subject/153/basic-manufacturing-process?utm_source=homepage&amp;utm_medium=web&amp;utm_campaign=featured-subjects" class="box-image">ME</a>
                                </div>
                                
                                <div class="info">
                                    <div class="row">
                                        <div class="course_info col-md-12 col-sm-12 text-center" style="width:100%;">
                                            <a href="/subject/153/basic-manufacturing-process?utm_source=homepage&amp;utm_medium=web&amp;utm_campaign=featured-subjects">Mechanical Engineering</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
    <div class="col-item subject-box">
                                <!--<span class="ribbon_course"></span>-->
                                <div class="photo" style="background-color: rgb(233, 30, 99);">
                                    <a href="/subject/153/basic-manufacturing-process?utm_source=homepage&amp;utm_medium=web&amp;utm_campaign=featured-subjects" class="box-image">ME</a>
                                </div>
                                
                                <div class="info">
                                    <div class="row">
                                        <div class="course_info col-md-12 col-sm-12 text-center" style="width:100%;">
                                            <a href="/subject/153/basic-manufacturing-process?utm_source=homepage&amp;utm_medium=web&amp;utm_campaign=featured-subjects">Mechanical Engineering</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
    <div class="col-item subject-box">
                                <!--<span class="ribbon_course"></span>-->
                                <div class="photo" style="background-color: rgb(233, 30, 99);">
                                    <a href="/subject/153/basic-manufacturing-process?utm_source=homepage&amp;utm_medium=web&amp;utm_campaign=featured-subjects" class="box-image">ME</a>
                                </div>
                                
                                <div class="info">
                                    <div class="row">
                                        <div class="course_info col-md-12 col-sm-12 text-center" style="width:100%;">
                                            <a href="/subject/153/basic-manufacturing-process?utm_source=homepage&amp;utm_medium=web&amp;utm_campaign=featured-subjects">Mechanical Engineering</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                             <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                             <div class="col-item subject-box">
                                <!--<span class="ribbon_course"></span>-->
                                <div class="photo" style="background-color: rgb(233, 30, 99);">
                                    <a href="/subject/153/basic-manufacturing-process?utm_source=homepage&amp;utm_medium=web&amp;utm_campaign=featured-subjects" class="box-image">ME</a>
                                </div>
                                
                                <div class="info">
                                    <div class="row">
                                        <div class="course_info col-md-12 col-sm-12 text-center" style="width:100%;">
                                            <a href="/subject/153/basic-manufacturing-process?utm_source=homepage&amp;utm_medium=web&amp;utm_campaign=featured-subjects">Mechanical Engineering</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            </div>
                             <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                             <div class="col-item subject-box">
                                <!--<span class="ribbon_course"></span>-->
                                <div class="photo" style="background-color: rgb(233, 30, 99);">
                                    <a href="/subject/153/basic-manufacturing-process?utm_source=homepage&amp;utm_medium=web&amp;utm_campaign=featured-subjects" class="box-image">ME</a>
                                </div>
                                
                                <div class="info">
                                    <div class="row">
                                        <div class="course_info col-md-12 col-sm-12 text-center" style="width:100%;">
                                            <a href="/subject/153/basic-manufacturing-process?utm_source=homepage&amp;utm_medium=web&amp;utm_campaign=featured-subjects">Mechanical Engineering</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                         
                            
</div>
    
    
    
    </div>
   
   
          
         
          
              
             
                 
                 
               </div>
             </div>
             
      <!-- COURSES SECTION END-->
      <div id="another">
       <div class="container set-pad">
             <div class="row text-center">
                 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
                     <h1 data-scroll-reveal="enter from the bottom after 0.1s" class="header-line" style="color:white">LOGIN </h1>
                     <p data-scroll-reveal="enter from the bottom after 0.3s">
                     
                         </p>
                 </div>

             </div>
             <!--/.HEADER LINE END-->

           
          
                 <div class="col-lg-4  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.4s">
                     <div class="faculty-div">
                 <%--    <img src="assets/img/faculty/1.jpg"  class="img-rounded" /> --%>
                   <h3 >What you are? </h3>
                
  
  
 <select id="drp" class="form-control">
 <option value="sel">Select</option>
    <option value="a">Administrator</option>
    <option value="s">Student</option>
    <option value="f">Faculty</option>
    <option value="pd">Placement Department</option>
     <option value="ed">Exam Department</option>
      <option value="ld">Library Department</option>
       <option value="ad">Accounts Department</option>
 </select><br>
<p id="doc" style="color:red;display:none"><b>Please select the type of login</b></p>
                  <script>
     
           
           $(document).ready(function(){
        		$('#submit').click(function(){
        			
        			console.log("dffgbgb");
        			var drp = $('#drp').val();
        			
        			console.log(drp);
        			
        		var reg = $('#exampleInputEmail1').val();
        			var pass = $('#exampleInputPassword1').val();
        		
        			if(drp == 'sel'){
        				$('#doc').show();
        			}
        			
        			if(drp == 's'){
        			$.post("svalidate",{snum:reg, spass:pass},function(data){
        					if(data == 't'){
        						
        						window.location.href="/college-project/work/studentPage?nme="+reg;
        						
        					}
        					
        					else{
        						$('#msg').show();
        						
        					console.log("dffgbgbgbfgbfgbfgbfgbfgbgfbfgbfgbgfb");}
        			})}   
        			
        			if(drp == 'a'){
        		console.log(drp);
        		$.post("loginAdmin",{username:reg, password:pass},function(data){
					if(data == 't'){
						
						window.location.href="/college-project/work/adminPage";
						
					}
					
					else{
						$('#msg').show();
						
					console.log("dffgbgbgbfgbfgbfgbfgbfgbgfbfgbfgbgfb");}
			})
        		
        		
        		
        		
        			}
        			if(drp == 'f'){
        				
        				
        				$.post("facCheck",{username:reg, password:pass},function(data){
        					if(data == 't'){
        						
        						window.location.href="/college-project/work/facultyPage?my="+reg;
        						
        					}
        					
        					else{
        						$('#msg').show();
        						
        					console.log("dffgbgbgbfgbfgbfgbfgbfgbgfbfgbfgbgfb");}
        			})
                		
        				
        				
        			}
        			

        			if(drp == 'pd'){
        				
        				$.post("placeCheck",{username:reg, password:pass},function(data){
        					if(data == 't'){
        						
        						window.location.href="/college-project/work/placementPage?my="+reg;
        						
        					}
        					
        					else{
        						$('#msg').show();
        						
        					console.log("dffgbgbgbfgbfgbfgbfgbfgbgfbfgbfgbgfb");}
        			})
                		
        				
        				
        			}

        			if(drp == 'ed'){
        				
        				$.post("examCheck",{username:reg, password:pass},function(data){
        					if(data == 't'){
        						
        						window.location.href="/college-project/work/examPage?my="+reg;
        						
        					}
        					
        					else{
        						$('#msg').show();
        						
        					console.log("dffgbgbgbfgbfgbfgbfgbfgbgfbfgbfgbgfb");}
        			})
                		
        				
        				
        			}
        			

        			if(drp == 'ld'){
        				
        				$.post("libCheck",{username:reg, password:pass},function(data){
        					if(data == 't'){
        						
        						window.location.href="/college-project/work/library?my="+reg;
        						
        					}
        					
        					else{
        						$('#msg').show();
        						
        					console.log("dffgbgbgbfgbfgbfgbfgbfgbgfbfgbfgbgfb");}
        			})
                		
        				
        				
        			}if(drp == 'ad'){
        				
        				$.post("accCheck",{username:reg, password:pass},function(data){
        					if(data == 't'){
        						
        						window.location.href="/college-project/work/account?my="+reg;
        						
        					}
        					
        					else{
        						$('#msg').show();
        						
        					console.log("dffgbgbgbfgbfgbfgbfgbfgbgfbfgbfgbgfb");}
        			})
                		
        				
        				
        			}
        			
        			
        			
        			
        			
        		
        		});    });
           
           
           
           
           
           
           
              
           </script>
                 
                 
                 
                         
                         
                </div>
                   </div>
                 <div class="col-lg-5  col-md-5 col-sm-5" data-scroll-reveal="enter from the bottom after 0.5s">
                     <div class="faculty-div">
                 <!--     <img src="assets/img/faculty/2.jpg"  class="img-rounded" /> -->
                   <h3 >Enter your credentials</h3>
                 <hr />
                       <div class="form-group">
                         <p id="msg" style="color:red;display:none"><b>INVALID CRENDENTIALS</b></p>
                        
    <label for="exampleInputEmail1">UserID or Username</label>
    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter userID or username" required="required" onkeydown = "if (event.keyCode == 13)
                        document.getElementById('submit').click()" onmousedown="$('#msg').hide()"/>
    
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="required" onkeydown = "if (event.keyCode == 13)
                        document.getElementById('submit').click()" onmousedown="$('#msg').hide()"/>
  </div>
  <button type="submit" id="submit" class="btn btn-primary">Submit</button>
                </div>
                   </div>
              
               </div>
             </div>
             
    <div id="contact-sec"   >
           <div class="overlay">
 <div class="container set-pad">
      <div class="row text-center">
                 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
                     <h1 data-scroll-reveal="enter from the bottom after 0.1s" class="header-line" >CONTACT US  </h1>
                    
                 </div>

             </div>
             <!--/.HEADER LINE END-->
             <script>
             
             function thisFunction(){
            	 
             
            	if($('#name').val().length > 0 && $('#email').val().length > 0 && $('#message').val().length > 0){
            		$("#loaderIcon").show();
            	 jQuery.ajax({
            	url:"saveMsg",
            	data:{name:$('#name').val(),email:$('#email').val(),message:$('#message').val()},
            	type:"POST",
            	success:function(data){
            		$("#s").show();
            	$("#reqbut").hide();
            	$("#tick").show();
            	$("#loaderIcon").hide();
            	$('#xyz').hide();
            	$('#xyz2').hide();
            	document.getElementById("btnbtn").disabled = true;
            	
            	},
            	error:function(data){}
         	 
            	 });	
            	 
            	}
            		
            		else
            		{
            			
            			$("#loaderIcon").hide();
            			$('#xyz2').hide();
            		$('#xyz').show();
            		
            		}
            	 
             }
             
             </script>
             
           <div class="row set-row-pad"  data-scroll-reveal="enter from the bottom after 0.5s" >
           
               
                 <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
                    
                        <div class="form-group">
                            <input type="text" class="form-control " id="name" required="required" placeholder="Your Name" />
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control " id="email" required="required"  placeholder="Your Email" />
                        </div>
                        <div class="form-group">
                            <textarea name="message" id="message" required="required" class="form-control" style="min-height: 150px;" placeholder="Message"></textarea>
                        </div>
                        <div class="form-group">
                            <button id="btnbtn" type="submit" onclick="thisFunction()" class="btn btn-info btn-block btn-lg"><img src="http://downloadicons.net/sites/default/files/tick-icon-91397.png" id="tick" style="display:none;" height="20px" width="20px" /><img src="https://www.oenovaults.com/images/loading.gif" id="loaderIcon" style="display:none;" height="20px" width="20px" /><p id="s" style="display:none">THANK YOU</p><p id="reqbut" style="display:show;">SUBMIT</p></button>
                        </div>
<p id="xyz" style="display:none;margin-left: 308px;">Please fill this form</p>
<p id="xyz2" style="display:none;margin-left: 308px;">Email not valid</p>
                    
                </div>

                   
     
              
              
                
               </div>
                </div>
          </div> 
       </div>
     <div class="container">
             <div class="row set-row-pad"  >
    <div class="col-lg-4 col-md-4 col-sm-4   col-lg-offset-1 col-md-offset-1 col-sm-offset-1 " data-scroll-reveal="enter from the bottom after 0.4s">

                    <h2 ><strong> Location <span class="glyphicon glyphicon-map-marker"></span></strong></h2>
        <hr />
                    <div >
                        <h4>City Office:</h4> A/62, Old Sambad Office,
Near CRP Square, Bhubaneswar, Odisha-751003

                        <h4>Campus:</h4>Daleiput, Khurda, Odisha-752056
                        <h4><strong>Call:</strong> 0674-6007111/6007444</h4>
                         <h4><strong>Mob:</strong> 9238046489, 9238046494</h4>
                        <h4><strong>Email: </strong>admission@kmbb.in</h4>
                    </div>


                </div>
                 <div class="col-lg-4 col-md-4 col-sm-4   col-lg-offset-1 col-md-offset-1 col-sm-offset-1" data-scroll-reveal="enter from the bottom after 0.4s">

                    <h2 ><strong>Testimonials <span class="glyphicon glyphicon-pencil"></span></strong></h2>
        <hr />
                   <marquee scrollamount="5" scrolldelay="50" width="200" height="200" direction="up" behavior="scroll" loop="100" onmouseover="stop();" onmouseout="start();">
   
   <c:forEach var="t" items="${tst}">
   <c:set var="o" value="Faculty"/>
   <c:choose><c:when test="${t.year eq o }">
   <b>${t.studentName}</b>&nbsp &nbsp${t.year}&nbsp<br>
   ${t.body}
   </c:when>
   <c:otherwise>
   
   <b>${t.studentName}</b>&nbsp &nbsp${t.year}&nbsp batch<br>
    ${t.body}
   </c:otherwise>
  </c:choose>

  
   <hr>
    </c:forEach>
   </marquee>
                   
                   
                   
                    </div>
                    
                    


                </div>
                 </div>
                 <hr>
                 <div>
                <center> <h2>Reach Us</h2></center>
                 <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3745.899533266378!2d85.58783861491793!3d20.13823858648743!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3a1853267add5045%3A0x87a30ba15638e81c!2sKMBB+College+Of+Engineering+and+Technology!5e0!3m2!1sen!2sin!4v1489996259256" width="100%" height="200" frameborder="0" style="border:0" allowfullscreen></iframe>
                 </div>
                 
                 
     <!-- CONTACT SECTION END-->
    <div id="footer">
    <a href="https://twitter.com/kmbbcollege?lang=en" target="_blank"> <i class="fa fa-twitter" style="color:white;"></i></a>&nbsp<a href="https://plus.google.com/104751504341022270160" target="_blank"> <i class="fa fa-google" style="color:white;"></i></a><a href="https://www.facebook.com/KMBB2009/" target="_blank" >&nbsp&nbsp<i class="fa fa-facebook" style="color:white;"></i></a> &nbsp&nbsp|&nbsp&nbsp &copy  2017 KMBB Engineering College | All Rights Reserved |  <a href="dev" style="color: #fff" target="_blank">Developers</a>
    </div>
     <!-- FOOTER SECTION END-->
   
    <!--  Jquery Core Script -->
   
         
         <div id="pro" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Profile</h4>
      </div>
      <div class="modal-body">
       	   **NOT AVAILABLE**
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<div id="myModal2389" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Message</h4>
      </div>
      <div class="modal-body">
       	  **NOT AVAILABLE**
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
       
         
         
         
</body>
</html>
