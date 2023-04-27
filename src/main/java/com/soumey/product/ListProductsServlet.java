package com.soumey.product;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebServlet("/ListProducts")
public class ListProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ProductDetails> products = getAllProducts();
		request.setAttribute("products", products);
		request.getRequestDispatcher("products.jsp").forward(request, response);
		
	}
	
	public List<ProductDetails> getAllProducts() {
		List<ProductDetails> products = new ArrayList<>();
		try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/AlchemistCorner?useSSL=false", "root", "root");
			 PreparedStatement stmt = conn.prepareStatement("SELECT * FROM products");
			 ResultSet rs = stmt.executeQuery()) {
			
			while (rs.next()) {
				ProductDetails product = new ProductDetails();
				product.setId(rs.getInt("id"));
				product.setName(rs.getString("name"));
				product.setDesc(rs.getString("description"));
				product.setCategory(rs.getString("category"));
				product.setPrice(rs.getString("price"));
				product.setImg(rs.getString("image"));
				products.add(product);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return products;
	}
	
	public List<Cart> getCartProducts(ArrayList<Cart> cartList)
	{
		List<Cart> products=new ArrayList<Cart>();
		
		try(Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/AlchemistCorner?useSSL=false", "root", "root");
				 PreparedStatement pst = con.prepareStatement("SELECT * FROM products where id=?");
				 ResultSet rs = pst.executeQuery()) {
			if(cartList.size()>0)
			{
				for(Cart item:cartList)
				{
					pst.setInt(1,item.getId());
					while(rs.next())
					{
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getString("price"));
						products.add(row);
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
}