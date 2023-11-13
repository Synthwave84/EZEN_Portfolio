package com.synth.service;

import com.synth.domain.AdminVO;

public interface AdministratorService {

	AdminVO admin_login(String administrator_id);
	
	void login_time(String administrator_id);
	
}
