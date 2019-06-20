package com.shu.patient.dao.impl;

import com.shu.patient.dao.PatientDao;
import com.shu.patient.domain.Patient;
import com.shu.patient.domain.PatientBingli;
import com.shu.patient.domain.PatientPic;
import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import org.springframework.aop.scope.ScopedProxyUtils;
import org.springframework.jdbc.object.SqlQuery;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

/**
 * @author panyexiong
 * @date 2019/4/12 - 13:21
 */
public class PatientDaoImpl extends HibernateDaoSupport implements PatientDao {
    @Override
    public Integer addPatient(Patient patient) {
        String patient1 = (String) this.getHibernateTemplate().save(patient);
        System.out.println(patient1);
        if (!"".equals(patient1) && patient1 != null) {
            return 1;
        }
        return 0;
    }

    @Override
    public List<Patient> findAllPatients() {
        return (List<Patient>) this.getHibernateTemplate().find("from Patient ");
    }

    @Override
    public Patient findPatientByPid(String pid) {
        return this.getHibernateTemplate().get(Patient.class, pid);
    }

    @Override
    public void editPatient(Patient patient) {
        System.out.println(patient.getPid());
        Patient patient1 = this.getHibernateTemplate().get(Patient.class, patient.getPid());
        patient1.setPpid(patient.getPpid());
        patient1.setPname(patient.getPname());
        patient1.setSex(patient.getSex());
        patient1.setBirthday(patient.getBirthday());
        patient1.setXueli(patient.getXueli());
        patient1.setDatasource(patient.getDatasource());
        this.getHibernateTemplate().update(patient1);

    }

    @Override
    public void addPatientBingli(PatientBingli patientBingli) {
        this.getHibernateTemplate().save(patientBingli);
    }

    @Override
    public List<PatientBingli> showPatientBingli(String pid) {

        List<Patient> patientList = (List<Patient>) this.getHibernateTemplate().find("from Patient where pid=?0", pid);

        Patient patient = patientList.get(0);
        System.out.println(patient.getPid());

        List<PatientBingli> patientBinglis = (List<PatientBingli>) this.getHibernateTemplate().find("from PatientBingli where patient.pid=?0", pid);
        if (patientBinglis.size() == 0) {
            PatientBingli patientBingli = new PatientBingli();
            patientBingli.setPatient(patient);
            patientBinglis.add(patientBingli);
        }
        for (int i = 0; i < patientBinglis.size(); i++) {
            patientBinglis.get(i).setPatient(patient);
        }
        return patientBinglis;
    }

    @Override
    public PatientBingli showOnePatientBingli(String bid) {
        return this.getHibernateTemplate().get(PatientBingli.class, bid);
    }

    @Override
    public void editOnePatientBingli(PatientBingli patientBingli) {
        this.getHibernateTemplate().update(patientBingli);
    }

    @Override
    public List<PatientPic> showPatientPic(String pid) {
        List<Patient> patientList = (List<Patient>) this.getHibernateTemplate().find("from Patient where pid=?0", pid);

        Patient patient = patientList.get(0);

        List<PatientPic> patientPics = (List<PatientPic>) this.getHibernateTemplate().find("from PatientPic where pid=?0", pid);
        if (patientPics.size() == 0) {
            PatientPic patientPic = new PatientPic();
            patientPic.setPatient(patient);
            patientPics.add(patientPic);
        }
        for (int i = 0; i < patientPics.size(); i++) {
            patientPics.get(i).setPatient(patient);
        }
        return patientPics;
    }

    @Override
    public void addpatientPic(PatientPic patientPic) {
        this.getHibernateTemplate().save(patientPic);
    }

    @Override
    public String uploadPatientPic(PatientPic patientPic) {
        Serializable serializable = this.getHibernateTemplate().save(patientPic);
        System.out.println("serializable:" + serializable.toString());
        return serializable.toString();
    }

    @Override
    public PatientPic showOnePatientpic(String tid) {
        return this.getHibernateTemplate().get(PatientPic.class, tid);
    }

    @Override
    public void editOnePatientPic(PatientPic patientPic) {
        this.getHibernateTemplate().update(patientPic);
    }

