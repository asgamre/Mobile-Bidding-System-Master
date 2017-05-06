import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
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

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/Logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Logout() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Signin.disableCertificateValidation();
		//System.out.println("In logout");
		System.out.println("LAtitude is: " + request.getParameter("latitude"));
		System.out.println("Longitude is: " + request.getParameter("longitude"));
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		Date loginDate = new Date(request.getSession().getCreationTime());
		SimpleDateFormat localDateFormat = new SimpleDateFormat("HH:mm:ss");
		String lastLoginTime = localDateFormat.format(loginDate);
		localDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		String lastLoginDate = localDateFormat.format(loginDate);
		String loc;
		if (latitude.equals("") || longitude.equals("")) {
			loc = "Richardson";
		} else {
			loc = findLoc(latitude, longitude);
		}
		System.out.println("Locations i: "+loc);

		String userid = (String) request.getSession().getAttribute("userid");
		request.getSession().invalidate();

		Client client = Client.create();

		String requestString = Constants.UPDATELOGINDETAILSAPI;
		WebResource webResource = client.resource(requestString);

		MultivaluedMap formData = new MultivaluedMapImpl();
		formData.add("userid", userid);
		formData.add("date", lastLoginDate);
		formData.add("time", lastLoginTime);
		formData.add("location", loc);
		formData.add("secretKey", Constants.secretKey);
		ClientResponse jsonResponse = webResource.type(MediaType.APPLICATION_FORM_URLENCODED_TYPE)
				.post(ClientResponse.class, formData);

		if (jsonResponse.getStatus() != 200) {
			throw new RuntimeException("Failed : HTTP error code : " + jsonResponse.getStatus());
		}

		response.sendRedirect("LoginPage.jsp");
	}

	private String findLoc(String latitude, String longitude)
	{
		String tempsvc = "https://maps.googleapis.com/maps/api/geocode/json?latlng="+latitude+","+longitude+"&key=AIzaSyCtnpJWEJi6c5tqmE6xiay6o-YRTFVPbwk";
		try{
			URL url = new URL(tempsvc);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");
			connection.setRequestProperty("Host", "googleapis.com");
			connection.setRequestProperty("Content-Type", 
			        "application/json");
			connection.setDoOutput(true);
			
			BufferedReader rd = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String op="";
			StringBuilder resp = new StringBuilder(); // or StringBuffer if Java version 5+
		    String line;
		    while ((line = rd.readLine()) != null) {
		      resp.append(line);
		      resp.append('\r');
		    }
		    rd.close();
		    op = op + resp.toString();
		    
		    if (connection != null) 
		    	  connection.disconnect();
		
		    JSONParser parser = new JSONParser();
		    JSONObject json = new JSONObject();
	
			json = (JSONObject) parser.parse(op);
			
	
		
			String printop =json.toString();
		
			int k = printop.indexOf("formatted_address");
			k = k + 19;
			int x = printop.indexOf("\"",k);
			int y = printop.indexOf("\"",k+1);
			String z = printop.substring(x+1,y);
		
			return z;
		}
		catch(Exception e){
			System.out.println(e);
			return "Unkown";
		}
	}
}