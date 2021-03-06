package com.kh.ReaderForChildren.volunteer_ej.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.chat_ej.model.vo.Chat;
import com.kh.ReaderForChildren.volunteer_ej.model.vo.MyVolunteerActivity;
import com.kh.ReaderForChildren.volunteer_ej.model.vo.Volunteer;
import com.kh.ReaderForChildren.volunteer_ej.model.vo.VolunteerSchedule;

public interface VolunteerService {

	int addVolSchedule(VolunteerSchedule vs);

	ArrayList<VolunteerSchedule> getSchedule();

	int serviceAsk(Volunteer v);

	int checkMax(Volunteer v);

	ArrayList<MyVolunteerActivity> selMyVol(String userId);

	int cancelVol(int vlNum2);

	int updateCur(int vlNum2);

	int checkDemander(Volunteer v);

	int checkDate(VolunteerSchedule vs);

	int updateStatus();

//	ArrayList<VolunteerSchedule> selectMax(int vlNum2);

}