    @Override
    public List searchPatients(List list) {
        String ppid = (String) list.get(0);
        String sex = (String) list.get(1);
        String minage = (String) list.get(2);
        String maxage = (String) list.get(3);
        String[] datasource = (String[]) list.get(4);
        String[] jblx = (String[]) list.get(5);
        String checkdate = (String) list.get(6);
        String[] sjlx1 = (String[]) list.get(7);
        String[] sjlx2 = (String[]) list.get(8);

        String sql1 = "";

        if (!"".equals(ppid)) {
            sql1 += " and ppid like '%" + ppid + "%'";
        }
        if (!"all".equals(sex)) {
            sql1 += " and sex = '" + sex+"'";
        }

        //获取当前年份
        Calendar year1 = Calendar.getInstance();
        int year = Integer.valueOf(year1.get(Calendar.YEAR));
        int big = year;
        int small = 1900;
        if (!"".equals(minage)) {
            big = year - Integer.parseInt(minage);
            sql1 += " and year(birthday) <= " + big;
        }
        if (!"".equals(maxage)) {
            small = year - Integer.parseInt(maxage);
            sql1 += " and year(birthday) >= " + small;
        }

        if (!"all".equals(datasource[0])) {
            System.out.println(datasource.length);
            if (datasource.length == 1){
                sql1 += " and datasource = '" + datasource[0]+"'";
            }else {
                sql1 += " and (datasource = '" + datasource[0]+"'";
                for (int i = 1; i < datasource.length; i++) {
                    sql1 += " or datasource = '" + datasource[i]+"'";
                }
                sql1 += ")";
            }
        }

        if(!"all".equals(jblx[0])){
            if (jblx.length==1){
                sql1 += " and jblx = '"+jblx[0]+"'";
            }else {
                sql1 += " and (jblx= '"+jblx[0]+"'";
                for (int i=1;i<jblx.length;i++){
                    sql1 += " or jblx = '" +jblx[i]+"'";
                }
                sql1 += ")";
            }
        }

        if(!"all".equals(sjlx1[0])){
            if (sjlx1.length==1){
                sql1 += " and sjlx1 = '"+sjlx1[0]+"'";
            }else {
                sql1 += " and (sjlx1= '"+sjlx1[0]+"'";
                for (int i=1;i<sjlx1.length;i++){
                    sql1 += " or sjlx1 = '" +sjlx1[i]+"'";
                }
                sql1 += ")";
            }
        }

        if(!"all".equals(sjlx2[0])){
            if (sjlx2.length==1){
                sql1 += " and sjlx2 = '"+sjlx2[0]+"'";
            }else {
                sql1 += " and (sjlx2= '"+sjlx2[0]+"'";
                for (int i=1;i<sjlx2.length;i++){
                    sql1 += " or sjlx2 = '" +sjlx2[i]+"'";
                }
                sql1 += ")";
            }
        }

        sql1 +="  ORDER BY patient.ppid ";


//        List<Patient> list1 = (List<Patient>) this.getHibernateTemplate().find("from Patient where 1=1 " + sql1);
//        List<String> list1 = (List<String>) this.getHibernateTemplate().find("select Patient.ppid from Patient where 1=1 and ppid like '%hs%'");
        Session session = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
        List<String[]> list1 = session.createSQLQuery("select patient.pid, patient.ppid,patient.pname,patient.sex,patient.birthday,patient.datasource,patient_bingli.jblx,patient_pic.checkdate,patient_pic.sjlx1,patient_pic.sjlx2,patient_pic.clqsj,patient_pic.clhsj,patient_pic.tid from Patient,patient_bingli,patient_pic where 1=1 and patient.pid=patient_pic.pid and patient.pid=patient_bingli.pid and patient_bingli.checkdate=patient_pic.checkdate"+sql1).list();
        //检验，完成后可删除
            System.out.println(list1.size());

        return list1;
    }

    /**
     * 根据bid删除病理信息
     * @param bid
     */
    @Override
    public void deleteOnePatientBingli(String bid) {
        PatientBingli patientBingli = new PatientBingli();
        patientBingli.setBid(bid);
        this.getHibernateTemplate().delete(patientBingli);
    }

    /**
     * 根据pid删除该病人的所有信息
     * @param patient
     */
    @Override
    public void deleteOnePatientByPid(Patient patient) {
//        System.out.println("1---pid---"+patient.getPid());
        Patient patient1 = this.getHibernateTemplate().get(Patient.class, patient.getPid());
//        System.out.println(patient1.getPpid());

        this.getHibernateTemplate().delete(patient1);
    }

    /**
     * 删除图像信息
     * @param patientPic
     */
    @Override
    public void deleteOnePatientPic(PatientPic patientPic) {
        this.getHibernateTemplate().delete(patientPic);
    }


}
