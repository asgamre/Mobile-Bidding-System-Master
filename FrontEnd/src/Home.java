import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Signin.disableCertificateValidation();
		ClientConfig config = new DefaultClientConfig();
	    config.getClasses().add(JacksonJaxbJsonProvider.class);
	    config.getFeatures().put(JSONConfiguration.FEATURE_POJO_MAPPING, Boolean.TRUE);
		Client client = Client.create(config);

		String requestString = Constants.GETHOMEPOSTSAPI;
		WebResource webResource = client
		   .resource(requestString);

		ClientResponse jsonResponse = webResource.accept("application/json")
                   .get(ClientResponse.class);

		if (jsonResponse.getStatus() != 200) {
			//request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
		}
		ArrayList<HashMap> output = jsonResponse.getEntity(new GenericType<ArrayList<HashMap>>(){});
		request.setAttribute("output", output);

		request.getRequestDispatcher("HomePage.jsp").forward(request, response);
	}
}
