package com.collegewebsite.springhibernate.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.collegewebsite.springhibernate.entity.AccountsDepartment;
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

public interface DataAccessObject {

	public String loginStudent(String registrationNumber,String password);
	
	public List<Notifications> showNotifications();

	public List<UserStudent> getStudentInfo(String username);

	byte[] loadImages(int id);

	String loginAdmin(String username, String password);

	public void saveStudent(UserStudent student);

	public List<UserStudent> getStudentList(String year, String branch);

	public void deleteStudent(int id);

	public void addNotice(Notifications notice);

	public void deleteNotice(int id);

	public List<FacultyList> getFacultyList(String dept);

	public byte[] loadFacultyImages(int id);

	public void saveFaculty(FacultyList facultyList);

	public byte[] loadHomeScreenImage(int id);

	public void saveHomeScreenPhotos(HomeScreenPictures pic);

	public List<HomeScreenPictures> showHomeScreenPictures();

	public void deleteHomeScreenPictures(int id);

	public List<GirlsHostel> getGirlsHostelList();

	public List<BoysHostel> getBoysHostelList();

	public void addGirlsHostel(GirlsHostel hostel);

	public void addBoysHostel(BoysHostel hostel);

	public void deleteThisHostel(int id, String hostel);

	public int getHostelBedNo(String hostelName, String gender);

	public void addPayment(String lastname, String amount);

	public List<UserStudent> getFullStudentList();

	public void updateHostel(String male, String hostel);

	public void savePlacement(Placement placement);

	public List<Placement> getPlacement();

	public byte[] loadCompanyLogo(int id);

	public void deletePlacement(int id);

	public List<Departments> getDepartmentList(int i);

	public void deleteFaculty(int id);

	public String checkRegNo(String reg);

	public void saveMessage(String name, String email, String message);

	public List<Message> getMessage();

	public void deleteMsg(int id);

	public void saveGalley(Gallery gallery);

	public void saveGalleryAlbumName(GalleryAlbumName name);

	public List getGalleryAlbumName();

	public List getIdByAlbumName(String albumName);

	byte[] loadGalleryImages(int id);

	public void saveFeedback(Testimonials feedback);

	public List<Testimonials> showTestimonial();

	public void deleteFed(int id);

	public void deleteAlbum(String name);

	public byte[] loadDepPhoto(int id);

	public void changePass(String name, String pass);

	public void changePassStudent(int id, String pass);

	public String loginFaculty(String usrername, String password);

	List getFaculty(String username);

	public String loginPlace(String username, String password);

	public List getPlacementPage(String username);

	public String loginExam(String username, String password);

	public List getExamPage(String username);

	public String loginLib(String username, String password);

	public List getlibraryPage(String username);

	public String loginAcc(String username, String password);

	public List getAccPage(String username);

	public List<FacultyList> getFullFacList();

	public void addMarkOfStudent(StudentMarks st);

	public List getMarks();

	public void saveExamName(ExamNames name);

	public void deleteExamName(String name);

	public List getMarksOfTheStudent(String registrationNumber);

	public void addALibBook(LibraryBooks lib);

	public List<LibraryBooks> getBooks();

	public void deleteBook(int id);

	public void saveBill(Bills theBill);

	public void updateStudentfees(String regNo, String amt);

	public List<Bills> getBills();

	public List getStudentBillHistory(String registrationNumber);

	public void saveStudentImage(byte[] bytes, String reg);

	public void updateStudentInfo(int id, String fullName, Date startDate, String mobContact, String email,
			String guardianName);

	public void saveFacultyImage(byte[] bytes, int reg);

	public void saveFaculty(int id, String name, String designation, String qualification, String gender,
			String contact);

	public String validatePlaUser(String uname);

	public void savePlaAcc(PlacementDepartment pd);

	public String validateLibUser(String uname);

	public void saveLibAcc(LibraryDeparement pd);

	public String validateExaUser(String uname);

	public void saveExaAcc(ExamDepartment pd);

	public String validateAccUser(String uname);

	void saveAccAcc(AccountsDepartment pd);

	public List<PlacementDepartment> getPlacementDeptUsers();

	public void deleteOtherAdmins(String dept, int id);

	public List<LibraryDeparement> getLibraryDeptUsers();

	public List<ExamDepartment> getExamDeptUsers();

	public List<AccountsDepartment> getAccDeptUsers();

	//public void updateFullStudentInfo(int idd, String h, String fn, String rn, Date sd, String mc, String e, String p,
		//	int ay, String g, String b, String gn, int tf, int fp,int hstlbedNo);

	public void updateFullStudentInfo(int idd, String h, String fn, String rn, Date sd, String mc, String e, String p,
			int ay, String g, String b, String gn, int tf, int fp, int hstlbedNo, String l);

	public byte[] loadNoImage(int i);

	public void changeFacultyPass(int idd, String pass);

	public void changePlacePass(String name, int idd, String pass);

	public void changeExamPass(String name, int idd, String pass);

	public void changeLibPass(String name, int idd, String pass);

	public void changeAccPass(String name, int idd, String pass);

	public String validateFacUser(String uname);

	public ArrayList<String> getVacantBeds(String hostel);

	public void saveBlankBed(String string, String hostel);

	public int getBedNos(String hostel, String gender);

	public void addBlankBedsSlot(String string, String name);

	public void editedHostelName(String old, String n);

	public void deleteTheBlankBeds(String nme);

	public String getStudent(String d);

	public List<UserStudent> getSpecificStudent(String id);

	public List<LibraryBooks> showBooks();



}
