package cn.zhang.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TOrder {
    private Long id;

    private String doctorRealname;

    private String userRealname;

    private Date orderDate;

    private String userTel;

    private Integer userId;

    private Long doctorId;

    private Integer state;

    private Date created;

    private String doctorTel;

    private Integer visitState;

    private String doctorMessage;

    private Boolean historyState;

    private String illnessDesc;
    
    public Boolean getCancelOrder() throws ParseException{
    	// 将预约日期转化为指定的格式，并将其重置到当天的零点
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	String source = format.format(this.orderDate);
    	Date parse = format.parse(source);
    	// 创建Calendar实例操作时间对象
    	Calendar calendar = Calendar.getInstance();
    	calendar.setTime(parse);
    	// 将其转化为毫秒值，并获取当前时间的毫秒值
    	long timeInMillis = calendar.getTimeInMillis();
    	long currentTimeMillis = System.currentTimeMillis();
    	// 如果当前时间的毫秒值大于截至时间，则返回false
    	if (currentTimeMillis > timeInMillis) {
    		return false;
    	}
    	return true;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDoctorRealname() {
        return doctorRealname;
    }

    public void setDoctorRealname(String doctorRealname) {
        this.doctorRealname = doctorRealname == null ? null : doctorRealname.trim();
    }

    public String getUserRealname() {
        return userRealname;
    }

    public void setUserRealname(String userRealname) {
        this.userRealname = userRealname == null ? null : userRealname.trim();
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public String getOrderDate_x(){
        return dateConvertString(this.orderDate);
    }
    
    private String dateConvertString(Date date){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
       return format.format(date);
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel == null ? null : userTel.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Long getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(Long doctorId) {
        this.doctorId = doctorId;
    }

    public Integer getState() {
        return state;
    }

    public String getState_x(){
        return state == 0 ? "预约中" : (state == 1 ? "预约成功" : (state == 2) ? "预约失败" : (state == 3 ? "取消预约" : ""));
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getCreated() {
        return created;
    }
    public String getCreated_x(){
        return dateConvertString(this.created);
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public String getDoctorTel() {
        return doctorTel;
    }

    public void setDoctorTel(String doctorTel) {
        this.doctorTel = doctorTel == null ? null : doctorTel.trim();
    }

    public Integer getVisitState() {
        return visitState;
    }

    public String getVisitState_x(){
        return visitState == 0 ? "未就诊" : (visitState == 1 ? "已就诊" : (visitState == 2 ? "爽约" : ""));
    }

    public void setVisitState(Integer visitState) {
        this.visitState = visitState;
    }

    public String getDoctorMessage() {
        return doctorMessage;
    }

    public void setDoctorMessage(String doctorMessage) {
        this.doctorMessage = doctorMessage == null ? null : doctorMessage.trim();
    }

    public Boolean getHistoryState() {
        return historyState;
    }

    public void setHistoryState(Boolean historyState) {
        this.historyState = historyState;
    }

    public String getIllnessDesc() {
        return illnessDesc;
    }

    public void setIllnessDesc(String illnessDesc) {
        this.illnessDesc = illnessDesc == null ? null : illnessDesc.trim();
    }
}