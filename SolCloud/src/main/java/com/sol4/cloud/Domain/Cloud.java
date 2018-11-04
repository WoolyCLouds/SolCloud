package com.sol4.cloud.Domain;

import java.util.Date;

public class Cloud {
	
	private String m_id;
	private String m_name;
	private String m_pw;
	private String m_zipcode;
	private String m_address1;
	private String m_address2;
	private String m_question;
	private String m_answer;
	private String m_directory;
	
	private String f_name;
	private String f_location;
	private String f_icon;
	private double f_size;
	private int f_share;
	private Date f_date;
	
	private int pb_num;
	private int pb_class;
	private String pb_title;
	private String pb_content;
	private String pb_file;
	private String pb_writer; 
	private Date pb_date;
	private int pb_viewcnt;
	
	public Cloud() {
		// TODO Auto-generated constructor stub
	}

	public Cloud(String m_id, String m_name, String m_pw, String m_zipcode, String m_address1, String m_address2,
			String m_question, String m_answer, String m_directory, String f_name, String f_location, String f_icon,
			double f_size, int f_share, Date f_date, int pb_num, int pb_class, String pb_title, String pb_content,
			String pb_file, String pb_writer, Date pb_date, int pb_viewcnt) {
		super();
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_pw = m_pw;
		this.m_zipcode = m_zipcode;
		this.m_address1 = m_address1;
		this.m_address2 = m_address2;
		this.m_question = m_question;
		this.m_answer = m_answer;
		this.m_directory = m_directory;
		this.f_name = f_name;
		this.f_location = f_location;
		this.f_icon = f_icon;
		this.f_size = f_size;
		this.f_share = f_share;
		this.f_date = f_date;
		this.pb_num = pb_num;
		this.pb_class = pb_class;
		this.pb_title = pb_title;
		this.pb_content = pb_content;
		this.pb_file = pb_file;
		this.pb_writer = pb_writer;
		this.pb_date = pb_date;
		this.pb_viewcnt = pb_viewcnt;
	}



	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_zipcode() {
		return m_zipcode;
	}

	public void setM_zipcode(String m_zipcode) {
		this.m_zipcode = m_zipcode;
	}

	public String getM_address1() {
		return m_address1;
	}

	public void setM_address1(String m_address1) {
		this.m_address1 = m_address1;
	}

	public String getM_address2() {
		return m_address2;
	}

	public void setM_address2(String m_address2) {
		this.m_address2 = m_address2;
	}

	public String getM_question() {
		return m_question;
	}

	public void setM_question(String m_question) {
		this.m_question = m_question;
	}

	public String getM_answer() {
		return m_answer;
	}

	public void setM_answer(String m_answer) {
		this.m_answer = m_answer;
	}

	public String getM_directory() {
		return m_directory;
	}

	public void setM_directory(String m_directory) {
		this.m_directory = m_directory;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getF_location() {
		return f_location;
	}

	public void setF_location(String f_location) {
		this.f_location = f_location;
	}

	public double getF_size() {
		return f_size;
	}

	public void setF_size(double f_size) {
		this.f_size = f_size;
	}

	public Date getF_date() {
		return f_date;
	}

	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}
	public String getF_icon() {
		return f_icon;
	}

	public void setF_icon(String f_icon) {
		this.f_icon = f_icon;
	}
	
	public int getF_share() {
		return f_share;
	}

	public void setF_share(int f_share) {
		this.f_share = f_share;
	}

	public int getPb_num() {
		return pb_num;
	}

	public void setPb_num(int pb_num) {
		this.pb_num = pb_num;
	}

	public int getPb_class() {
		return pb_class;
	}

	public void setPb_class(int pb_class) {
		this.pb_class = pb_class;
	}

	public String getPb_title() {
		return pb_title;
	}

	public void setPb_title(String pb_title) {
		this.pb_title = pb_title;
	}

	public String getPb_content() {
		return pb_content;
	}

	public void setPb_content(String pb_content) {
		this.pb_content = pb_content;
	}

	public String getPb_file() {
		return pb_file;
	}

	public void setPb_file(String pb_file) {
		this.pb_file = pb_file;
	}

	public String getPb_writer() {
		return pb_writer;
	}

	public void setPb_writer(String pb_writer) {
		this.pb_writer = pb_writer;
	}

	public Date getPb_date() {
		return pb_date;
	}

	public void setPb_date(Date pb_date) {
		this.pb_date = pb_date;
	}

	public int getPb_viewcnt() {
		return pb_viewcnt;
	}

	public void setPb_viewcnt(int pb_viewcnt) {
		this.pb_viewcnt = pb_viewcnt;
	}
	 
	
}
