

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;

import org.codehaus.jackson.jaxrs.JacksonJaxbJsonProvider;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.api.json.JSONConfiguration;

/**
 * Servlet implementation class CartUpdate
 */
@WebServlet("/CartUpdate")
public class CartUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if("update".equals(req.getParameter("action1"))){
			doPut(req,resp);
		}
		
		
	}
	
		protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			// TODO Auto-generated method stub
			String shoppingcartid=req.getParameter("shoppingcartid");
			String quantity = req.getParameter("quantity");
			System.out.println("shoppingCartId"+shoppingcartid+"/"+quantity);
			String requestString = Constants.UPDATEITEMCART +shoppingcartid+"/"+quantity;
			
			ClientConfig config = new DefaultClientConfig();
		    config.getClasses().add(JacksonJaxbJsonProvider.class);
		    config.getFeatures().put(JSONConfiguration.FEATURE_POJO_MAPPING, Boolean.TRUE);
			Client client = Client.create(config);
			WebResource webResource = client
			   .resource(requestString);
			String input=shoppingcartid+"/"+quantity;
			ClientResponse jsonResponse = webResource.accept(MediaType.APPLICATION_JSON).type(MediaType.APPLICATION_JSON)
				    .put(ClientResponse.class,input);
			if (jsonResponse.getStatus() != 200) {
				   throw new RuntimeException("Failed : HTTP error code : "
					+ jsonResponse.getStatus());
				}
			ShoppingCart sc = new ShoppingCart();
			sc.doGet(req, resp);

		}

	

}
