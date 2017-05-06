import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import org.json.JSONException;
import org.json.JSONObject;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

/**
 * Servlet implementation class Profile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	/*
	 * public Profile() { super(); // TODO Auto-generated constructor stub }
	 */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Signin.disableCertificateValidation();
		try {
			String userid = (String) request.getSession().getAttribute("userid");

			Client client = Client.create();

			String requestString = Constants.GETPROFILEAPI + userid;
			WebResource webResource = client.resource(requestString);

			ClientResponse jsonResponse = webResource.accept("application/json").get(ClientResponse.class);
			if (jsonResponse.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + jsonResponse.getStatus());
			}

			String output = jsonResponse.getEntity(String.class);

			JSONObject jsonObj = new JSONObject(output);
			String name = jsonObj.getString("name");
			System.out.println("Value on getting: "+name);
			String email = jsonObj.getString("email");
			String address = jsonObj.getString("address");
			String city = jsonObj.getString("city");
			String country = jsonObj.getString("country");
			String state = jsonObj.getString("state");
			String lastLoginDate = jsonObj.getString("lastLoginDate");
			String lastLoginTime = jsonObj.getString("lastLoginTime");
			String location = jsonObj.getString("location");


			String gender = jsonObj.getString("gender");
			System.out.println("Gender is: "+gender);
			System.out.println("Output from Server .... \n");
			request.setAttribute("name", name);
			System.out.println("After setting .... \n" + request.getAttribute("name"));
			request.setAttribute("email", email);
			request.setAttribute("address", address);
			request.setAttribute("city", city);
			request.setAttribute("state", state);
			request.setAttribute("country", country);
			request.setAttribute("gender", gender);
			request.setAttribute("lastLoginDate", lastLoginDate);
			request.setAttribute("lastLoginTime", lastLoginTime);
			request.setAttribute("location", location);
			if (gender.equals("M")) {
				request.setAttribute("gendertype", 1);

			} else {
				request.setAttribute("gendertype", 0);
			}
			request.getRequestDispatcher("ProfilePage.jsp").forward(request, response);
			//response.sendRedirect(request.getContextPath() + "/ProfilePage.jsp");
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
}