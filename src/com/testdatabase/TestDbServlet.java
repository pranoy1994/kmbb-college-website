package com.testdatabase;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;

/**
 * Servlet implementation class TestDbServlet
 */
@WebServlet("/TestDbServlet")
public class TestDbServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public TestDbServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//setup connection variables
		String user="springstudent";
		String pass="springstudent";
		String jdbcUrl="jdbc:mysql://localhost:3306/college_database?useSSL=false";
		
		String driver="com.mysql.jdbc.Driver";
		
		//get the connection
		
		try{
			
			PrintWriter out = response.getWriter();
			

			ArrayList l = new ArrayList();
		
			out.println(l);
			
			
			out.print("Connecting to databsae...");
			Class.forName(driver);
			Connection myCon=DriverManager.getConnection(jdbcUrl,user,pass);
			
			out.print("Connection secessful!!!");
			 myCon.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	
	
		
	
	}

}
