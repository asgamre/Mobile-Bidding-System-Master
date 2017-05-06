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

@WebServlet("/AddBid")
public class AddBid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBid() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//Initialize optional parameters
		System.out.println("Inside Addbid");
		Signin.disableCertificateValidation();
		String price = request.getParameter("price");
		String requestString = Constants.ADDBIDAPI;
		Client client = Client.create();
		WebResource webResource = client
		   .resource(requestString);

		System.out.println((String)request.getSession().getAttribute("username") + (String)request.getSession().getAttribute("password") + request.getParameter("postid") + price);
		MultivaluedMap formData = new MultivaluedMapImpl();
		formData.add("userid", request.getSession().getAttribute("userid"));
		formData.add("postID", String.valueOf(request.getParameter("postid")));
		formData.add("bidPrice", price);
		formData.add("secretKey", Constants.secretKey);
		
		ClientResponse jsonResponse = webResource
		    .type(MediaType.APPLICATION_FORM_URLENCODED_TYPE)
		    .post(ClientResponse.class, formData);

		if (jsonResponse.getStatus() != 200) {
		   throw new RuntimeException("Failed : HTTP error code : "
			+ jsonResponse.getStatus());
		}
		System.out.println("Exiting Addbid");
		response.sendRedirect("GetPost.jsp?postid="+request.getParameter("postid"));
		//request.getRequestDispatcher("GetPost.jsp?postid="+request.getParameter("postid")).forward(request, response);
	}
}
