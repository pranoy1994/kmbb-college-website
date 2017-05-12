package com.collegewebsite.springhibernate.controller;


import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.collegewebsite.springhibernate.dao.DataAccessObject;
import com.collegewebsite.springhibernate.entity.AccountsDepartment;
import com.collegewebsite.springhibernate.entity.Administrator;
import com.collegewebsite.springhibernate.entity.Bills;
import com.collegewebsite.springhibernate.entity.BoysHostel;
import com.collegewebsite.springhibernate.entity.Departments;
import com.collegewebsite.springhibernate.entity.ExamDepartment;
import com.collegewebsite.springhibernate.entity.ExamNames;
import com.collegewebsite.springhibernate.entity.FacultyList;
import com.collegewebsite.springhibernate.entity.Gallery;
import com.collegewebsite.springhibernate.entity.GalleryAlbumName;
import com.collegewebsite.springhibernate.entity.GirlsHostel;
import com.collegewebsite.springhibernate.entity.HomeScreenPictures;
import com.collegewebsite.springhibernate.entity.LibraryBooks;
import com.collegewebsite.springhibernate.entity.LibraryDeparement;
import com.collegewebsite.springhibernate.entity.Message;
import com.collegewebsite.springhibernate.entity.Notifications;
import com.collegewebsite.springhibernate.entity.Placement;
import com.collegewebsite.springhibernate.entity.PlacementDepartment;
import com.collegewebsite.springhibernate.entity.StudentMarks;
import com.collegewebsite.springhibernate.entity.Testimonials;
import com.collegewebsite.springhibernate.entity.UserStudent;

@Controller
@RequestMapping("/work")
public class MyController {

	DateFormat formatter;
	
		  
	
	@Autowired
	private DataAccessObject dao;
	
	@GetMapping("/index")
	public String index(Model theModel){
		
		List<LibraryBooks> lib =  dao.showBooks();
		theModel.addAttribute("bk", lib);
		
		
		List<Notifications> notificationList = dao.showNotifications();
		theModel.addAttribute("notification",notificationList);
		
		//UserStudent userStudent=new UserStudent();
		//theModel.addAttribute("student", userStudent);
		
		Administrator admin = new Administrator();
		theModel.addAttribute("administrator",admin);
		
		List<HomeScreenPictures> picList = dao.showHomeScreenPictures();
		theModel.addAttribute("homeScreenPictures",picList);
		
		List<Testimonials> test = dao.showTestimonial();
		theModel.addAttribute("tst",test);
		
		List<Placement> place = dao.getPlacement();
		theModel.addAttribute("placement",place);
		
		return "indexnew";
	}
	@GetMapping("/adminPage")
	public String adminPage(Model theModel){
		
	//	UserStudent userStudent=new UserStudent();
	//	theModel.addAttribute("student", userStudent);
		
		Notifications notice = new Notifications();
		theModel.addAttribute("notice", notice);
		theModel.addAttribute("noticeAdd", notice);
		
		List<Notifications> theList = dao.showNotifications();
		theModel.addAttribute("note",theList);
		
		FacultyList facultyList = new FacultyList();
		theModel.addAttribute("faculty",facultyList);
		
		HomeScreenPictures pic = new HomeScreenPictures();
		theModel.addAttribute("addHomeScreenImages",pic);
		
		List<HomeScreenPictures> picList = dao.showHomeScreenPictures();
		theModel.addAttribute("homeScreenPictures",picList);
		
		GirlsHostel girl = new GirlsHostel();
		theModel.addAttribute("girlshostel",girl);
		
		BoysHostel boy = new BoysHostel();
		theModel.addAttribute("boyshostel",boy);
		
		List<GirlsHostel> girlsHostelList = dao.getGirlsHostelList();
		theModel.addAttribute("girlsHostelList",girlsHostelList);
		
	    List<BoysHostel> boysHostelList = dao.getBoysHostelList();
		theModel.addAttribute("boysHostelList",boysHostelList);
		
		//List<UserStudent> studentList = dao.getFullStudentList();
		//theModel.addAttribute("studentList",studentList);
		
		List<Placement> place = dao.getPlacement();
		theModel.addAttribute("placement",place);
		
		List<Message> msg = dao.getMessage();
		theModel.addAttribute("msg",msg);
		
		List<Testimonials> test = dao.showTestimonial();
		theModel.addAttribute("tst",test);
		
		List glry = dao.getGalleryAlbumName();
		theModel.addAttribute("albumName",glry);
		
		List<PlacementDepartment> pd = dao.getPlacementDeptUsers();
   	    theModel.addAttribute("pd",pd);
   	    
   	    List<LibraryDeparement> ld = dao.getLibraryDeptUsers();
	    theModel.addAttribute("ld",ld);
	    
	    List<ExamDepartment> ed = dao.getExamDeptUsers();
	    theModel.addAttribute("ed",ed);
	    
	    List<AccountsDepartment> ad = dao.getAccDeptUsers();
	    theModel.addAttribute("ad",ad);
		
		return "admin";
	}
	
	@GetMapping("/searchStudent")
	@ResponseBody
	public String searchStudent(@RequestParam("d")String d){
		
		String name = dao.getStudent(d);
		return name;
	}	
	
	
	@GetMapping("/studentPage")
	public String studentPage(Model theModel, @RequestParam("nme")String registrationNumber, HttpSession session ){
		System.out.println("----------------------------jnniendiendieudnieudnied-------------------------------------");
		List<UserStudent> studentInfo = dao.getStudentInfo(registrationNumber);
		theModel.addAttribute("studentInfo",studentInfo);
		List<GirlsHostel> girlsHostelList = dao.getGirlsHostelList();
		theModel.addAttribute("girlsHostelList",girlsHostelList);
		
	    List<BoysHostel> boysHostelList = dao.getBoysHostelList();
		theModel.addAttribute("boysHostelList",boysHostelList);
		
		List Bill = dao.getStudentBillHistory(registrationNumber);
		theModel.addAttribute("bill",Bill);
		
		List stdMrk = dao.getMarksOfTheStudent(registrationNumber);
		theModel.addAttribute("marks",stdMrk);
		
		
		return "student-page";
		
		
	}
	
