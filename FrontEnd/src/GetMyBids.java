import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import java.io.IOException;
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
 * Servlet implementation class GetMyBids
 */
@WebServlet("/GetMyBids")
public class GetMyBids extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMyBids() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		Signin.disableCertificateValidation();
		String userid = (String) request.getSession().getAttribute("userid");
		String requestString = Constants.GETMYBIDSAPI + userid;
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
		
		request.getRequestDispatcher("Bids.jsp").forward(request, response);
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
		System.out.println("Hi");}
		
		//		doGet(request, response);
		//	request.getRequestDispatcher("/WEB-INF/SinglePost.jsp").forward(request, response);
		
		
		
	}
	
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("in delete");
		String bidid=req.getParameter("bid_id");
		System.out.println("bidId"+bidid);
		String requestString = Constants.DELETEBIDS +bidid;
		
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
