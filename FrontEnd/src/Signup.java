

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import org.json.JSONException;
import org.json.JSONObject;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;
/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Signin.disableCertificateValidation();
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String state = request.getParameter("state");
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String repassword = request.getParameter("reenterpassword");
		String gender = request.getParameter("gender");
		
		Client client = Client.create();

		String requestString = Constants.SIGNUPAPI;
		System.out.println("request string is: "+requestString);
		WebResource webResource = client
		   .resource(requestString);

		MultivaluedMap formData = new MultivaluedMapImpl();
		formData.add("userName", userName);
		formData.add("password", password);
		formData.add("name", name);
		formData.add("address", address);
		formData.add("city", city);
		formData.add("state", state);
		formData.add("country", country);
		formData.add("email", email);
		formData.add("gender", gender);
		formData.add("secretKey", Constants.secretKey);
		
		ClientResponse jsonResponse = webResource
		    .type(MediaType.APPLICATION_FORM_URLENCODED_TYPE)
		    .post(ClientResponse.class, formData);
		System.out.println("sss"+jsonResponse);

		if (jsonResponse.getStatus() != 200) {
			if(jsonResponse.getStatus() == 300){
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				   out.println("alert('Error');");
				   out.println("location='LoginPage.jsp';");
				   out.println("</script>");	
			}
			else{
		   throw new RuntimeException("Failed : HTTP error code : "
			+ jsonResponse.getStatus());
			}
		}
		try {
			requestString = Constants.SIGNINAPI + userName + "/"+password;
			System.out.println("request string is: "+requestString);
			webResource = client
			   .resource(requestString);
			jsonResponse = webResource
				    .type(MediaType.APPLICATION_FORM_URLENCODED_TYPE)
				    .get(ClientResponse.class);
			String output = jsonResponse.getEntity(String.class);
		
			HttpSession session = request.getSession();
			JSONObject jsonObj = new JSONObject(output);

			session.setAttribute("name", jsonObj.getString("name") );
			session.setAttribute("userid", jsonObj.getString("userId"));
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		response.sendRedirect("Home.jsp");
	}

}
