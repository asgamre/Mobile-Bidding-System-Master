import java.io.IOException;

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

@WebServlet("/AddPost")
public class AddPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Initialize optional parameters
		Signin.disableCertificateValidation();
		String companyName = request.getParameter("companyName");
		
		if (companyName == null)
		{
			companyName = "";
		}
		

		String requestString = Constants.ADDPOSTAPI;
		Client client = Client.create();
		WebResource webResource = client
		   .resource(requestString);

		MultivaluedMap formData = new MultivaluedMapImpl();
		formData.add("userid", request.getSession().getAttribute("userid"));
		formData.add("mobileName", request.getParameter("mobile"));
		formData.add("companyName", companyName);
		formData.add("price", request.getParameter("price"));
		formData.add("secretKey", Constants.secretKey);
		
		ClientResponse jsonResponse = webResource
		    .type(MediaType.APPLICATION_FORM_URLENCODED_TYPE)
		    .post(ClientResponse.class, formData);


		if (jsonResponse.getStatus() != 200) {
		   throw new RuntimeException("Failed : HTTP error code : "
			+ jsonResponse.getStatus());
		}
		
		response.sendRedirect("Home.jsp");
	}
}