	@GetMapping("/saveBook")
	@ResponseBody
	public String saveBook(@RequestParam("name")String name,@RequestParam("authors")String authors){
		
		LibraryBooks lib = new LibraryBooks();
		lib.setName(name);
		lib.setAuthors(authors);
		dao.addALibBook(lib);
		
		return null;
	}
	@GetMapping("/books")
	public String books(Model theModel){
		
		List<LibraryBooks> theList = dao.getBooks();
		theModel.addAttribute("theBooks",theList);
		return "the-books";
	}
	@GetMapping("/deleteBook")
	public String deleteBook(@RequestParam("my")int id){
		
		dao.deleteBook(id);
		
		return "redirect:books";
	}
	
	@GetMapping("/editThisBook")
	public String editThisBook(@RequestParam("name")String name,@RequestParam("authors")String authors,@RequestParam("id")int id){
		LibraryBooks lib = new LibraryBooks();
		lib.setId(id);
		lib.setName(name);
		lib.setAuthors(authors);
		dao.addALibBook(lib);
		return "redirect:books";
	}
	@GetMapping("/facultyPage")
	public String facultyPage(Model theModel,@RequestParam("my") String username, HttpSession session){
		List theList = dao.getFaculty(username);
		theModel.addAttribute("fac",theList);
		List<UserStudent> studentList = dao.getFullStudentList();
		theModel.addAttribute("studentList",studentList);
		List<FacultyList>  facultyList= dao.getFullFacList();
		theModel.addAttribute("faculty",facultyList);
		
		return "faculty-page";
	
	}
	
	
	@GetMapping("/placementPage")
	public String placementPage(Model theModel,@RequestParam("my") String username, HttpSession session){
		List theList = dao.getPlacementPage(username);
		theModel.addAttribute("pla",theList);
		
		List<UserStudent> studentList = dao.getFullStudentList();
		theModel.addAttribute("studentList",studentList);
		
		List<Placement> place = dao.getPlacement();
		theModel.addAttribute("placement",place);
		return "placement-page";
	
	}
	
	
	
	@PostMapping("/placeCheck")
	@ResponseBody
	public String placePage(HttpSession session, @RequestParam("username") String username,@RequestParam("password") String password, Model theModel){
		String auth = dao.loginPlace(username, password);
		if(auth == "invalid")
		return "wer";
		else{
			session.setAttribute("pla",username);
			session.setMaxInactiveInterval(2*60*60);
			return "t";
		}
	}
	
	
	@GetMapping("/deleteExamName")
	public String deleteExamName(@RequestParam("my")String name,@RequestParam("u")String my){
		dao.deleteExamName(name);
		return "redirect:examPage?my="+my;
	}
	@PostMapping("/studentMarks")
	@ResponseBody
	public String studentMarks(@RequestParam("marks")String marks,@RequestParam("sub")String sub,
			@RequestParam("reg")String reg,
			@RequestParam("examName")String examName){
		System.out.println(examName);
		ExamNames name = new ExamNames();
		name.setName(examName);
		dao.saveExamName(name);
		/////////////////////;//////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
		ArrayList<String> marksList = new ArrayList<String>();
		ArrayList<String> subList = new ArrayList<String>();
		ArrayList<String> regList = new ArrayList<String>();
		reg=reg.replace("x,", "");
		sub=sub.replace("9,", "");
		marks=marks.replace("undefined,", "");
		System.out.println(marks);
		System.out.println(sub);
		System.out.println(reg);
		char c=' ';String str="";
		StudentMarks st = new StudentMarks();
		for(int i=0;i<=marks.length()-1;i++){
			c=marks.charAt(i);
			if(c != ','){
				str=str+c;
				
			}
			
			else{
				
				if(str != "")
				marksList.add(str);
			str="";
			}
		}
		System.out.println(marksList);
		///------------------
		for(int i=0;i<=sub.length()-1;i++){
			c=sub.charAt(i);
			if(c != ','){
				str=str+c;
				
			}
			else{
				if(str != "")
				subList.add(str);
			str="";
			}
			
			
		}
		System.out.println(subList);
		for(int i=0;i<=reg.length()-1;i++){
			c=reg.charAt(i);
			if(c != ','){
				str=str+c;
				
			}
			else{
				
				regList.add(str);
			str="";
			}
		
		}
		//markList
		System.out.println(regList);
		HashMap<String,String>  map = new HashMap<String,String>();
		for(int i=0;i<regList.size();i++){
			
			String a = regList.get(i);
			for(int k=0;k<subList.size();k++){
				String b = subList.get(k);
			
				map.put(b,marksList.get(0));
				marksList.remove(0);
			
		}
			System.out.println("------------------------------------------------------------------------------");
			System.out.println(a);
			System.out.println(map);
			st.setExamName(examName);
			st.setRegNo(a);
			st.setSubMarks(map.toString());
			dao.addMarkOfStudent(st);
			
		}
		
		return null;
	}
	
	@GetMapping("/examPage")
	public String examPage(Model theModel,@RequestParam("my") String username, HttpSession session){
		List theList = dao.getExamPage(username);
		theModel.addAttribute("pla",theList);
		
		List stdMrk = dao.getMarks();
		theModel.addAttribute("marks",stdMrk);
		
		
		
		List<UserStudent> studentList = dao.getFullStudentList();
		theModel.addAttribute("studentList",studentList);
		
		//////////////////////////////////////////////////////////////////////////////////
		return "exam-page";
	}
	
	@PostMapping("/examCheck")
	@ResponseBody
	public String examCheck(HttpSession session, @RequestParam("username") String username,@RequestParam("password") String password, Model theModel){
		String auth = dao.loginExam(username, password);
		if(auth == "invalid")
		return "wer";
		else{
			session.setAttribute("exa",username);
			session.setMaxInactiveInterval(2*60*60);
			return "t";	
		}
	}
	@GetMapping("/library")
	public String library(Model theModel,@RequestParam("my") String username, HttpSession session){
		List theList = dao.getlibraryPage(username);
		theModel.addAttribute("pla",theList);
        return "lib-page";
	
	}
	
	@GetMapping("/account")
	public String account(Model theModel,@RequestParam("my") String username){
		List theList = dao.getAccPage(username);
		theModel.addAttribute("pla",theList);
		
		List<UserStudent> studentList = dao.getFullStudentList();
		theModel.addAttribute("studentList",studentList);
		
		List<Bills> bill = dao.getBills();
		theModel.addAttribute("bill",bill);
		return "acc-page";
	
	}
	@GetMapping("/saveTransaction")
	public String saveTransaction(@RequestParam("uname")String uname,@RequestParam("regNo")String regNo,@RequestParam("amt")String amt, @RequestParam("mode")String mode, @RequestParam("date")String date, @RequestParam("billno")String billno){
		
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Date date1 = new Date();
		
		System.out.println(amt);
		System.out.println(mode);
		System.out.println(date+" "+dateFormat.format(date1));
		System.out.println(billno);
		Bills theBill = new Bills();
		theBill.setRegNo(regNo);
		theBill.setAmount(amt);
		theBill.setMode(mode);
		theBill.setDateTime(date+" "+dateFormat.format(date1));
		theBill.setBillNo(billno);
		
		dao.saveBill(theBill);
		
		dao.updateStudentfees(regNo,amt);
		return "redirect:account?my="+uname;
	}
	
