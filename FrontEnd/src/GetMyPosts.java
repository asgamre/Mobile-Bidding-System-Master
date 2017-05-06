import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.jaxrs.JacksonJaxbJsonProvider;
import org.json.JSONException;
import org.json.JSONObject;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.GenericType;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.json.JSONConfiguration;

/**
 * Servlet implementation class GetMyPosts
 */
@WebServlet("/GetMyPosts")
public class GetMyPosts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    /*public Profile() {
        super();
        // TODO Auto-generated constructor stub
    }*/

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Inside Getmyposts");
		Signin.disableCertificateValidation();
		String userid = (String) request.getSession().getAttribute("userid");
		String requestString = Constants.GETMYPOSTSAPI + userid;
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
		ArrayList<HashMap> output = jsonResponse.getEntity(new GenericType<ArrayList<HashMap>>(){});

		System.out.println("Output is "+output);
		request.setAttribute("output", output);
		System.out.println("Exiting getmyposts");
		request.getRequestDispatcher("Posts.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("in post");
		System.out.println(request.getParameter("action"));
		if("remove".equals(request.getParameter("action"))){
			doDelete(request, response);
			doGet(request, response);
		}
		else{
			System.out.println("Hieee");
		}
		}
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("hry");
		String post_id=req.getParameter("post_id");
		System.out.println("post_id"+post_id);
		String requestString = Constants.DELETEPOST +post_id;
		
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