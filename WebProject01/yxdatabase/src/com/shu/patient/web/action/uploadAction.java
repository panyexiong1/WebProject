package com.shu.patient.web.action;

import com.opensymphony.xwork2.ActionSupport;
import com.shu.patient.domain.Patient;
import com.shu.patient.domain.PatientPic;
import com.shu.patient.service.PatientService;

import java.io.File;
import java.util.Date;

/**
 * @author panyexiong
 * @date 2019/4/15 - 11:44
 */
public class uploadAction extends ActionSupport {


    PatientService patientService;

    public void setPatientService(PatientService patientService) {
        this.patientService = patientService;
    }


    //表单上提供的字段
    private String pid;
    private String tid;
    private Date checkdate;
    private String sjlx1;
    private String sjlx2;
    private String pssb;

    private String clqsj1;
    private String clhsj1;

    private File clqsj;
    private File clhsj;

    //struts在文件上传时提供的属性
    private String clqsjFileName;
    private String clqsjContentType;

    private String clhsjFileName;
    private String clhsjContentType;


    public String uploadPatientPic() {

        System.out.println("uploadPatientPic方法执行了");
        System.out.println(pid);
        System.out.println(checkdate);
        System.out.println(sjlx1);
        System.out.println(sjlx2);
        System.out.println(clqsj);
        System.out.println(clhsj);
        System.out.println(pssb);

        //将数据封装成对象
        Patient patient = new Patient();
        patient.setPid(pid);
        PatientPic patientPic = new PatientPic();
        patientPic.setPatient(patient);

        patientPic.setCheckdate(checkdate);
        patientPic.setSjlx1(sjlx1);
        patientPic.setSjlx2(sjlx2);
        patientPic.setClqsj(clqsjFileName);
        patientPic.setClhsj(clhsjFileName);
        patientPic.setPssb(pssb);

        String tid = patientService.uploadPatientPic(patientPic);
        System.out.println(tid);


        File file1 = new File("E:/yxdatabase/" + tid + "/" + sjlx1 + "/" + sjlx2 + "/" + "clqsj");
        File file2 = new File("E:/yxdatabase/" + tid + "/" + sjlx1 + "/" + sjlx2 + "/" + "clhsj");

        if (!file1.exists()) {
            file1.mkdirs();
        }
        if (!file2.exists()) {
            file2.mkdirs();
        }

        //4.把photo存过去，并重命名
        if (clqsj != null) {
            clqsj.renameTo(new File(file1, clqsjFileName));
        }
        if (clhsj != null) {
            clhsj.renameTo(new File(file2, clhsjFileName));
        }

        return "uploadPatientPicSuccess";
    }

    /**
     * 修改该病人的该条图像信息：先删除再添加
     *
     * @return
     */
    public String editOnePatientPic() {
        System.out.println("editOnePatientPicc方法执行了");

        //根据tid查询该条图像信息,用于删除


        //将数据封装成对象
        Patient patient = new Patient();
        patient.setPid(pid);
        PatientPic patientPic = new PatientPic();
        patientPic.setPatient(patient);

        patientPic.setTid(tid);
        patientPic.setCheckdate(checkdate);
        patientPic.setSjlx1(sjlx1);
        patientPic.setSjlx2(sjlx2);
        patientPic.setClqsj(clqsjFileName);
        patientPic.setClhsj(clhsjFileName);
        patientPic.setPssb(pssb);

        patientService.editOnePatientPic(patientPic);

        File file1 = new File("E:/yxdatabase/" + pid + "/" + tid + "/" + sjlx1 + "/" + sjlx2 + "/" + "clqsj");
        File file11 = new File("E:/yxdatabase/" + pid + "/" + tid + "/" + sjlx1 + "/" + sjlx2 + "/" + "clqsj" + clqsjFileName);

        File file2 = new File("E:/yxdatabase/" + pid + "/" + tid + "/" + sjlx1 + "/" + sjlx2 + "/" + "clhsj");
        File file21 = new File("E:/yxdatabase/" + pid + "/" + tid + "/" + sjlx1 + "/" + sjlx2 + "/" + "clhsj" + clhsjFileName);

        if (file1.exists()) {
            deleteFile(file1);
        }
        if (!file1.exists()) {
            file1.mkdirs();
        }
        if (file2.exists()) {
            deleteFile(file2);
        }
        if (!file2.exists()) {
            file2.mkdirs();
        }

        //4.把photo存过去，并重命名
        if (clqsj != null) {
            clqsj.renameTo(new File(file1, clqsjFileName));
        }
        if (clhsj != null) {
            clhsj.renameTo(new File(file2, clhsjFileName));
        }

        return "editOnePatientPicSuccess";
    }

    public void deleteFile(File file) {
        if (file.isFile()) {
            file.delete();
            return;
        } else {
            for (File file1 : file.listFiles()) {
                deleteFile(file1);
            }
            return;
        }
    }


    /**
     * TODO
     * 修改图像信息，不包括文件信息
     * @return
     */
    public String editOnePic() {
        System.out.println("editOnePic方法执行了");
        System.out.println(pid);
        System.out.println(tid);
        System.out.println(checkdate);
        System.out.println(sjlx1);
        System.out.println(sjlx2);
        System.out.println(clqsj1);
        System.out.println(clhsj1);
        System.out.println(pssb);
        //将数据封装成对象
        Patient patient = new Patient();
        patient.setPid(pid);
        PatientPic patientPic = new PatientPic();
        patientPic.setPatient(patient);

        patientPic.setTid(tid);
        patientPic.setCheckdate(checkdate);
        patientPic.setSjlx1(sjlx1);
        patientPic.setSjlx2(sjlx2);
        patientPic.setClqsj(clqsj1);
        patientPic.setClhsj(clhsj1);
        patientPic.setPssb(pssb);

        patientService.editOnePatientPic(patientPic);
        patientPic = null;
        patient = null;
        return "editOnePicSuccess";
    }




    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

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

    public String getPssb() {
        return pssb;
    }

    public void setPssb(String pssb) {
        this.pssb = pssb;
    }

    public String getClqsj1() {
        return clqsj1;
    }

    public void setClqsj1(String clqsj1) {
        this.clqsj1 = clqsj1;
    }

    public String getClhsj1() {
        return clhsj1;
    }

    public void setClhsj1(String clhsj1) {
        this.clhsj1 = clhsj1;
    }

    public File getClqsj() {
        return clqsj;
    }

    public void setClqsj(File clqsj) {
        this.clqsj = clqsj;
    }

    public File getClhsj() {
        return clhsj;
    }

    public void setClhsj(File clhsj) {
        this.clhsj = clhsj;
    }

    public String getClqsjFileName() {
        return clqsjFileName;
    }

    public void setClqsjFileName(String clqsjFileName) {
        this.clqsjFileName = clqsjFileName;
    }

    public String getClqsjContentType() {
        return clqsjContentType;
    }

    public void setClqsjContentType(String clqsjContentType) {
        this.clqsjContentType = clqsjContentType;
    }

    public String getClhsjFileName() {
        return clhsjFileName;
    }

    public void setClhsjFileName(String clhsjFileName) {
        this.clhsjFileName = clhsjFileName;
    }

    public String getClhsjContentType() {
        return clhsjContentType;
    }

    public void setClhsjContentType(String clhsjContentType) {
        this.clhsjContentType = clhsjContentType;
    }
}