	@PostMapping("/accCheck")
	@ResponseBody
	public String accCheck(HttpSession session, @RequestParam("username") String username,@RequestParam("password") String password, Model theModel){
		String auth = dao.loginAcc(username, password);
		if(auth == "invalid")
		return "wer";
		else{
			session.setAttribute("acc",username);
			session.setMaxInactiveInterval(2*60*60);
			return "t";
			
		}
	}
	
	
	@PostMapping("/libCheck")
	@ResponseBody
	public String libCheck(HttpSession session, @RequestParam("username") String username,@RequestParam("password") String password, Model theModel){
		String auth = dao.loginLib(username, password);
		if(auth == "invalid")
		return "wer";
		else{
			session.setAttribute("lib",username);
			session.setMaxInactiveInterval(2*60*60);
			
			return "t";
			
		}
	}
	
	
	@PostMapping("/facCheck")
	@ResponseBody
	public String facultyPage(HttpSession session, @RequestParam("username") String username,@RequestParam("password") String password, Model theModel){
		String auth = dao.loginFaculty(username, password);
		if(auth == "invalid")
		return "wer";
		else{
			session.setAttribute("fac",username);
			session.setMaxInactiveInterval(2*60*60);
			return "t";
			
		}
	}
	
	@PostMapping("/svalidate")
	@ResponseBody
	public String svalidate(HttpSession session, @RequestParam("snum") String registrationNumber,@RequestParam("spass") String password){
		String auth = dao.loginStudent(registrationNumber, password);
		if(auth == "invalid")
		return "wer";
		else{
			session.setAttribute("reg", registrationNumber);
			return "t";}
	}
	@RequestMapping(value = "/loginAdmin",method = RequestMethod.POST)
	@ResponseBody
	public String loginAdmin(@RequestParam("username") String username,@RequestParam("password") String password, HttpSession session){
		String auth = dao.loginAdmin(username, password);
		
		if(auth == "invalid")
			
			return "wer";
		else{
		session.setAttribute("user",username);
		session.setAttribute("pass",password);
		session.setMaxInactiveInterval(2*60*60);
		

		
		return "t";
		}
		
}
	
	@GetMapping("/invalidateMe")
    public String invalidateMe(HttpSession session){
		if(session.getId() !=null)
		session.invalidate();
		
		return "redirect:index";
	}
	
	@RequestMapping(value = "/saveStudent", method = RequestMethod.POST)
	public String saveStudent(
			
			
			@RequestParam(value="registrationNumber")String registrationNumber,
			@RequestParam(value="hostelSelection")String hostelSelection,
			@RequestParam(value="gender")String gender,
			@RequestParam(value="password")String password,
			@RequestParam(value="admissionYear")int admissionYear,
			@RequestParam(value="branch")String branch,
			@RequestParam(value="lateral")String lateral,
			@RequestParam(value="totalFees")String totalFees,
			Model theModel
			) throws IOException, ParseException{
		UserStudent student = new UserStudent();
		int bedNo = dao.getHostelBedNo(gender,hostelSelection);
		int bed=0;
		if(!hostelSelection.equals("No")){
		
		ArrayList<String> al = dao.getVacantBeds(hostelSelection);
		if(al.size() > 1){
			int i,min=99999,c=0;
			for(i=1;i<al.size();i++){
				
				if(min > Integer.parseInt(al.get(i).trim())){
					min = Integer.parseInt(al.get(i).trim());
					c=i;
				}
				
			}
			al.remove(c);
			dao.saveBlankBed(al.toString(), hostelSelection);
			student.setHostelBedNo(min);
			
		}else{
			student.setHostelBedNo(bedNo+1);
		}
		}
		
		if(lateral.equals("Yes")){
			admissionYear = admissionYear-1;
		}
		student.setLateral(lateral);
		
		student.setHostel(hostelSelection);
		student.setRegistrationNumber(registrationNumber);
		student.setGender(gender);
		student.setPassword(password);
		student.setAdmissionYear(admissionYear);
		
		student.setBranch(branch);
		
		student.setTotalFees(Integer.parseInt(totalFees));
		dao.saveStudent(student);
		
		
		
		return "redirect:adminPage";
	}
	
	@GetMapping("/showStudent")
	public String showStudent(@RequestParam("id")String id, Model theModel){
		
		List<UserStudent> theList = dao.getSpecificStudent(id);
		theModel.addAttribute("lst",theList);
		
		return "search-student";
	}
	
	@GetMapping("/showStudentList")
	public String showStudentList(@RequestParam("year")String year,@RequestParam("branch") String branch,Model theModel){
		
	
		List<GirlsHostel> girlsHostelList = dao.getGirlsHostelList();
		theModel.addAttribute("girlsHostelList",girlsHostelList);
		
	List<BoysHostel> boysHostelList = dao.getBoysHostelList();
		theModel.addAttribute("boysHostelList",boysHostelList);
		List<UserStudent> studentList = dao.getStudentList(year,branch);
		
		theModel.addAttribute("studentList",studentList);
		
		
		return "student-list";
	}
	
	
	@RequestMapping(value = "/updateMyInfo", method = RequestMethod.POST)
	public String updateMyInfo(
			@RequestParam(value="fullName")String fullName,
			@RequestParam(value="dob")String dob,
			@RequestParam(value="mobContact")String mobContact,
			@RequestParam(value="email")String email,
			@RequestParam(value="reg")String reg,
			@RequestParam(value="guardianName")String guardianName,
			
			
			
			@RequestParam(value="id")int id,
			
			Model theModel
			) throws IOException, ParseException{

		String dte[] = new String[3];
		int i=0;
		for(String w:dob.split("-")){
			dte[i]=w;
			i++;
		}
		UserStudent student = new UserStudent();
		
		
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateOfBirth = dte[0]+"-"+dte[1]+"-"+dte[2];
		
		Date startDate = (Date)formatter.parse(dateOfBirth); 
	
		dao.updateStudentInfo(id,fullName,startDate,mobContact,email,guardianName);
		
		
		
		return "redirect:studentPage?nme="+reg;
	}
	
	
	
