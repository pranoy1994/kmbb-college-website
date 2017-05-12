package com.collegewebsite.springhibernate.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.collegewebsite.springhibernate.entity.AccountsDepartment;
import com.collegewebsite.springhibernate.entity.Administrator;
import com.collegewebsite.springhibernate.entity.Bills;
import com.collegewebsite.springhibernate.entity.BlankHostelBeds;
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
import com.collegewebsite.springhibernate.entity.NoPhoto;
import com.collegewebsite.springhibernate.entity.Notifications;
import com.collegewebsite.springhibernate.entity.Placement;
import com.collegewebsite.springhibernate.entity.PlacementDepartment;
import com.collegewebsite.springhibernate.entity.StudentMarks;
import com.collegewebsite.springhibernate.entity.Testimonials;
import com.collegewebsite.springhibernate.entity.UserStudent;

@Repository
public class DataAccessObjectImplementation implements DataAccessObject {
	
	
	

	//--------------------inject the session factory----------------------------
	@Autowired
	private SessionFactory sessionFactory;
	
	
	

	
	@Override
	@Transactional
	public String loginStudent(String registrationNumber,String password) {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<UserStudent> theQuery = currentSession.createQuery("from UserStudent as o where o.registrationNumber=:reg and o.password=:pass",UserStudent.class);
		
		theQuery.setParameter("reg", registrationNumber);
		theQuery.setParameter("pass", password);
		
		List<UserStudent> list = theQuery.getResultList();
		
		if(list != null && list.size() > 0){
			return "valid";
		}
		else{
			return "invalid";
		}
	}
	
	@Override
	@Transactional
	public String loginAdmin(String username,String password) {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Administrator> theQuery = currentSession.createQuery("from Administrator as o where o.username=:reg and o.password=:pass",Administrator.class);
		
		theQuery.setParameter("reg", username);
		theQuery.setParameter("pass", password);
		
		List<Administrator> list = theQuery.getResultList();
		
		if(list != null && list.size() > 0){
			return "valid";
		}
		else{
			return "invalid";
		}
	}

	@Override
	@Transactional
	public List<Notifications> showNotifications() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Notifications> theQuery = currentSession.createQuery("from Notifications n order by n.id desc",Notifications.class);
		
		List<Notifications> notifications = theQuery.getResultList();
		
