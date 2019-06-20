package com.shu.patient.domain;

import java.util.Date;

/**
 * @author panyexiong
 * @date 2019/4/12 - 11:44
 */
public class PatientPic {
    private String tid;			//
    private Date checkdate;		//检查日期
    private String sjlx1;		//数据类型1
    private String sjlx2;		//数据类型2
    private String clqsj;			//处理前数据
    private String clhsj;			//处理后数据
    private String pssb;		//拍摄设备

    //多对一：多条图片信息对应一个病人
    private Patient patient;

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public Date getCheckdate() {
        return checkdate;
    }

    public void setCheckdate(Date checkdate) {
        this.checkdate = checkdate;
    }

    public String getSjlx1() {
        return sjlx1;
    }

    public void setSjlx1(String sjlx1) {
        this.sjlx1 = sjlx1;
    }

    public String getSjlx2() {
        return sjlx2;
    }

    public void setSjlx2(String sjlx2) {
        this.sjlx2 = sjlx2;
    }

    public String getClqsj() {
        return clqsj;
    }

    public void setClqsj(String clqsj) {
        this.clqsj = clqsj;
    }

    public String getClhsj() {
        return clhsj;
    }

    public void setClhsj(String clhsj) {
        this.clhsj = clhsj;
    }

    public String getPssb() {
        return pssb;
    }

    public void setPssb(String pssb) {
        this.pssb = pssb;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }
}
