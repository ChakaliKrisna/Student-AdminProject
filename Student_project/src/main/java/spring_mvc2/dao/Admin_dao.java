package spring_mvc2.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import spring_mvc2.model.Admin;
import spring_mvc2.model.Student;

@Repository
public class Admin_dao {
	
	
	@Autowired
	private HibernateTemplate hibernatetemple;
	
	
	@Transactional(readOnly = false)
	public int SaveUser(Admin user) {
		int id=(Integer)this.hibernatetemple.save(user);
		return id;
		
	}
	
	
	public Admin getAdminByEmail(String email) {
		
		String hql="from Admin where admin_email = :email";
		List<Admin> list= (List<Admin>) hibernatetemple.findByNamedParam(hql, "email", email);
		
		if(list!= null && !list.isEmpty() ) {
			
			return (Admin) list.get(0);
			
		}
		
		return null;
		
		
	}
	
	
	
	
	
	
	
	
	

}
