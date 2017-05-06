

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MultivaluedMap;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

/**
 * Servlet implementation class submitCart
 */
@WebServlet("/submitCart")
public class submitCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public submitCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("in submit post");
		MultivaluedMap<String, String> formData = new MultivaluedMapImpl();
		
		formData.add("userid", (String) request.getSession().getAttribute("userid"));
		formData.add("secretKey", Constants.secretKey);
		
		String requestString = Constants.SUBMITSHOPPINGCARTAPI;
		Client client = Client.create();
		WebResource webResource = client
		   .resource(requestString);
		ClientResponse jsonResponse = webResource.accept("application/json")
			    .post(ClientResponse.class, formData);

				
			if (jsonResponse.getStatus() != 200) {
			   throw new RuntimeException("Failed : HTTP error code : "
				+ jsonResponse.getStatus());
			}
		
		response.sendRedirect("Home.jsp");
	}

}
