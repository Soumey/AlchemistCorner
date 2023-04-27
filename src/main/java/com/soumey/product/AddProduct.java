package com.soumey.product;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productName=request.getParameter("name");
		String productDescription=request.getParameter("description");
		String productCategory=request.getParameter("category");
		String productPrice=request.getParameter("price");
		String productImage=request.getParameter("image");
		RequestDispatcher dispatcher=null;
		Connection con=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/AlchemistCorner?useSSL=false","root","root");
			PreparedStatement pst= con.prepareStatement("insert into products(name,description,category,price,image) values(?,?,?,?,?) ");
			pst.setString(1, productName);
			pst.setString(2, productDescription);
			pst.setString(3, productCategory);
			pst.setString(4, productPrice);
			pst.setString(5, productImage);
			int rowCount=pst.executeUpdate();
			dispatcher=request.getRequestDispatcher("NewProduct.jsp");
			
			if(rowCount>0)
			{
				request.setAttribute("status", "success");
			}
			else
			{
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request,response);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
		
	

