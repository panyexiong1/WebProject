package com.shu.patient.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * @author panyexiong
 * @date 2019/4/12 - 11:20
 */
public class Patient {

    private String pid;
    private String ppid;
    private String pname;
    private String sex;
    private Date birthday;
    private String xueli;
    private String datasource;

//    一对多：一个病人对应多个病理信息
    private  Set<PatientBingli> patientBingli = new HashSet<PatientBingli>();

    //一对多：一个病人对应多条图像信息
    private Set<PatientPic> patientPic = new HashSet<PatientPic>();


    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPpid() {
        return ppid;
    }

    public void setPpid(String ppid) {
        this.ppid = ppid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getXueli() {
        return xueli;
    }

    public void setXueli(String xueli) {
        this.xueli = xueli;
    }

    public String getDatasource() {
        return datasource;
    }

    public void setDatasource(String datasource) {
        this.datasource = datasource;
    }

    public Set<PatientBingli> getPatientBingli() {
        return patientBingli;
    }

    public void setPatientBingli(Set<PatientBingli> patientBingli) {
        this.patientBingli = patientBingli;
    }

    public Set<PatientPic> getPatientPic() {
        return patientPic;
    }

    public void setPatientPic(Set<PatientPic> patientPic) {
        this.patientPic = patientPic;
    }
}
