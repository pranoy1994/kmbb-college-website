package com.collegewebsite.springhibernate.controller;


import java.io.IOException;


import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.collegewebsite.springhibernate.dao.DataAccessObject;

@Controller
@RequestMapping("/image")
public class ImageController {

	@Autowired
	private DataAccessObject dao;
	
	@GetMapping("/getImage")
		public void getImage(@RequestParam("id") int id, HttpServletResponse response)
	{    
    		byte[] img = dao.loadImages(id);
    		byte[] NOPIC = dao.loadNoImage(1);
  
    		if (img != null) {
    			response.setContentType("image/jpg");
    			try {
    				response.getOutputStream().write(img);
    				response.getOutputStream().flush();
    				response.getOutputStream().close();
    			} catch (IOException e) {
    				e.printStackTrace();
    			}
    		}
    		else{ 
    			response.setContentType("image/jpg");
    			
    			try{ 
    				response.getOutputStream().write(NOPIC);
    				response.getOutputStream().flush();
    				response.getOutputStream().close();
    						} catch(Exception e)    			
    			{
    				e.printStackTrace();    					
    			}
			
    		}
    
    	}
	
	@GetMapping("/getFacultyImage")
	public void getFacultyImage(@RequestParam("id") int id,HttpServletResponse response){
		
		byte[] img = dao.loadFacultyImages(id);
		byte[] NOPIC = dao.loadNoImage(1);
		if (img != null) {
			response.setContentType("image/jpg");
			try {
				response.getOutputStream().write(img);
				response.getOutputStream().flush();
				response.getOutputStream().close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		else{ 
			response.setContentType("image/jpg");
			
			try{ 
				response.getOutputStream().write(NOPIC);
				response.getOutputStream().flush();
				response.getOutputStream().close();
				
				
			
				
				
			} catch(Exception e)    			
			{
				e.printStackTrace();    					
			}

			
			
			
			
			
		}
		
		
	}
	
	@GetMapping("/getHomeScreenImage")
	public void getHomeScreenImage(@RequestParam("id")int id, HttpServletResponse response ){
		
		byte[] img = dao.loadHomeScreenImage(id);
		if(img != null){
			response.setContentType("image/jpg");
			try{
				response.getOutputStream().write(img);
				response.getOutputStream().flush();
				response.getOutputStream().close();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@GetMapping("/getPlacementLogo")
	public void getPlacementLogo(@RequestParam("id")int id, HttpServletResponse response){
		
		byte[] img = dao.loadCompanyLogo(id);
		if(img != null){
			response.setContentType("image/jpg");
			try{
				response.getOutputStream().write(img);
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
	}
	
	@GetMapping("/getGalleryPhoto")
	public void getGalleryPhoto(@RequestParam("id")int id, HttpServletResponse response){
		
		byte[] img = dao.loadGalleryImages(id);
		if(img != null){
			response.setContentType("image/jpg");
			try{
				response.getOutputStream().write(img);
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
	}
	
	@GetMapping("/depPhoto")
	public void getDepPhoto(@RequestParam("id")int id, HttpServletResponse response){
		
		byte[] img = dao.loadDepPhoto(id);
		if(img != null){
			response.setContentType("image/jpg");
			try{
				response.getOutputStream().write(img);
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}catch(IOException e){
				e.printStackTrace();
			}
		}
	}
	
	
	
	}

