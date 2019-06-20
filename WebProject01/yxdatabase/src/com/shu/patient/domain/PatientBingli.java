package com.shu.patient.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * @author panyexiong
 * @date 2019/4/12 - 11:44
 */
public class PatientBingli {

    private String bid;						//
    private Date checkdate;					//检查日期
    private String height;					//体重
    private String weight;					//身高
    private String xuetang;					//血糖
    private String jblx;					//疾病类型
    private Date qingbingsj;				//起病时间
    private String qingbingzt;				//起病肢体
    private String bingcheng;				//病程
    private String DM;						//DM
    private String UPDRS;					//
    private String HY;						//
    private String MMSE;					//
    private String MOCA;					//
    private String CDRSB;					//
    private String ADAS11;					//
    private String ADAS13;					//
    private String RAVLT_immediate;			//
    private String RAVLT_learning;			//
    private String RAVLT_forgetting;		//


    //多对一：一个病人对应多条病理信息
    private Patient patient;


    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    public Date getCheckdate() {
        return checkdate;
    }

    public void setCheckdate(Date checkdate) {
        this.checkdate = checkdate;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getXuetang() {
        return xuetang;
    }

    public void setXuetang(String xuetang) {
        this.xuetang = xuetang;
    }

    public String getJblx() {
        return jblx;
    }

    public void setJblx(String jblx) {
        this.jblx = jblx;
    }

    public Date getQingbingsj() {
        return qingbingsj;
    }

    public void setQingbingsj(Date qingbingsj) {
        this.qingbingsj = qingbingsj;
    }

    public String getQingbingzt() {
        return qingbingzt;
    }

    public void setQingbingzt(String qingbingzt) {
        this.qingbingzt = qingbingzt;
    }

    public String getBingcheng() {
        return bingcheng;
    }

    public void setBingcheng(String bingcheng) {
        this.bingcheng = bingcheng;
    }

    public String getDM() {
        return DM;
    }

    public void setDM(String DM) {
        this.DM = DM;
    }

    public String getUPDRS() {
        return UPDRS;
    }

    public void setUPDRS(String UPDRS) {
        this.UPDRS = UPDRS;
    }

    public String getHY() {
        return HY;
    }

    public void setHY(String HY) {
        this.HY = HY;
    }

    public String getMMSE() {
        return MMSE;
    }

    public void setMMSE(String MMSE) {
        this.MMSE = MMSE;
    }

    public String getMOCA() {
        return MOCA;
    }

    public void setMOCA(String MOCA) {
        this.MOCA = MOCA;
    }

    public String getCDRSB() {
        return CDRSB;
    }

    public void setCDRSB(String CDRSB) {
        this.CDRSB = CDRSB;
    }

    public String getADAS11() {
        return ADAS11;
    }

    public void setADAS11(String ADAS11) {
        this.ADAS11 = ADAS11;
    }

    public String getADAS13() {
        return ADAS13;
    }

    public void setADAS13(String ADAS13) {
        this.ADAS13 = ADAS13;
    }

    public String getRAVLT_immediate() {
        return RAVLT_immediate;
    }

    public void setRAVLT_immediate(String RAVLT_immediate) {
        this.RAVLT_immediate = RAVLT_immediate;
    }

    public String getRAVLT_learning() {
        return RAVLT_learning;
    }

    public void setRAVLT_learning(String RAVLT_learning) {
        this.RAVLT_learning = RAVLT_learning;
    }

    public String getRAVLT_forgetting() {
        return RAVLT_forgetting;
    }

    public void setRAVLT_forgetting(String RAVLT_forgetting) {
        this.RAVLT_forgetting = RAVLT_forgetting;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

}
