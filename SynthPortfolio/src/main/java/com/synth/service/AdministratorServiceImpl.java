package com.synth.service;

import org.springframework.stereotype.Service;

import com.synth.domain.AdminVO;
import com.synth.mapper.AdministratorMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdministratorServiceImpl implements AdministratorService {
	private final AdministratorMapper administratorMapper;

	@Override
	public AdminVO admin_login(String administrator_id) {
		
		return administratorMapper.admin_login(administrator_id);
	}

	@Override
	public void login_time(String administrator_id) {
		
		administratorMapper.login_time(administrator_id);
	}
	
}
