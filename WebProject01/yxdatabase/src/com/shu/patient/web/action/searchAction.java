package com.shu.patient.web.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.shu.patient.service.PatientService;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author panyexiong
 * @date 2019/4/16 - 17:46
 */
public class searchAction extends ActionSupport {

    PatientService patientService;

    public void setPatientService(PatientService patientService) {
        this.patientService = patientService;
    }

    private String ppid;
    private String sex;
    private String minage;
    private String maxage;
    private String xueli;
    private String[] datasource;
    private String[] jblx;
    private String checkdate;
    private String[] sjlx1;
    private String[] sjlx2;

    public String search(){
        System.out.println(ppid);
        System.out.println(sex);
        System.out.println(minage);
        System.out.println(maxage);
        for(int i=0;i<datasource.length;i++){
            System.out.print(datasource[i]);
        }
        System.out.println();
        for(int i=0;i<jblx.length;i++){
            System.out.print(jblx[i]);
        }
        System.out.println();
        System.out.println(checkdate);
        for(int i=0;i<sjlx1.length;i++){
            System.out.print(sjlx1[i]);
        }
        System.out.println();
        for(int i=0;i<sjlx2.length;i++){
            System.out.print(sjlx2[i]);
        }
        System.out.println();

        List list = new ArrayList();
        list.add(ppid);
        list.add(sex);
        list.add(minage);
        list.add(maxage);
        list.add(datasource);
        list.add(jblx);
        list.add(checkdate);
        list.add(sjlx1);
        list.add(sjlx2);

        String[] datasource1 = (String[]) list.get(4);
        System.out.println(list.get(0));
        System.out.println(datasource1[0]);

        List<String[]> list1 = patientService.searchPatients(list);
        ActionContext.getContext().put("list1",list1);

//        return null;
        return "searchSuccess";
    }

    public String getPpid() {
        return ppid;
    }

    public void setPpid(String ppid) {
        this.ppid = ppid;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getMaxage() {
        return maxage;
    }

    public void setMaxage(String maxage) {
        this.maxage = maxage;
    }

    public String getMinage() {
        return minage;
    }

    public void setMinage(String minage) {
        this.minage = minage;
    }

    public String getXueli() {
        return xueli;
    }

    public void setXueli(String xueli) {
        this.xueli = xueli;
    }

    public String[] getDatasource() {
        return datasource;
    }

    public void setDatasource(String[] datasource) {
        this.datasource = datasource;
    }


    public String[] getJblx() {
        return jblx;
    }

    public void setJblx(String[] jblx) {
        this.jblx = jblx;
    }

    public String getCheckdate() {
        return checkdate;
    }

    public void setCheckdate(String checkdate) {
        this.checkdate = checkdate;
    }

    public String[] getSjlx1() {
        return sjlx1;
    }

    public void setSjlx1(String[] sjlx1) {
        this.sjlx1 = sjlx1;
    }

    public String[] getSjlx2() {
        return sjlx2;
    }

    public void setSjlx2(String[] sjlx2) {
        this.sjlx2 = sjlx2;
    }
}