	@RequestMapping(value = "/updateStudent", method = RequestMethod.POST)
	public String updateStudent(
			@RequestParam(value="fullName")String fullName,
			@RequestParam(value="registrationNumber")String registrationNumber,
			@RequestParam(value="dob")String dob,
			@RequestParam(value="mobContact")String mobContact,
			@RequestParam(value="email")String email,
			@RequestParam(value="password")String password,
			@RequestParam(value="admissionYear")int admissionYear,
			@RequestParam(value="gender")String gender,
			@RequestParam(value="branch")String branch,
			@RequestParam(value="guardianName")String guardianName,
			@RequestParam(value="lateral")String lateral,
			@RequestParam(value="bodrel")String oldLateral,
			@RequestParam(value="hostel")String hostel,//-----
			@RequestParam(value="hostelBedNo")String hostelBedNo,//----
			@RequestParam(value="totalFees")int totalFees,
			@RequestParam(value="feesPaid")int feesPaid,
			@RequestParam(value="id")int id,
			@RequestParam(value="oldHostelName")String oldHostelName,
			@RequestParam(value="oldGender")String oldGender,
			Model theModel
			) throws IOException, ParseException{

		if(lateral.equals(oldLateral)){
			System.out.println("one one one one ");
			if(lateral.equals("Yes") && oldLateral.equals("Yes")){
				admissionYear = admissionYear -1;
			}
				
			
			
		}
		if(oldLateral.equals("Yes") && lateral.equals("No")){
			//admissionYear = admissionYear + 1;
			System.out.println("two two two two ");
		}
		if(oldLateral.equals("No") && lateral.equals("Yes")){
			admissionYear = admissionYear -1;
			System.out.println("three three three three ");
		}
		
		
		String dte[] = new String[3];
		int i=0;
		for(String w:dob.split("-")){
			dte[i]=w;
			i++;
		}
		int hstlbedNo=0;
		System.out.println(hostel+"   "+oldHostelName);
		System.out.println(!hostel.equals("No") +"   "+ !oldHostelName.equals("No"));
		
		
		if(!hostel.equals("No") && !oldHostelName.equals("No") && hostel.equals(oldHostelName)){
	//	dao.updateHostel(oldGender, oldHostelName);
	//	int bedNo = dao.getHostelBedNo(hostel,gender);
		//student.setHostelBedNo(bedNo+1);
	//	hstlbedNo = bedNo;
        
		}
		if(!hostel.equals("No") && !oldHostelName.equals("No") && !hostel.equals(oldHostelName)){
			dao.updateHostel(oldGender, oldHostelName);
			//int bedNo = dao.getHostelBedNo(hostel,gender);
			//student.setHostelBedNo(bedNo+1);
			
			
			
			int bedNo = dao.getBedNos(oldHostelName,oldGender);
			
				ArrayList<String> list = dao.getVacantBeds(oldHostelName);
				System.out.println("dwwdwdwdwdwdwdwd     "+list);
			    list.add(hostelBedNo);
			    System.out.println(list);
			    dao.saveBlankBed(list.toString(), oldHostelName);
			   // int bedNoo = dao.getHostelBedNo(oldHostelName,oldGender);
			
			bedNo = dao.getBedNos(hostel,gender);
			ArrayList<String> al = dao.getVacantBeds(hostel);
			if(al.size() > 1){
				int j,min=99999,c=0;
				for(j=1;j<al.size();j++){
					
					if(min > Integer.parseInt(al.get(j).trim())){
						min = Integer.parseInt(al.get(j).trim());
						c=j;
					}
					
				}
				al.remove(c);
				dao.saveBlankBed(al.toString(), hostel);
				//student.setHostelBedNo(min);
				hstlbedNo = min;
				dao.getHostelBedNo(gender, hostel);
				
			}else{
				//student.setHostelBedNo(bedNo+1);
				hstlbedNo = bedNo+1;
				dao.getHostelBedNo(gender, hostel);
			}
			
			
			
			
			
			
			
			
			
			
			
			
		}
		
		
		if(hostel.equals("No") && !oldHostelName.equals("No")){
			dao.updateHostel(oldGender, oldHostelName);

			int bedNo = dao.getBedNos(oldHostelName,oldGender);
			
				ArrayList<String> list = dao.getVacantBeds(oldHostelName);
				System.out.println("dwwdwdwdwdwdwdwd     "+list);
				//list.remove(" ");
			    list.add(hostelBedNo);
			    System.out.println(list);
			    dao.saveBlankBed(list.toString(), oldHostelName);
			   // int bedNoo = dao.getHostelBedNo(oldHostelName,oldGender);
			
			
			
			hstlbedNo=0;
			
		}
		if(!hostel.equals("No")  && oldHostelName.equals("No")){
			//int bedNo = dao.getHostelBedNo(hostel,gender);
			//student.setHostelBedNo(bedNo+1);
			
			int bedNo = dao.getBedNos(hostel,gender);
			ArrayList<String> al = dao.getVacantBeds(hostel);
			System.out.println(al.size());
			if(al.size()>1){
				int j,min=99999,c=0;
				for(j=1;j<al.size();j++){
					
					if(min > Integer.parseInt(al.get(j).trim())){
						min = Integer.parseInt(al.get(j).trim());
						c=j;
					}
					}
				al.remove(c);
				dao.saveBlankBed(al.toString(), hostel);
				//student.setHostelBedNo(min);
				hstlbedNo = min;
				dao.getHostelBedNo(gender, hostel);
				
			}else{
				//student.setHostelBedNo(bedNo+1);
				hstlbedNo = bedNo+1;
				dao.getHostelBedNo(gender, hostel);
			}
			
			
			
			
			
			
			//hstlbedNo=bedNo+1;
			
		}
		if(hostel.equals("No") && oldHostelName.equals("No")){
			
			//student.setHostelBedNo(0);
			hstlbedNo=0;
		}
		
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateOfBirth = dte[0]+"-"+dte[1]+"-"+dte[2];
		
		Date startDate = (Date)formatter.parse(dateOfBirth); 
	
		String h=hostel;int idd=id;String fn=fullName;String rn=registrationNumber;
		Date sd=startDate;String mc=mobContact;String e=email;String p=password;
		int ay=admissionYear;String g=gender;String b=branch;String gn=guardianName;
		int tf=totalFees;int fp=feesPaid;String l=lateral;
		dao.updateFullStudentInfo(idd,h,fn,rn,sd,mc,e,p,ay,g,b,gn,tf,fp,hstlbedNo,l);
		//student.setHostel(hostel);
		
		//student.setId(id);
		//student.setFullName(fullName);
		//student.setRegistrationNumber(registrationNumber);
		//student.setDob(startDate);
	//student.setMobContact(mobContact);
		//student.setEmail(email);
	//	student.setPassword(password);
		//student.setAdmissionYear(admissionYear);
		//student.setGender(gender);
		//student.setBranch(branch);
		//student.setGuardianName(guardianName);
		
		//student.setTotalFees(totalFees);
		//student.setFeesPaid(feesPaid);
		//student.setPicture(picture.getBytes());
		
		
		
		UserStudent userStudent=new UserStudent();
		theModel.addAttribute("student", userStudent);
		
		Administrator admin = new Administrator();
		theModel.addAttribute("administrator",admin);
		return "redirect:/work/showStudentList?year="+admissionYear+"&branch="+branch+"";
	}
	
