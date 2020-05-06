package cn.zhang.pojo;

public class TDoctor {
    private Long id;

    private String userName;

    private String userPassword;

    private String doctorRealname;

    private String sex;

    private Integer age;

    private String title;

    private Integer workAge;

    private String image;

    private Integer depId;

    private String doctorTel;

    private String doctorInfo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public String getDoctorRealname() {
        return doctorRealname;
    }

    public void setDoctorRealname(String doctorRealname) {
        this.doctorRealname = doctorRealname == null ? null : doctorRealname.trim();
    }

    public String getSex() {
        return sex;
    }
    
    public String getSex_x() {
    	return "1".equals(this.sex) ? "男" : ("2".equals(this.sex) ? "女" : "未知");
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getWorkAge() {
        return workAge;
    }

    public void setWorkAge(Integer workAge) {
        this.workAge = workAge;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Integer getDepId() {
        return depId;
    }

    public void setDepId(Integer depId) {
        this.depId = depId;
    }

    public String getDoctorTel() {
        return doctorTel;
    }

    public void setDoctorTel(String doctorTel) {
        this.doctorTel = doctorTel == null ? null : doctorTel.trim();
    }

    public String getDoctorInfo() {
        return doctorInfo;
    }

    public void setDoctorInfo(String doctorInfo) {
        this.doctorInfo = doctorInfo == null ? null : doctorInfo.trim();
    }
}