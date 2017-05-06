

import java.io.IOException;
import java.security.SecureRandom;
import java.security.cert.X509Certificate;
import java.util.Date;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
/**
 * Servlet implementation class Login
 */
@WebServlet("/Signin")
public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signin() {
        super();
        // TODO Auto-generated constructor stub
    }

    public static void disableCertificateValidation() {
	    // Create a trust manager that does not validate certificate chains
	    TrustManager[] trustAllCerts = new TrustManager[] { 
	      new X509TrustManager() {
	        public X509Certificate[] getAcceptedIssuers() { 
	          return new X509Certificate[0]; 
	        }
	        public void checkClientTrusted(X509Certificate[] certs, String authType) {}
	        public void checkServerTrusted(X509Certificate[] certs, String authType) {}
	    }};

	    // Ignore differences between given hostname and certificate hostname
	    /*HostnameVerifier hv = new HostnameVerifier() {
	      public boolean verify(String hostname, SSLSession session) { return true; }
	    };*/

	    // Install the all-trusting trust manager
	    try {
	      SSLContext sc = SSLContext.getInstance("SSL");
	      sc.init(null, trustAllCerts, new SecureRandom());
	      HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
	      //HttpsURLConnection.setDefaultHostnameVerifier(hv);
	    } catch (Exception e) {}
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	disableCertificateValidation();
        String forwardPage = "";
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Client client = Client.create();

		String requestString = Constants.SIGNINAPI + username + "/"+password;
		System.out.println("requestStirng is: "+requestString);
		WebResource webResource = client
		   .resource(requestString);

		ClientResponse jsonResponse = webResource.accept("application/json")
                   .get(ClientResponse.class);

		if (jsonResponse.getStatus() != 200) {
		   throw new RuntimeException("Failed : HTTP error code : "
			+ jsonResponse.getStatus());
			//forwardPage = "LoginPage.jsp";
		} else {
			try {
				String output = jsonResponse.getEntity(String.class);
		
				HttpSession session = request.getSession();
				JSONObject jsonObj = new JSONObject(output);

				session.setAttribute("name", jsonObj.getString("name") );
				session.setAttribute("userid", jsonObj.getString("userId"));
			} catch (JSONException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			forwardPage = "Home.jsp";
		}

		response.sendRedirect(forwardPage);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

}