	@GetMapping("/deleteStudent")
	public String deleteStudet(@RequestParam("my")int id,@RequestParam("year")int year,@RequestParam("branch")String branch,@RequestParam("hostel")String hostel ,
			@RequestParam("gender")String gender,@RequestParam("hstlNo")String no){
		
		
		if(!hostel.equals("No")){
				
				int bedNo = dao.getBedNos(hostel,gender);
				
					ArrayList<String> list = dao.getVacantBeds(hostel);
					System.out.println("dwwdwdwdwdwdwdwd     "+list);
				    list.add(no);
				    System.out.println(list);
				    dao.saveBlankBed(list.toString(), hostel);
				
			
			System.out.println("GEnnnnnnnnnnnnnnnnnn->>>>"+gender+"wdwdwdwdwdwdd   wdwd w wd wd "+hostel);
			
			dao.updateHostel(gender, hostel);
			
		}
		
		dao.deleteStudent(id);
		
		return "redirect:/work/showStudentList?year="+year+"&branch="+branch+"";
	}
	
	@PostMapping("/addNotice")
	public String addStudent(@ModelAttribute("notice")Notifications notice, Model theModel){
		
		dao.addNotice(notice);
	
	
		
		return "redirect:adminPage";
	}	
	@PostMapping("/deleteNotice")
	public String deleteStudet(@RequestParam("my")int id, Model theModel ){
		dao.deleteNotice(id);
		
		return "redirect:adminPage";
	}
	
	@PostMapping("/editNoitce")
	public String editNotice(@RequestParam("id")int id, @RequestParam("date")String dte,@RequestParam("notifications") String notifications, @RequestParam("body")String body , Model theModel ){
		
		Notifications notice = new Notifications();
		notice.setId(id);
		notice.setNotifications(notifications);
		notice.setBody(body);
		notice.setDate(dte);
		
		dao.addNotice(notice);
		
		
		return "redirect:adminPage";
	}
	@GetMapping("/facultyDetails")
	public String facultyDetails(@RequestParam("dept")String dept, Model theModel){
		
		List<FacultyList> facultyList = dao.getFacultyList(dept);
		
		theModel.addAttribute("facultylist",facultyList);
		
		return "faculty-list";
	}
	
	@PostMapping("/saveFaculty")
	public String saveFaculty(
			@RequestParam("name") String name,
			@RequestParam("department") String department,
			
			
			@RequestParam("username")String username,
			@RequestParam("password")String password,
			Model theModel
			)throws IOException, ParseException{
	FacultyList facultyList = new FacultyList();
		
		facultyList.setDepartment(department);
		
		facultyList.setName(name);
		
		facultyList.setUsername(username);
		facultyList.setPassword(password);
		dao.saveFaculty(facultyList);
	
	    
		return "redirect:adminPage";
	}
	
	@PostMapping("/addHomeScreenImages")
	public String addHomeScreenImages(@RequestParam("photos") MultipartFile photo,@RequestParam("caption") String caption,Model theModel)throws IOException, ParseException
	{
		
		HomeScreenPictures pic = new HomeScreenPictures();
		byte[] b = photo.getBytes();
		
		
		
		pic.setPhotos(b);
		pic.setCaption(caption);
		dao.saveHomeScreenPhotos(pic);

		return "redirect:adminPage";
	}
	
	@GetMapping("/deleteHomeScreenPictures")
	public String deleteHomeScreenPictures(@RequestParam("id")int id,Model theModel){
		
		dao.deleteHomeScreenPictures(id);
		
		
		
		return "redirect:adminPage";
	}
	
	
	@PostMapping("/editHostel")
	public String editHostel(@RequestParam("gen")String g, @RequestParam("id")int id,@RequestParam("oldHostelName")String old,@RequestParam("hostelName")String n, @RequestParam("noOfBeds")int no, @RequestParam("noOfOccupiedBeds")int noc, @RequestParam("address")String add){
		System.out.println(g);
		System.out.println(old);
		System.out.println(n);
		if(g.equals("grl")){
			GirlsHostel grl = new GirlsHostel();
			grl.setId(id);
			grl.setHostelName(n);
			grl.setNoOfBeds(no);
			grl.setNoOfOccupiedBeds(noc);
			grl.setAddress(add);
			dao.addGirlsHostel(grl);
			dao.editedHostelName(old, n);
		}
		if(g.equals("boy")){
			BoysHostel grl = new BoysHostel();
			grl.setId(id);
			grl.setHostelName(n);
			grl.setNoOfBeds(no);
			grl.setNoOfOccupiedBeds(noc);
			grl.setAddress(add);
			dao.addBoysHostel(grl);
			dao.editedHostelName(old, n);
		}	
		return "redirect:adminPage";
	}
	
