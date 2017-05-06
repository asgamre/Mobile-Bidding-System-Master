

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import org.codehaus.jackson.jaxrs.JacksonJaxbJsonProvider;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.GenericType;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.json.JSONConfiguration;
import com.sun.jersey.core.util.MultivaluedMapImpl;

/**
 * Servlet implementation class ShoppingCart
 */
@WebServlet("/ShoppingCart")
public class ShoppingCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCart() {
        super();
        // TODO Auto-generated constructor stub
           
    }



	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userid = (String) request.getSession().getAttribute("userid");
		
		String requestString = Constants.GETMYCART + userid;
		ClientConfig config = new DefaultClientConfig();
	    config.getClasses().add(JacksonJaxbJsonProvider.class);
	    config.getFeatures().put(JSONConfiguration.FEATURE_POJO_MAPPING, Boolean.TRUE);
		Client client = Client.create(config);
		WebResource webResource = client
		   .resource(requestString);

		ClientResponse jsonResponse = webResource.accept("application/json")
                   .get(ClientResponse.class);

		if (jsonResponse.getStatus() != 200) {
		   throw new RuntimeException("Failed : HTTP error code : "
			+ jsonResponse.getStatus());
		}
		ArrayList<HashMap> listItems = jsonResponse.getEntity(new GenericType<ArrayList<HashMap>>(){});

		//JSONObject jsonObj = new JSONObject(output);
		//System.out.println("Output is "+listItems);
		request.setAttribute("username", userid);
		request.setAttribute("listItems", listItems);
		
		
		request.getRequestDispatcher("Cart.jsp").forward(request, response);
		
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("in post");
		System.out.println(request.getParameter("action"));
		if("remove".equals(request.getParameter("action"))){
			doDelete(request, response);
			doGet(request, response);
		}
		else{
		System.out.println("Hi");
		
		String bidId = request.getParameter("bidId");
		String postId = request.getParameter("postId");
		System.out.println("bid & post:"+bidId+postId);
		
		MultivaluedMap<String, String> formData = new MultivaluedMapImpl();
		
		formData.add("userid", (String) request.getSession().getAttribute("userid"));
		formData.add("bidId",bidId);
		formData.add("postId", postId);
		formData.add("secretKey", Constants.secretKey);
		
		String requestString = Constants.ADDSHOPPINGCARTAPI;
		Client client = Client.create();
		WebResource webResource = client
		   .resource(requestString);
		ClientResponse jsonResponse = webResource.accept("application/json")
			    .post(ClientResponse.class, formData);

				
			if (jsonResponse.getStatus() != 200) {
			   throw new RuntimeException("Failed : HTTP error code : "
				+ jsonResponse.getStatus());
			}
		doGet(request, response);
		//	request.getRequestDispatcher("/WEB-INF/SinglePost.jsp").forward(request, response);
		
		
		
	}
	}



	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("hry");
		String shoppingcartid=req.getParameter("shoppingcartid");
		System.out.println("shoppingCartId"+shoppingcartid);
		String requestString = Constants.DELETEITEMCART +shoppingcartid;
		
		ClientConfig config = new DefaultClientConfig();
	    config.getClasses().add(JacksonJaxbJsonProvider.class);
	    config.getFeatures().put(JSONConfiguration.FEATURE_POJO_MAPPING, Boolean.TRUE);
		Client client = Client.create(config);
		WebResource webResource = client
		   .resource(requestString);
	
		ClientResponse jsonResponse = webResource.accept("application/json")
			    .delete(ClientResponse.class);
		if (jsonResponse.getStatus() != 200) {
			   throw new RuntimeException("Failed : HTTP error code : "
				+ jsonResponse.getStatus());
			}
	//	doGet(req, resp);
	}



	
		
}
