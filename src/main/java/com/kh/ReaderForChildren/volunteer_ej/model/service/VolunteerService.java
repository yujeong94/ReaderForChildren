package com.kh.ReaderForChildren.volunteer_ej.model.service;

import java.util.ArrayList;

import com.kh.ReaderForChildren.volunteer_ej.model.vo.VolunteerSchedule;

public interface VolunteerService {

	int addVolSchedule(VolunteerSchedule vs);

	ArrayList<VolunteerSchedule> getSchedule();

}