	@PostMapping("/addGirlsHostel")
	public String addGirlsHostel(@ModelAttribute("girlshostel")GirlsHostel hostel,Model theModel){
		
		dao.addGirlsHostel(hostel);
		dao.addBlankBedsSlot("g",hostel.getHostelName());
	
		System.out.println(hostel.getHostelName()+"=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
		
		return "redirect:adminPage";
		//return "redirect:/work/";
		
	}
	
	@PostMapping("/addBoysHostel")
	public String addBoysHostel(@ModelAttribute("boyshostel")BoysHostel hostel,Model theModel){
		
		dao.addBoysHostel(hostel);
		dao.addBlankBedsSlot("b",hostel.getHostelName());
		return "redirect:adminPage";
		//return "redirect:/work/";
		
	
		
	}
	
	@GetMapping("/deleteThisHostel")
	public String deleteThisHostel(@RequestParam("id")int id,@RequestParam("hostel")String hostel,Model theModel,
			@RequestParam("hostelName")String nme){
		
		dao.deleteTheBlankBeds(nme);
		dao.deleteThisHostel(id,hostel);
		

		
		return "redirect:adminPage";
	}
	/** old payment gateway
	@PostMapping("/payment")
	public String payment(@RequestParam("amount") String amount,
			@RequestParam("firstname") String firstname,
			@RequestParam("productinfo") String productinfo,
			@RequestParam("email") String email,
			@RequestParam("phone") String phone,
			@RequestParam("surl") String surl,
			@RequestParam("furl") String furl
			
	
			){
		
		
		
		//return  "payment?pay="+pay+"&name="+name+"&email="+email+"&phone="+phone;
		return "payment";
	}
	**/
	@PostMapping("/final")
	@ResponseBody
	public String finalPage(@RequestParam("status")String status,
			@RequestParam("amount")String amount,
			@RequestParam("reg")String firstname,
			@RequestParam("ph")String ph
			){
		System.out.println(firstname);
		dao.addPayment(firstname, amount);
		java.util.Date dt = new java.util.Date();

		java.text.SimpleDateFormat sdf = 
		     new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String currentTime = sdf.format(dt);
		
		Bills theBill = new Bills();
		theBill.setRegNo(firstname);
		theBill.setAmount(amount);
		theBill.setMode("online");
		theBill.setDateTime(currentTime);
		theBill.setBillNo(status);
		
		dao.saveBill(theBill);
		SMSINDIAHUB sms = new SMSINDIAHUB();
		sms.sendSms1(ph, "You have sucessfully paid Rs."+amount+", your payment id is: "+status);
		return "";
				}
	
	@PostMapping("/saveStudentImage")
	public String saveStudentImage(@RequestParam("reg")String reg,@RequestParam("img")MultipartFile img)throws IOException{
		
		dao.saveStudentImage(img.getBytes(), reg);
		
		return "redirect:studentPage?nme="+reg;
	}
	@PostMapping("/savefaultyImage")
	public String savefaultyImage(@RequestParam("uname")String name, @RequestParam("reg")int reg,@RequestParam("img")MultipartFile img)throws IOException{
		
		dao.saveFacultyImage(img.getBytes(), reg);
		
		return "redirect:facultyPage?my="+name;
	}
	
	@PostMapping("/addPlacement")
	public String addPlacement(@RequestParam("companyName")String companyName,
			@RequestParam("companyLogo")MultipartFile companyLogo,
			@RequestParam("placedStudent")String studentsPlaced,
			@RequestParam("year")String year,
			@RequestParam("my")String my,
			Model theModel
			)throws IOException
	{
		Placement placement = new Placement();
		placement.setCompanyName(companyName);
		placement.setCompanyLogo(companyLogo.getBytes());
		placement.setStudentsPlaced(studentsPlaced);
		placement.setYear(year);
		
		dao.savePlacement(placement);
		if(my.equals("admin")){
			return "redirect:adminPage";
		}

		
		return "redirect:placementPage?my="+my;
	}
	@GetMapping("/deletePlacement")
	public String deletePlacement(@RequestParam("id") int id, Model theModel){
		
		dao.deletePlacement(id);
		

		
		return "redirect:adminPage";
	}
	
	@GetMapping("/deletePlacement2")
	public String deletePlacement2(@RequestParam("id") int id, Model theModel,@RequestParam("my")String my){
		
		dao.deletePlacement(id);
		
		return "redirect:placementPage?my="+my;//-----------------------------------------------------------------------------
	}
	
	@GetMapping("/departments") 
	public String departments(@RequestParam("dept") String dept, Model theModel){
		
		if(dept.equals("mech")){
			List<FacultyList> theList = dao.getFacultyList("Mechanical Department");
			theModel.addAttribute("fac",theList);
			
			List<Departments> deptList = dao.getDepartmentList(1);
			theModel.addAttribute("info",deptList);
		}
       if(dept.equals("cse")){
    	   List<FacultyList> theList = dao.getFacultyList("Computer Science Department");
			theModel.addAttribute("fac",theList);
			
			List<Departments> deptList = dao.getDepartmentList(2);
			theModel.addAttribute("info",deptList);
		}
        if(dept.equals("civil")){
	
        	  List<FacultyList> theList = dao.getFacultyList("Civil Engineering Department");
        	  theModel.addAttribute("fac",theList);
        	  
        	  List<Departments> deptList = dao.getDepartmentList(3);
  			theModel.addAttribute("info",deptList);
         }
if(dept.equals("ee")){
	
	  List<FacultyList> theList = dao.getFacultyList("Electrical Department");
	  theModel.addAttribute("fac",theList);
	  
	  List<Departments> deptList = dao.getDepartmentList(4);
		theModel.addAttribute("info",deptList);
		
}
if(dept.equals("eee")){
	
	  List<FacultyList> theList = dao.getFacultyList("Electrical Department");
	  theModel.addAttribute("fac",theList);
	  
	  List<Departments> deptList = dao.getDepartmentList(5);
		theModel.addAttribute("info",deptList);
}
if(dept.equals("ece")){
	
	 List<FacultyList> theList = dao.getFacultyList("Electronics Department");
	 theModel.addAttribute("fac",theList);
	 
	  List<Departments> deptList = dao.getDepartmentList(6);
		theModel.addAttribute("info",deptList);
}

if(dept.equals("hum")){
	
	 List<FacultyList> theList = dao.getFacultyList("Humanities Department");
	 theModel.addAttribute("fac",theList);
	 
	 List<Departments> deptList = dao.getDepartmentList(7);
		theModel.addAttribute("info",deptList);
}
		
		return "departments";
	}


@GetMapping("/deleteFaculty")
public String deleteFaculty(@RequestParam("id")int id,
		@RequestParam("dept")String dept
		){
	dao.deleteFaculty(id);
	
	return "redirect:/work/facultyDetails?dept="+dept;
}


@PostMapping("/editFacultyInAdmin")
public String editFacultyInAdmin(@RequestParam("id")int id,
		@RequestParam("uname")String fac,
		@RequestParam("name")String name,
		@RequestParam("department")String department,
		@RequestParam("designation")String designation,
		//@RequestParam("dept")String dept,
		@RequestParam("qualification")String qualification,
		@RequestParam("gender") String gender,
	//	@RequestParam("photo")MultipartFile photo,
		@RequestParam("contact")String contact,
	//	@RequestParam("username")String username,
		@RequestParam("password")String password
		)throws IOException{
	
	//dao.saveFaculty(id, name, designation, qualification, gender, contact);
	
	FacultyList facultyList = new FacultyList();
	facultyList.setId(id);
	facultyList.setName(name);
	facultyList.setDepartment(department);
	facultyList.setDesignation(designation);
	facultyList.setQualification(qualification);
	//facultyList.setPhoto(photo.getBytes());
	facultyList.setGender(gender);
	facultyList.setContact(contact);
	facultyList.setUsername(fac);
	facultyList.setPassword(password);
	
	dao.saveFaculty(facultyList);
	
	
	return "redirect:facultyDetails?dept="+department;
}

@PostMapping("/editFaculty")
public String editFaculty(@RequestParam("id")int id,
		@RequestParam("uname")String fac,
		@RequestParam("name")String name,
		//@RequestParam("department")String department,
		@RequestParam("designation")String designation,
		//@RequestParam("dept")String dept,
		@RequestParam("qualification")String qualification,
		@RequestParam("gender") String gender,
	//	@RequestParam("photo")MultipartFile photo,
		@RequestParam("contact")String contact
	//	@RequestParam("username")String username,
	//	@RequestParam("password")String password
		)throws IOException{
	
	dao.saveFaculty(id, name, designation, qualification, gender, contact);
	/**
	FacultyList facultyList = new FacultyList();
	facultyList.setId(id);
	facultyList.setName(name);
	facultyList.setDepartment(department);
	facultyList.setDesignation(designation);
	facultyList.setQualification(qualification);
	facultyList.setPhoto(photo.getBytes());
	facultyList.setGender(gender);
	facultyList.setContact(contact);
	facultyList.setUsername(username);
	facultyList.setPassword(password);
	**/
	
	
	
	return "redirect:facultyPage?my="+fac;
}
@GetMapping("/checkReg")
@ResponseBody
public String checkReg(@RequestParam("reg")String reg){
	String chkReg = dao.checkRegNo(reg);
	
	if(chkReg.equals("not-there")){
		return "&nbsp&nbsp&nbsp<span style='color: green;font-size: 10px;'>You can use this<span>";
	}
	else
	return "&nbsp&nbsp&nbsp<span style='color: red;font-size: 10px;'>You cannot use this<span>";
}

@PostMapping("/saveGallery")
@ResponseBody
public String saveGallery(@RequestParam("album")String album,
		@RequestParam("img")MultipartFile pic
		)throws IOException{
	Gallery gallery = new Gallery();
	gallery.setAlbumName(album);
	
	gallery.setPhoto((pic.getBytes()));
	
	dao.saveGalley(gallery);
	System.out.println(pic.getBytes());
	System.out.println("---------------Success------------------ssssss");
	return "<span></span>";
	
	
	
	
}

@GetMapping("/saveAlbumName")
@ResponseBody
public String saveAlbumName(@RequestParam("name") String name){
	
	GalleryAlbumName name1 = new GalleryAlbumName();
	name1.setAlbumName(name);
	dao.saveGalleryAlbumName(name1);
	
	return "";
}

@PostMapping("/saveMsg")
@ResponseBody
public String saveMsg(@RequestParam("name")String name,@RequestParam("email")String email,@RequestParam("message")String message){
	
	dao.saveMessage(name, email, message);
	
	
return "<p>this is right</p>";	
}

@GetMapping("/deleteMsg")
@ResponseBody
public String deleteMsg(@RequestParam("id")int id){
	
	dao.deleteMsg(id);
	
	return "";
}

@GetMapping("/gallery")
public String gallery(Model theModel){
	  

	List theList = dao.getGalleryAlbumName();
	
	theModel.addAttribute("albumName",theList);
	
	return "gallery";
}

@GetMapping("/showPhotos")
public String showPhotos(@RequestParam("my")String albumName,Model theModel){
	
	List theList = dao.getIdByAlbumName(albumName);
	System.out.println(albumName);
	theModel.addAttribute("picId",theList);
	
return "showGallery";	
}

@PostMapping("/saveFeedback")
@ResponseBody
public String saveFeedback(@RequestParam("name")String name,
		@RequestParam("year")String year,
		@RequestParam("body")String body
		){
	
	Testimonials feedBack = new Testimonials();
	feedBack.setStudentName(name);
	feedBack.setYear(year);
	feedBack.setBody(body);
	dao.saveFeedback(feedBack);
	
	
	return "<p>ncdjcnjd</p>";
}

@GetMapping("/searchedStudent")
public String searchedStudent(@RequestParam("reg")String username, Model theModel){
	
	List<UserStudent> theList = dao.getStudentInfo(username);
	theModel.addAttribute("lst",theList);
	
	return "search-student";
}

@GetMapping("/deleteFed")
@ResponseBody
public String deleteFed(@RequestParam("my")int id){
	
	dao.deleteFed(id);
	return "redirect:adminPage";
}

@GetMapping("/deleteAlbum")
public String deleteAlbum(@RequestParam("name")String name){
	
	dao.deleteAlbum(name);
	return "redirect:adminPage";
}

@PostMapping("/changeMe")
@ResponseBody
public String changeMe(@RequestParam("Password123")String pass,@RequestParam("name")String name, HttpSession session){
	
	System.out.println(pass);
	dao.changePass(name,pass);
	session.invalidate();
	return "";
}

@PostMapping("/changeStudent")
@ResponseBody
public String changeStudent( HttpSession session,@RequestParam("Password123")String pass,@RequestParam("id")String id){
	

	int idd = Integer.parseInt(id);
	System.out.println("----------"+pass+"------------");
	
	dao.changePassStudent(idd, pass);
	session.invalidate();
	return "redirect:index";
}

@PostMapping("/changeFacultyPass")
@ResponseBody
public String changeFacultyPass(HttpSession session, @RequestParam("Password123")String pass,@RequestParam("id")String id){
	
	int idd = Integer.parseInt(id);
	System.out.println("----------"+pass+"------------");
	
	dao.changeFacultyPass(idd, pass);
	session.invalidate();
	return "";
	
	
	
	
}




@PostMapping("/changeExamPass")
@ResponseBody
public String changeExamPass(@RequestParam("name")String name,HttpSession session, @RequestParam("Password123")String pass,@RequestParam("id")String id){
	
	int idd = Integer.parseInt(id);
	System.out.println("----------"+pass+"------------");
	
	dao.changeExamPass(name,idd, pass);
	session.invalidate();
	return "";
	
	
	
	
}


@PostMapping("/changeLibPass")
@ResponseBody
public String changeLibPass(@RequestParam("name")String name,HttpSession session, @RequestParam("Password123")String pass,@RequestParam("id")String id){
	
	int idd = Integer.parseInt(id);
	System.out.println("----------"+pass+"------------");
	
	dao.changeLibPass(name,idd, pass);
	session.invalidate();
	return "";
	
	
	
	
}

@PostMapping("/changeAccPass")
@ResponseBody
public String changeAccPass(@RequestParam("name")String name,HttpSession session, @RequestParam("Password123")String pass,@RequestParam("id")String id){
	
	int idd = Integer.parseInt(id);
	System.out.println("----------"+pass+"------------");
	
	dao.changeAccPass(name,idd, pass);
	session.invalidate();
	return "";
	
	
	
	
}






@PostMapping("/changePlacePass")
@ResponseBody
public String changePlacePass(@RequestParam("name")String name,HttpSession session, @RequestParam("Password123")String pass,@RequestParam("id")String id){
	
	int idd = Integer.parseInt(id);
	System.out.println("----------"+pass+"------------");
	
	dao.changePlacePass(name,idd, pass);
	session.invalidate();
	return "";
	
	
	
	
}


@GetMapping("/pay")
public String pay(){
	
	return "pay";
}

@PostMapping("/sendMessages")
@ResponseBody
public String sendMessage(@RequestParam("loop")String x){
	String msg = "";
	x=x.replace("[", "");
	x=x.replace("]", "");
	x=x.replace("{", "");
	x=x.replace("}", "");
	x=x.replace("number", "");
	x=x.replace("msg", "");
	x=x.replace(":", "");
	x = x.replace("\"", "");
	SMSINDIAHUB sms = new SMSINDIAHUB();
	int c=1,e=1;
	System.out.println(x);
	
	for(String w:x.split("~,")){
		System.out.println(w);
		if(c==1){
			msg = w;
			System.out.println("deeedededd"+msg);
			c++;
		}
		else{
			//String po = sms.sendSms1(w,msg);
			//System.out.println(po);
			for(String p:w.split(",")){
				String po = sms.sendSms1(p,msg);
				System.out.println(po);
			}
			
			
		}
		
		//sms.SMSSender("pranoy1994", "koronadi123", w, msg , "WEBSMS","0");
		}

	System.out.println("thiasu ahdbiwqudoiudbwdqw==============================lklknoinonpin====================");
	return "";
}

     
        
       @GetMapping("/validatePlaUser")
       @ResponseBody
       public String validatePlaUser(@RequestParam("uname")String uname){
    	   
    	   String val = dao.validatePlaUser(uname);
    	   System.out.println(val);
    	   return val;
       }
       
       @PostMapping("/savePlaAcc")
       @ResponseBody
       public String savePlaAcc(@RequestParam("uname")String uname,@RequestParam("pass")String pass){
    	   
    	   PlacementDepartment pd = new PlacementDepartment();
    	   
    	   pd.setName(uname);
    	   pd.setUsername(uname);
    	   pd.setPassword(pass);
    	   dao.savePlaAcc(pd);
    	   
    	   
    	   return "";
       }

       @GetMapping("/validateLibUser")
       @ResponseBody
       public String validateLibUser(@RequestParam("uname")String uname){
    	   
    	   String val = dao.validateLibUser(uname);
    	   System.out.println(val);
    	   return val;
       }
       @GetMapping("/validateFacUser")
       @ResponseBody
       public String validateFacUser(@RequestParam("uname")String uname){
    	   
    	   String val = dao.validateFacUser(uname);
    	   System.out.println(val);
    	   return val;
       }
       
       
       
       
       @PostMapping("/saveLibAcc")
       @ResponseBody
       public String saveLibAcc(@RequestParam("uname")String uname,@RequestParam("pass")String pass){
    	   
    	   LibraryDeparement pd = new LibraryDeparement();
    	   
    	   pd.setName(uname);
    	   pd.setUsername(uname);
    	   pd.setPassword(pass);
    	   dao.saveLibAcc(pd);
    	   
    	   
    	   return "";
       }
       
       
       @GetMapping("/validateExaUser")
       @ResponseBody
       public String validateExaUser(@RequestParam("uname")String uname){
    	   
    	   String val = dao.validateExaUser(uname);
    	   System.out.println(val);
    	   return val;
       }
       
       @PostMapping("/saveExaAcc")
       @ResponseBody
       public String saveExaAcc(@RequestParam("uname")String uname,@RequestParam("pass")String pass){
    	   
    	   ExamDepartment pd = new ExamDepartment();
    	   
    	   pd.setName(uname);
    	   pd.setUsername(uname);
    	   pd.setPassword(pass);
    	   dao.saveExaAcc(pd);
    	   
    	   
    	   return "";
       }
       
       @GetMapping("/validateAccUser")
       @ResponseBody
       public String validateAccUser(@RequestParam("uname")String uname){
    	   
    	   String val = dao.validateAccUser(uname);
    	   System.out.println(val);
    	   return val;
       }
       
       @PostMapping("/saveAccAcc")
       @ResponseBody
       public String saveAccAcc(@RequestParam("uname")String uname,@RequestParam("pass")String pass){
    	   
    	   AccountsDepartment pd = new AccountsDepartment();
    	   
    	   pd.setName(uname);
    	   pd.setUsername(uname);
    	   pd.setPassword(pass);
    	   dao.saveAccAcc(pd);
    	   
    	   
    	   return "";
       }
       
       @GetMapping("/pla")
       public String pla(Model theModel){
    	   
    	   List<PlacementDepartment> pd = dao.getPlacementDeptUsers();
    	   theModel.addAttribute("pd",pd);
    	   return "pla";
       }
       
       @GetMapping("/deleteOtherAdmins")
       @ResponseBody
       public String deleteOtherAdmins(@RequestParam("dept")String dept, @RequestParam("id")int id){
           
    	   dao.deleteOtherAdmins(dept, id);

    	   
    	   return"";
       }
       @GetMapping("/dev")
       public String dev(){
    	   
    	   return "dev";
       }

}









