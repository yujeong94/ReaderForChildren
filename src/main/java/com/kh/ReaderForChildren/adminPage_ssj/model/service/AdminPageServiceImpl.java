package com.kh.ReaderForChildren.adminPage_ssj.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ReaderForChildren.adminPage_ssj.model.dao.AdminPageDAO;

@Service("aService")
public class AdminPageServiceImpl implements AdminPageService {
	
	@Autowired
	private AdminPageDAO aDAO;
}
