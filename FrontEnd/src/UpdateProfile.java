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
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

/**
 * Servlet implementation class Update Profile
 */
@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Signin.disableCertificateValidation();
		System.out.println("In update Profile");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String state = request.getParameter("state");
		String gender = request.getParameter("gender");

		Client client = Client.create();

		String requestString = Constants.UPDATEAPI;
		System.out.println("request string is: "+requestString);
		WebResource webResource = client
		   .resource(requestString);
		System.out.println("Name is: "+name);
		MultivaluedMap formData = new MultivaluedMapImpl();
		
		formData.add("name", name);
		formData.add("userid", request.getSession().getAttribute("userid"));
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


		if (jsonResponse.getStatus() != 200) {
			if(jsonResponse.getStatus() == 300){
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('Error');");
			   out.println("location='UpdateProfile.jsp';");
			   out.println("</script>");	
		}
		else{
	   throw new RuntimeException("Failed : HTTP error code : "
		+ jsonResponse.getStatus());
		}		   
		}

		request.getSession().setAttribute("name", name);
		//response.getWriter().println("Success Data");
		//response.getWriter().close();
		//request.getRequestDispatcher("GetProfile.jsp").forward(request, response);
		response.sendRedirect("GetProfile.jsp");
		//request.getRequestDispatcher("/GetProfile.jsp").forward(request, response);
	}

}