		return notifications;
	}

	@Override
	@Transactional
	public List<UserStudent> getStudentInfo(String registrationNumber) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<UserStudent> theQuery = currentSession.createQuery("from UserStudent as o where o.registrationNumber=:reg",UserStudent.class);
		
		theQuery.setParameter("reg", registrationNumber);
		
		List<UserStudent> studentInfo = theQuery.getResultList();
		
		return studentInfo;
	}
	
	@Override
	@Transactional
	public byte[] loadImages(int id){
		
		Session currentSession = sessionFactory.getCurrentSession();
		UserStudent imgNew = (UserStudent)currentSession.get(UserStudent.class, id);
		return imgNew.getPicture();
		
		
	}

	@Override
	@Transactional
	public void saveStudent(UserStudent student) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(student);
		
	}

	@Override
	@Transactional
	public List<UserStudent> getStudentList(String year, String branch) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<UserStudent> theQuery = currentSession.createQuery("from UserStudent as o where o.admissionYear=? and o.branch=?",UserStudent.class);
		
		theQuery.setParameter(0, Integer.parseInt(year));
		theQuery.setParameter(1, branch);
		
		List<UserStudent> studentList= theQuery.getResultList();
		
		return studentList;
	}

	@Override
	@Transactional
	public void deleteStudent(int id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("delete from UserStudent where id=:studentId");
		
		theQuery.setParameter("studentId", id);
		theQuery.executeUpdate();
		
	}

	@Override
	@Transactional
	public void addNotice(Notifications notice) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(notice);
		
	}

	@Override
	@Transactional
	public void deleteNotice(int id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("delete from Notifications where id=:noticeId");
		
		theQuery.setParameter("noticeId", id);
		theQuery.executeUpdate();
		
	}

	@Override
	@Transactional
	public List<FacultyList> getFacultyList(String dept) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<FacultyList> theQuery = currentSession.createQuery("from FacultyList as o where o.department=?",FacultyList.class);
		
		theQuery.setParameter(0, dept);
		
		List<FacultyList> facultyList = theQuery.getResultList(); 
		
		return facultyList;
	}

	@Override
	@Transactional
	public byte[] loadFacultyImages(int id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		FacultyList imgNew = (FacultyList)currentSession.get(FacultyList.class, id);
		return imgNew.getPhoto();
		
		
	}

	@Override
	@Transactional
	public void saveFaculty(FacultyList facultyList) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(facultyList);
		
	}

	@Override
	@Transactional
	public byte[] loadHomeScreenImage(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		HomeScreenPictures imgNew = (HomeScreenPictures)currentSession.get(HomeScreenPictures.class, id);
		return imgNew.getPhotos();
	}

	@Override
	@Transactional
	public void saveHomeScreenPhotos(HomeScreenPictures pic) {
	
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(pic);
		
	}

	@Override
	@Transactional
	public List<HomeScreenPictures> showHomeScreenPictures() {
		
Session currentSession = sessionFactory.getCurrentSession();
		
		Query<HomeScreenPictures> theQuery = currentSession.createQuery("from HomeScreenPictures",HomeScreenPictures.class);
		
		List<HomeScreenPictures> homeScreenPictures = theQuery.getResultList();
		
		return homeScreenPictures;
		
		
	}

	@Override
	@Transactional
	public void deleteHomeScreenPictures(int id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("delete from HomeScreenPictures where id=:deletethis");
		
		theQuery.setParameter("deletethis", id);
		theQuery.executeUpdate();
	}

	@Override
	@Transactional
	public List<GirlsHostel> getGirlsHostelList() {

		Session currentSession  = sessionFactory.getCurrentSession();
		
		Query<GirlsHostel>  theQuery = currentSession.createQuery("from GirlsHostel",GirlsHostel.class);
		
		List<GirlsHostel> girlsHostel = theQuery.getResultList();
		
		return girlsHostel;
	
	}

	@Override
	@Transactional
	public List<BoysHostel> getBoysHostelList() {

		Session currentSession  = sessionFactory.getCurrentSession();
		
		Query<BoysHostel> theQuery = currentSession.createQuery("from BoysHostel",BoysHostel.class);
		
		List<BoysHostel> boysHostel = theQuery.getResultList();
		
		return boysHostel;
		
	}

	@Override
	@Transactional
	public void addGirlsHostel(GirlsHostel hostel) {
		
		Session currentSession  = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(hostel);
		
	}

	@Override
	@Transactional
	public void addBoysHostel(BoysHostel hostel) {
		
Session currentSession  = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(hostel);
		
	}

	@Override
	@Transactional
	public void deleteThisHostel(int id, String hostel) {
		
		Session currentSession  = sessionFactory.getCurrentSession();
		
		Query theQuery;
		if(hostel.equals("boys")){
			
			 theQuery = currentSession.createQuery("delete from BoysHostel where id=:hostelid");
		}
		else{
			
			 theQuery = currentSession.createQuery("delete from GirlsHostel where id=:hostelid");
			
		}
		theQuery.setParameter("hostelid", id);
		theQuery.executeUpdate();
	}

	@Override
	@Transactional
	public int getHostelBedNo(String gender, String hostelName) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		System.out.println("--------------------------------------------"+hostelName+"---------------------------------------------------");
		int beds;String b;
		if(gender.equals("Male")){
		//Query<BoysHostel> theQuery = currentSession.createQuery("from BoysHostel where hostelName=:hstl");
		Query theQuery = currentSession.createQuery("select p.noOfOccupiedBeds from BoysHostel p where hostelName=:hstl"); 
		
		theQuery.setParameter("hstl", hostelName);
	 b = theQuery.getSingleResult().toString();
		
		 beds = Integer.parseInt(b) + 1;
		
		Query qer  = currentSession.createQuery("update BoysHostel set noOfOccupiedBeds=:op where hostelName=:hstl");
		qer.setParameter("op", beds);
		qer.setParameter("hstl", hostelName);
		qer.executeUpdate();
		
		
	   
		}
		else{
			Query theQuery = currentSession.createQuery("select p.noOfOccupiedBeds from GirlsHostel p where hostelName=:hstl"); 
			
			theQuery.setParameter("hstl", hostelName);
			 b = theQuery.getSingleResult().toString();
			
			 beds = Integer.parseInt(b) + 1;
			
			Query qer  = currentSession.createQuery("update GirlsHostel set noOfOccupiedBeds=:op where hostelName=:hstl");
			qer.setParameter("op", beds);
			qer.setParameter("hstl", hostelName);
			qer.executeUpdate();
			
		}
		return Integer.parseInt(b);
	}

	@Override
	@Transactional
	public void addPayment(String lastname, String amount) {
	
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("update UserStudent set feesPaid = "+amount+" where registrationNumber = "+lastname);
		theQuery.executeUpdate();
	}

	@Override
	@Transactional
	public List<UserStudent> getFullStudentList() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("from UserStudent", UserStudent.class);
		
		List<UserStudent> fullList =theQuery.getResultList();
		return fullList;
	}

	@Override
	@Transactional
	public void updateHostel(String gender, String hostel) {
		Session currentSession = sessionFactory.getCurrentSession();
		int beds;
		if(gender.equals("Male")){
			
			Query<BoysHostel> theQuery = currentSession.createQuery("from BoysHostel where hostelName=:hstl");
			
			
			theQuery.setParameter("hstl", hostel);
			List<BoysHostel> theList = theQuery.getResultList();
		    beds = theList.get(0).getNoOfOccupiedBeds();
		    
		   BoysHostel bs = theQuery.getResultList().get(0);
		   bs.setNoOfOccupiedBeds(beds-1);
		   currentSession.update(bs);
		
		}
		if(gender.equals("Female")){
			
Query<GirlsHostel> theQuery = currentSession.createQuery("from GirlsHostel where hostelName=:hstl");
			
			theQuery.setParameter("hstl",hostel);
			List<GirlsHostel> theList = theQuery.getResultList();
		    beds = theList.get(0).getNoOfOccupiedBeds();
			
		    GirlsHostel bs = theQuery.getResultList().get(0);
			   bs.setNoOfOccupiedBeds(beds-1);
			   currentSession.update(bs);
		
		}
		
	}

	@Override
	@Transactional
	public void savePlacement(Placement placement) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(placement);
		
	}

	@Override
	@Transactional
	public List<Placement> getPlacement() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("from Placement",Placement.class);
		
		List<Placement> theList = theQuery.getResultList();
		return theList;
	}

	@Override
	@Transactional
	public byte[] loadCompanyLogo(int id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Placement companyLogo = currentSession.get(Placement.class, id);
		return companyLogo.getCompanyLogo();
	}

	@Override
	@Transactional
	public void deletePlacement(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("delete from Placement where id=:pid");
		
		theQuery.setParameter("pid", id);
		theQuery.executeUpdate();
		
	}

	@Override
	@Transactional
	public List<Departments> getDepartmentList(int i) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Departments> theQuery = currentSession.createQuery("from Departments as o where o.id=?", Departments.class);
		
		theQuery.setParameter(0, i);
		
		List<Departments> theList = theQuery.getResultList();
		return theList;
	}

	@Override
	@Transactional
	public void deleteFaculty(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<FacultyList> theQuery = currentSession.createQuery("delete from FacultyList where id=:theid");
		
		theQuery.setParameter("theid", id);
		
		theQuery.executeUpdate();
		
		
		
	}

	@Override
	@Transactional
	public String checkRegNo(String reg) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<UserStudent> theQuery = currentSession.createQuery("select p.registrationNumber from UserStudent p");
		
		List<UserStudent> theList = theQuery.getResultList();
		
		Iterator it = theList.iterator();
		
		int c=0;
		
		while(it.hasNext()){
			 
			String i = (String)it.next();
					
			if(i.equals(reg))
			{
				c++;
				break;
			}
		}
		
		if(c>0){
		return "got";
		}
		else
			return "not-there";
	}

	@Override
	@Transactional
	public void saveMessage(String name, String email, String message) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Message msg = new Message();
		msg.setName(name);
		msg.setEmail(email);
		msg.setMessage(message);
		msg.setDate(new Date());
		currentSession.save(msg);
		
		
	}

	@Override
	@Transactional
	public List<Message> getMessage() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Message> theQuery = currentSession.createQuery("from Message",Message.class);
		
		List<Message> theList = theQuery.getResultList();
		return theList;
	}

	@Override
	@Transactional
	public void deleteMsg(int id) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("delete from Message where id=:ids");
		
		theQuery.setParameter("ids",id);
		theQuery.executeUpdate();
		
	}

	@Override
	@Transactional
	public void saveGalley(Gallery gallery) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(gallery);
		
	}

	@Override
	@Transactional
	public void saveGalleryAlbumName(GalleryAlbumName name) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(name);
	}

	@Override
	@Transactional
	public List getGalleryAlbumName() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("from GalleryAlbumName",GalleryAlbumName.class);
		
		
		List theList = theQuery.getResultList();
		
		
		
		return theList;
	}

	@Override
	@Transactional
	public List getIdByAlbumName(String albumName) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("from Gallery as o where o.albumName=?");
		
		theQuery.setParameter(0, albumName);
		return theQuery.getResultList();
	}
	
	@Override
	@Transactional
	public byte[] loadGalleryImages(int id){
		
		Session currentSession = sessionFactory.getCurrentSession();
		Gallery imgNew = (Gallery)currentSession.get(Gallery.class, id);
		return imgNew.getPhoto();
		
		
	}

	@Override
	@Transactional
	public void saveFeedback(Testimonials feedback) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(feedback);
		
	}

	@Override
	@Transactional
	public List<Testimonials> showTestimonial() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Testimonials> theQuery = currentSession.createQuery("from Testimonials",Testimonials.class);
		
		
		return theQuery.getResultList();
	}

	@Override
	@Transactional
	public void deleteFed(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("delete from Testimonials where id=:theid");
		
		theQuery.setParameter("theid", id);
		theQuery.executeUpdate();
		
	}

	@Override
	@Transactional
	public void deleteAlbum(String name) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("delete from GalleryAlbumName where albumName=:alb");
		theQuery.setParameter("alb",name);
		theQuery.executeUpdate();
		
	    Query query = currentSession.createQuery("delete from Gallery where albumName=:alb");
		query.setParameter("alb",name);
		query.executeUpdate();
		
	}

	@Override
	@Transactional
	public byte[] loadDepPhoto(int id) {
	
		Session currentSession = sessionFactory.getCurrentSession();
		
		
		Departments imgNew = (Departments)currentSession.get(Departments.class, id);
		return imgNew.getScreenPic();
		
	
	}

	@Override
	@Transactional
	public void changePass(String name, String pass) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("update Administrator set password =:pass where username =:user");
		System.out.println(pass+"---------------!!");
		theQuery.setParameter("pass", pass);
		theQuery.setParameter("user", name);
		theQuery.executeUpdate();
		
	}
	

	@Override
	@Transactional
	public void changePlacePass(String name, int idd, String pass) {
		Session currentSession = sessionFactory.getCurrentSession();
        Query theQuery = currentSession.createQuery("update PlacementDepartment set password =:pass, name =:name where id =:theid");
		
		theQuery.setParameter("pass", pass);
		theQuery.setParameter("theid", idd);
		theQuery.setParameter("name", name);
		theQuery.executeUpdate();
		
	}

	
	
	@Override
	@Transactional
	public void changeFacultyPass(int idd, String pass) {
		Session currentSession = sessionFactory.getCurrentSession();
        Query theQuery = currentSession.createQuery("update FacultyList set password =:pass where id =:theid");
		
		theQuery.setParameter("pass", pass);
		theQuery.setParameter("theid", idd);
		theQuery.executeUpdate();
		
		
	}

	@Override
	@Transactional
	public void changePassStudent(int id, String pass) {
		Session currentSession = sessionFactory.getCurrentSession();
        Query theQuery = currentSession.createQuery("update UserStudent set password =:pass where id =:theid");
		
		theQuery.setParameter("pass", pass);
		theQuery.setParameter("theid", id);
		theQuery.executeUpdate();
		
	}

	@Override
	@Transactional
	public String loginFaculty(String username, String password) {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<FacultyList> theQuery = currentSession.createQuery("from FacultyList as o where o.username=:user and o.password=:pass",FacultyList.class);
		
		theQuery.setParameter("user", username);
		theQuery.setParameter("pass", password);
		
		List<FacultyList> list = theQuery.getResultList();
		
		if(list != null && list.size() > 0){
			return "valid";
		}
		else{
			return "invalid";
		}
		
	}

	@Override
	@Transactional
	public List getFaculty(String username) {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<FacultyList> theQuery = currentSession.createQuery("from FacultyList as o where o.username=:user",FacultyList.class);
		
		theQuery.setParameter("user", username);
		
		
		List<FacultyList> list = theQuery.getResultList();
		return list;
		
		
	}

	@Override
	@Transactional
	public String loginPlace(String username, String password) {
		

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<PlacementDepartment> theQuery = currentSession.createQuery("from PlacementDepartment as o where o.username=:user and o.password=:pass",PlacementDepartment.class);
		
		theQuery.setParameter("user", username);
		theQuery.setParameter("pass", password);
		
		List<PlacementDepartment> list = theQuery.getResultList();
		
		if(list != null && list.size() > 0){
			return "valid";
		}
		else{
			return "invalid";
		}
	
	}

	@Override
	@Transactional
	public List getPlacementPage(String username) {
		

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<PlacementDepartment> theQuery = currentSession.createQuery("from PlacementDepartment as o where o.username=:user",PlacementDepartment.class);
		
		theQuery.setParameter("user", username);
		
		
		List<PlacementDepartment> list = theQuery.getResultList();
		
		return list;
	}

	@Override
	@Transactional
	public String loginExam(String username, String password) {
		

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<ExamDepartment> theQuery = currentSession.createQuery("from ExamDepartment as o where o.username=:user and o.password=:pass",ExamDepartment.class);
		
		theQuery.setParameter("user", username);
		theQuery.setParameter("pass", password);
		
		List<ExamDepartment> list = theQuery.getResultList();
		
		if(list != null && list.size() > 0){
			return "valid";
		}
		else{
			return "invalid";
		}
	}

	@Override
	@Transactional
	public List getExamPage(String username) {
		

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<ExamDepartment> theQuery = currentSession.createQuery("from ExamDepartment as o where o.username=:user",ExamDepartment.class);
		
		theQuery.setParameter("user", username);
		
		
		List<ExamDepartment> list = theQuery.getResultList();
		
		return list;
		
		
	}

	@Override
	@Transactional
	public String loginLib(String username, String password) {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<LibraryDeparement> theQuery = currentSession.createQuery("from LibraryDeparement as o where o.username=:user and o.password=:pass",LibraryDeparement.class);
		
		theQuery.setParameter("user", username);
		theQuery.setParameter("pass", password);
		
		List<LibraryDeparement> list = theQuery.getResultList();
		
		if(list != null && list.size() > 0){
			return "valid";
		}
		else{
			return "invalid";
		}
		
	}

	@Override
	@Transactional
	public List getlibraryPage(String username) {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<LibraryDeparement> theQuery = currentSession.createQuery("from LibraryDeparement as o where o.username=:user",LibraryDeparement.class);
		
		theQuery.setParameter("user", username);
		
		
		List<LibraryDeparement> list = theQuery.getResultList();
		
		return list;
		
	}

	@Override
	@Transactional
	public String loginAcc(String username, String password) {
	
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<AccountsDepartment> theQuery = currentSession.createQuery("from AccountsDepartment as o where o.username=:user and o.password=:pass",AccountsDepartment.class);
		
		theQuery.setParameter("user", username);
		theQuery.setParameter("pass", password);
		
		List<AccountsDepartment> list = theQuery.getResultList();
		
		if(list != null && list.size() > 0){
			return "valid";
		}
		else{
			return "invalid";
		}
		
	}

	@Override
	@Transactional
	public List getAccPage(String username) {
		
	
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<AccountsDepartment> theQuery = currentSession.createQuery("from AccountsDepartment as o where o.username=:user",AccountsDepartment.class);
		
		theQuery.setParameter("user", username);
		
		
		List<AccountsDepartment> list = theQuery.getResultList();
		
		return list;
	}

	@Override
	@Transactional
	public List<FacultyList> getFullFacList() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("from FacultyList",FacultyList.class);
		
		return theQuery.getResultList();
	}

	@Override
	@Transactional
	public void addMarkOfStudent(StudentMarks st) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(st);
		
		
	}

	@Override
	@Transactional
	public List<ExamNames> getMarks() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<ExamNames> theQuery = currentSession.createQuery("from ExamNames",ExamNames.class);
		return theQuery.getResultList();
	}

	@Override
	@Transactional
	public void saveExamName(ExamNames name) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(name);
		
	}

	@Override
	@Transactional
	public void deleteExamName(String name) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("delete from ExamNames as o where o.name=:name");
		theQuery.setParameter("name", name);
		theQuery.executeUpdate();
	    Query theQuery2 = currentSession.createQuery("delete from StudentMarks as o where o.examName=:name1");
	    theQuery2.setParameter("name1", name);
	    theQuery2.executeUpdate();
		
	}

	@Override
	@Transactional
	public List getMarksOfTheStudent(String reg) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("from StudentMarks where regNo=:reg",StudentMarks.class);
		theQuery.setParameter("reg", reg);
		return theQuery.getResultList();
	}

	@Override
	@Transactional
	public void addALibBook(LibraryBooks lib) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(lib);
		
	}

	@Override
	@Transactional
	public List<LibraryBooks> getBooks() {
		
		Session currentSession = sessionFactory.getCurrentSession();
	
		Query theQuery = currentSession.createQuery("from LibraryBooks", LibraryBooks.class);
		return theQuery.getResultList();
	}

	@Override
	@Transactional
	public void deleteBook(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("delete from LibraryBooks as o where o.id=:id");
		theQuery.setParameter("id",id);
		theQuery.executeUpdate();
		
	}

	@Override
	@Transactional
	public void saveBill(Bills bill) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(bill);
		
	}

	@Override
	@Transactional
	public void updateStudentfees(String regNo, String amt) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("update UserStudent set feesPaid=:amt where registrationNumber=:reg");
		theQuery.setParameter("amt", Integer.parseInt(amt));
		theQuery.setParameter("reg", regNo);
		theQuery.executeUpdate();
		
	}

	@Override
	@Transactional
	public List<Bills> getBills() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("from Bills",Bills.class);
		 return theQuery.getResultList();
	}

	@Override
	@Transactional
	public List getStudentBillHistory(String registrationNumber) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("from Bills where regNo=:reg",Bills.class);
		theQuery.setParameter("reg", registrationNumber);
		return theQuery.getResultList();
	}

	@Override
	@Transactional
	public void saveStudentImage(byte[] bytes, String reg) {
	

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("update UserStudent set picture=:amt where registrationNumber=:reg");
		theQuery.setParameter("amt", bytes);
		theQuery.setParameter("reg", reg);
		theQuery.executeUpdate();
		
	}

	@Override
	@Transactional
	public void updateStudentInfo(int id, String fullName, Date startDate, String mobContact, String email,
			String guardianName) {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("update UserStudent set fullName=:fullName, dob=:startDate, mobContact=:mobContact, guardianName=:gur, email=:email where id=:id");
		theQuery.setParameter("fullName",fullName);
		theQuery.setParameter("startDate",startDate);
		theQuery.setParameter("mobContact",mobContact);
		theQuery.setParameter("email",email);
		theQuery.setParameter("gur",guardianName);
		theQuery.setParameter("id",id);
		theQuery.executeUpdate();
		
	}

	@Override
	@Transactional
	public void saveFacultyImage(byte[] bytes, int reg) {

		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("update FacultyList set photo=:amt where id=:reg");
		theQuery.setParameter("amt", bytes);
		theQuery.setParameter("reg", reg);
		theQuery.executeUpdate();
		
		
	}

	@Override
	@Transactional
	public void saveFaculty(int id, String name, String designation, String qualification, String gender,
			String contact) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("update FacultyList set designation=:deg, name=:name, qualification=:qual, gender=:gen, contact=:contact where id=:id");
		theQuery.setParameter("id",id);
		theQuery.setParameter("deg", designation);
		theQuery.setParameter("qual", qualification);
		theQuery.setParameter("contact",contact);
		theQuery.setParameter("gen", gender);
		theQuery.setParameter("name", name);
		theQuery.executeUpdate();
	}

	@Override
	@Transactional
	public String validatePlaUser(String uname) {


Session currentSession = sessionFactory.getCurrentSession();
		
		Query<PlacementDepartment> theQuery = currentSession.createQuery("select p.username from PlacementDepartment p");
		
		List<PlacementDepartment> theList = theQuery.getResultList();
		
		Iterator it = theList.iterator();
		
		int c=0;
		
		while(it.hasNext()){
			 
			String i = (String)it.next();
					
			if(i.equals(uname))
			{
				c++;
				break;
			}
		}
		
		if(c>0){
		return "n";
		}
		else
			return "a";
		
		
		
	
	}

	@Override
	@Transactional
	public void savePlaAcc(PlacementDepartment pd) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(pd);
		
	}

	@Override
	@Transactional
	public String validateLibUser(String uname) {
		

        Session currentSession = sessionFactory.getCurrentSession();
		
		Query<LibraryDeparement> theQuery = currentSession.createQuery("select p.username from LibraryDeparement p");
		
		List<LibraryDeparement> theList = theQuery.getResultList();
		
		Iterator it = theList.iterator();
		
		int c=0;
		
		while(it.hasNext()){
			 
			String i = (String)it.next();
					
			if(i.equals(uname))
			{
				c++;
				break;
			}
		}
		
		if(c>0){
		return "n";
		}
		else
			return "a";
		
		
	}

	@Override
	@Transactional
	public void saveLibAcc(LibraryDeparement pd) {
        Session currentSession = sessionFactory.getCurrentSession();
		
		currentSession.saveOrUpdate(pd);
		
		
	}

	@Override
	@Transactional
	public String validateExaUser(String uname) {
        Session currentSession = sessionFactory.getCurrentSession();
		
		Query<ExamDepartment> theQuery = currentSession.createQuery("select p.username from ExamDepartment p");
		
		List<ExamDepartment> theList = theQuery.getResultList();
		
		Iterator it = theList.iterator();
		
		int c=0;
		
		while(it.hasNext()){
			 
			String i = (String)it.next();
					
			if(i.equals(uname))
			{
				c++;
				break;
			}
		}
		
		if(c>0){
		return "n";
		}
		else
			return "a";
		
	}

	@Override
	@Transactional
	public void saveExaAcc(ExamDepartment pd) {
		
		 Session currentSession = sessionFactory.getCurrentSession();
			
			currentSession.saveOrUpdate(pd);
	}

	@Override
	@Transactional
	public String validateAccUser(String uname) {
		
Session currentSession = sessionFactory.getCurrentSession();
		
		Query<AccountsDepartment> theQuery = currentSession.createQuery("select p.username from AccountsDepartment p");
		
		List<AccountsDepartment> theList = theQuery.getResultList();
		
		Iterator it = theList.iterator();
		
		int c=0;
		
		while(it.hasNext()){
			 
			String i = (String)it.next();
					
			if(i.equals(uname))
			{
				c++;
				break;
			}
		}
		
		if(c>0){
		return "n";
		}
		else
			return "a";
		
	}
	@Override
	@Transactional
	public void saveAccAcc(AccountsDepartment pd) {
		
		 Session currentSession = sessionFactory.getCurrentSession();
			
			currentSession.saveOrUpdate(pd);
	}

	@Override
	@Transactional
	public List<PlacementDepartment> getPlacementDeptUsers() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("from PlacementDepartment",PlacementDepartment.class);
		
		return theQuery.getResultList();
	}

	@Override
	@Transactional
	public void deleteOtherAdmins(String dept, int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from "+dept+" as o where o.id=:id");
		theQuery.setParameter("id",id);
		theQuery.executeUpdate();
		
		
		
		
	}

	@Override
	@Transactional
	public List<LibraryDeparement> getLibraryDeptUsers() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("from LibraryDeparement",LibraryDeparement.class);
		
		return theQuery.getResultList();
	}

	@Override
	@Transactional
	public List<ExamDepartment> getExamDeptUsers() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("from ExamDepartment",ExamDepartment.class);
		
		return theQuery.getResultList();
	}

	@Override
	@Transactional
	public List<AccountsDepartment> getAccDeptUsers() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("from AccountsDepartment",AccountsDepartment.class);
		
		return theQuery.getResultList();
	}

	@Override
	@Transactional
	public void updateFullStudentInfo(int idd, String h, String fn, String rn, Date sd, String mc, String e, String p,int ay, String g, String b, String gn, int tf, int fp,int hstlbedNo, String lat) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("update UserStudent set hostel=:b, fullName=:c, registrationNumber=:d, dob=:e, mobContact=:f, email=:g, password=:h, admissionYear=:i, lateral=:lat, gender=:j, branch=:k, guardianName=:l, totalFees=:m, feesPaid=:n, hostelBedNo=:hstlbedNo where id=:a");
        theQuery.setParameter("a", idd);
        theQuery.setParameter("b",h);
        theQuery.setParameter("c",fn);
        theQuery.setParameter("d",rn);
        theQuery.setParameter("e",sd);
        theQuery.setParameter("f",mc);
        theQuery.setParameter("g",e);
        theQuery.setParameter("h",p);
        theQuery.setParameter("i",ay);
        theQuery.setParameter("j",g);
        theQuery.setParameter("k",b);
        theQuery.setParameter("l",gn);
        theQuery.setParameter("m",tf);
        theQuery.setParameter("n",fp);
        theQuery.setParameter("lat",lat);
        theQuery.setParameter("hstlbedNo",hstlbedNo);
		theQuery.executeUpdate();
	}

	@Override
	@Transactional
	public byte[] loadNoImage(int i) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		NoPhoto imgNew = (NoPhoto)currentSession.get(NoPhoto.class, i);
		return imgNew.getPic();
		
		
	}

	@Override
	@Transactional
	public void changeExamPass(String name, int idd, String pass) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("update ExamDepartment set name =:name, password =:pass where id=:id");
		
		theQuery.setParameter("name",name);
		theQuery.setParameter("id",idd);
		theQuery.setParameter("pass",pass);
		theQuery.executeUpdate();
	}

	@Override
	@Transactional
	public void changeLibPass(String name, int idd, String pass) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("update LibraryDeparement set name =:name, password =:pass where id=:id");
		
		theQuery.setParameter("name",name);
		theQuery.setParameter("id",idd);
		theQuery.setParameter("pass",pass);
		theQuery.executeUpdate();
		
	}

	@Override
	@Transactional
	public void changeAccPass(String name, int idd, String pass) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("update AccountsDepartment set name =:name, password =:pass where id=:id");
		
		theQuery.setParameter("name",name);
		theQuery.setParameter("id",idd);
		theQuery.setParameter("pass",pass);
		theQuery.executeUpdate();
		
	}

	@Override
	@Transactional
	public String validateFacUser(String uname) {
		
Session currentSession = sessionFactory.getCurrentSession();
		
		Query<FacultyList> theQuery = currentSession.createQuery("select p.username from FacultyList p");
		
		List<FacultyList> theList = theQuery.getResultList();
		
		Iterator it = theList.iterator();
		
		int c=0;
		
		while(it.hasNext()){
			 
			String i = (String)it.next();
					
			if(i.equals(uname))
			{
				c++;
				break;
			}
		}		
		if(c>0){
		return "n";
		}
		else
			return "a";
		
	}

	@Override
	@Transactional
	public ArrayList<String> getVacantBeds(String hostel) {
		Session currentSession = sessionFactory.getCurrentSession();
		ArrayList<String> list = new ArrayList<String>();
		Query theQuery = currentSession.createQuery("select p.number from BlankHostelBeds as p where hostelName=:name");
		theQuery.setParameter("name",hostel);
		System.out.println("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="+theQuery.getSingleResult());
		String str = theQuery.getSingleResult().toString();
		String s = "";
		for(int i =0;i<str.length();i++){
			char c = str.charAt(i);
			
			if(c != '[' && c != ']' && c != ','){
				s = s + c;
			}
			if(c == ',' || c == ']'){
				s.trim();
				list.add(s);
				s="";
			}
			
		}
		
		return list;
	}

	@Override
	@Transactional
	public void saveBlankBed(String string, String hostel) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("update BlankHostelBeds set number =:no where hostelName=:name");
		theQuery.setParameter("no", string);
		theQuery.setParameter("name", hostel);
		
		theQuery.executeUpdate();
		
		
	}

	@Override
	@Transactional
	public int getBedNos(String hostelName, String gender) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		System.out.println("--------------------------------------------"+hostelName+"---------------------------------------------------");
		int beds;
		if(gender.equals("Male")){
		Query<BoysHostel> theQuery = currentSession.createQuery("from BoysHostel where hostelName=:hstl");
		
		
		theQuery.setParameter("hstl", hostelName);
		List<BoysHostel> theList = theQuery.getResultList();
	    beds = theList.get(0).getNoOfOccupiedBeds();
	    
	  
	   
		}
		else{
			Query<GirlsHostel> theQuery = currentSession.createQuery("from GirlsHostel where hostelName=:hstl");
			
			theQuery.setParameter("hstl",hostelName);
			List<GirlsHostel> theList = theQuery.getResultList();
		    beds = theList.get(0).getNoOfOccupiedBeds();
			
			
		}
		return beds;
	}

	@Override
	@Transactional
	public void addBlankBedsSlot(String string, String name) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		
		BlankHostelBeds b = new BlankHostelBeds();
		
		if(string.equals("g")){
			b.setHostelName(name);
			b.setNumber("[]");
			currentSession.saveOrUpdate(b);
		}
		if(string.equals("b")){
			b.setHostelName(name);
			b.setNumber("[]");
			currentSession.saveOrUpdate(b);
		}
		
	}

	@Override
	@Transactional
	public void editedHostelName(String old, String n) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("update BlankHostelBeds set hostelName=:new where hostelName=:old");
		theQuery.setParameter("new",n);
		theQuery.setParameter("old", old);
		theQuery.executeUpdate();
	}

	@Override
	@Transactional
	public void deleteTheBlankBeds(String nme) {
Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("delete from BlankHostelBeds where hostelName=:nme");
		
		theQuery.setParameter("nme", nme);
		theQuery.executeUpdate();
		
	}

	@Override
	@Transactional
	public String getStudent(String d) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("from UserStudent as p where p.registrationNumber=:ddd");
		theQuery.setParameter("ddd", d);
		List<UserStudent> theList = theQuery.getResultList();
		String reg = theList.get(0).getFullName();
		String id = Integer.toString(theList.get(0).getId());
		System.out.println("-===-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="+reg);
		return reg+id;
	}

	@Override
	@Transactional
	public List<UserStudent> getSpecificStudent(String id) {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("from UserStudent where id=:id");
		theQuery.setParameter("id", Integer.parseInt(id));
		return theQuery.getResultList();
	}

	@Override
	@Transactional
	public List<LibraryBooks> showBooks() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query theQuery = currentSession.createQuery("from LibraryBooks");
		
		return theQuery.getResultList();
	}
	
}