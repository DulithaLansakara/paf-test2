package model;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ItemsAPI
 */
@WebServlet("/UserAPI")
public class UserAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	User UserObj = new User();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String output = UserObj.insertUser(request.getParameter("User_ID"), request.getParameter("User_Name"),
				request.getParameter("User_DOB"), request.getParameter("User_Email"), request.getParameter("User_Gender"),
				request.getParameter("User_Phone_No"), request.getParameter("User_Address"));
		
		response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	
	private static Map getParasMap(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";
			scanner.close();
			String[] params = queryString.split("&");
			for (String param : params) {

				String[] p = param.split("=");
				map.put(p[0], p[1]);
			}
		} catch (Exception e) {
		}
		return map;
	}
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map paras = getParasMap(request);
		String output = UserObj.updateUser(paras.get("hidUserID_tblSave").toString(), paras.get("User_ID").toString(),
				paras.get("User_Name").toString(), paras.get("User_DOB").toString(), paras.get("User_Email").toString()
				, paras.get("User_Gender").toString(), paras.get("User_Phone_No").toString(), paras.get("User_Address").toString()
				);
		response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map paras = getParasMap(request);
		String output = UserObj.deleteUser(paras.get("UserID_tbl").toString());
		response.getWriter().write(output);
	}

}

