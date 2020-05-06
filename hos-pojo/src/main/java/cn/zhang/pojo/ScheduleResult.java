package cn.zhang.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ScheduleResult {

	private Long id;

	private Long doctorId;

	private Date workDate;

	private Boolean workTime;

	private Integer timeInterval;

	private String doctorRealname;
	
	private String depName;
	
	private String doctorTel;

	public String getDoctorTel() {
		return doctorTel;
	}

	public void setDoctorTel(String doctorTel) {
		this.doctorTel = doctorTel;
	}

	public String getDepName() {
		return depName;
	}

	public void setDepName(String depName) {
		this.depName = depName;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(Long doctorId) {
		this.doctorId = doctorId;
	}

	public Date getWorkDate() {
		return workDate;
	}
	
    public String getWorkDate_x(){
    	return dateConvertString(workDate);
    }
    
    private String dateConvertString(Date date){
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	return format.format(date);
    }


	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}

	public Boolean getWorkTime() {
		return workTime;
	}
	
	public String getWorkTime_x() {
    	return !workTime ? "上午" : "下午";
    }

	public void setWorkTime(Boolean workTime) {
		this.workTime = workTime;
	}

	public Integer getTimeInterval() {
		return timeInterval;
	}

	public void setTimeInterval(Integer timeInterval) {
		this.timeInterval = timeInterval;
	}

	public String getDoctorRealname() {
		return doctorRealname;
	}

	public void setDoctorRealname(String doctorRealname) {
		this.doctorRealname = doctorRealname;
	}
	
	
}
