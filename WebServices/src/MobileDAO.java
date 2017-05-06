import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;

public class MobileDAO {

	public Mobile getMobile(String mobileName, String companyName)
	{
    	Session session = HibernateUtil.getSessionFactory().openSession();
    	session.beginTransaction();

	    String stringQuery = "FROM Mobile WHERE mobilename='" + mobileName + "' and company_name= '"+companyName+"'";
	    Query query = session.createQuery(stringQuery);
	    List<Mobile> mobile = query.getResultList();
	    session.close();
	    if (mobile.size() != 0)
	    {
	    	return mobile.get(0);
	    } else {
	    	return null;
	    }
	}
	
	public void addMobile(Mobile mobile)
	{
    	Session session = HibernateUtil.getSessionFactory().openSession();
    	session.beginTransaction();

        session.save( mobile );

	    session.getTransaction().commit();

	    // get a new EM to make sure data is actually retrieved from the store and not Hibernate's internal cache
	    session.close();
	}
}
