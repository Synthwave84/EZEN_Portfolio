package com.synth.mapper;

import com.synth.domain.AdminVO;

public interface AdministratorMapper {

AdminVO admin_login(String administrator_id);
	
void login_time(String administrator_id);
}
