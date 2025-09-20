package spring_mvc2.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring_mvc2.dao.Admin_dao;
import spring_mvc2.model.Admin;

@Service
public class Admin_Service {
	
	@Autowired
	Admin_dao admin_dao;
	
	
	public Admin isValidAdmin(String email,String password) {
//		System.out.println("check ing  valid admin or not");
		
		
		Admin admin= admin_dao.getAdminByEmail(email);
		
		if(admin!=null && admin.getAdmin_password().equals(password)){
			
			
			System.out.println("checked  valid admin or not");
			System.out.println(admin.getAdmin_email());
			System.out.println(admin.getAdmin_password());
			return admin;
		}
		else {
			return null;
		}
		
		
		
	
	}

	public Admin findByEmail(String admin_email) {
		// TODO Auto-generated method stub
		
		Admin admin= admin_dao.getAdminByEmail(admin_email);
		return admin;
	}

	public void registerAdmin(Admin admin) {
		// TODO Auto-generated method stub
		
		
		admin_dao.SaveUser(admin);
		
	}

}
