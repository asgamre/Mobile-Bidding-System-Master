class MicroConstants {

	public static final String secretKey = "abcd";
	public static final String requestUserExistsAPI = "http://localhost:8080/Jersey/rest/microservice/checkuserexists/";
	public static final String SIGNINAPI = "http://localhost:8080/Jersey/rest/microservice/signin/" +secretKey + "/";
	public static final String SIGNUPAPI = "http://localhost:8080/Jersey/rest/microservice/signup";
	public static final String UPDATEAPI = "http://localhost:8080/Jersey/rest/microservice/update";
	public static final String GETMYBIDSAPI = "http://localhost:8080/Jersey/rest/microservice/getMyBids/"+secretKey+"/";
	public static final String DELETEBIDSAPI = "http://localhost:8080/Jersey/rest/microservice/deleteBids/"+secretKey+"/";
	public static final String DELETEPOSTAPI = "http://localhost:8080/Jersey/rest/microservice/deletePost/"+secretKey+"/";
	public static final String UPDATELOGINDETAILSAPI = "http://localhost:8080/Jersey/rest/microservice/updateLoginDetails";
	public static final String ADDPOSTAPI = "http://localhost:8080/Jersey/rest/microservice/addPost";
	public static final String GETMYPOSTSAPI = "http://localhost:8080/Jersey/rest/microservice/getMyPosts/" +secretKey + "/";
	public static final String GETPOSTAPI = "http://localhost:8080/Jersey/rest/microservice/getPost/" + secretKey + "/";
	public static final String ADDBIDAPI = "http://localhost:8080/Jersey/rest/microservice/addBid";
	public static final String GETBIDSAPI = "http://localhost:8080/Jersey/rest/microservice/getBids/" + secretKey + "/";
	public static final String GETPOSTSBYNAMEAPI = "http://localhost:8080/Jersey/rest/microservice/getPostsByName/" + secretKey + "/";
	public static final String GETPROFILEAPI = "http://localhost:8080/Jersey/rest/microservice/getprofile/" + secretKey + "/";
	public static final String GETHOMEPOSTSAPI = "http://localhost:8080/Jersey/rest/microservice/getPosts/" + secretKey + "/";
	
	
}
