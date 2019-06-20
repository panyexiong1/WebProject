package com.shu.patient.web.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shu.patient.domain.Patient;
import com.shu.patient.domain.PatientPic;
import com.shu.patient.service.PatientService;
import com.shu.utils.BaseResult;

import javax.xml.transform.Source;
import java.io.File;
import java.util.List;

/**
 * @author panyexiong
 * @date 2019/4/14 - 17:51
 */
public class patientPicAction extends ActionSupport implements ModelDriven<PatientPic> {

    private PatientPic patientPic = new PatientPic();
    private String pid;
    private static BaseResult baseResult = null;

    public void setPid(String pid) {
        this.pid = pid;
    }

    @Override
    public PatientPic getModel() {
        return patientPic;
    }

    PatientService patientService;

    public void setPatientService(PatientService patientService) {
        this.patientService = patientService;
    }

    //picpid用于uploadAction传递过来的参数
    private String picpid;

    public String getPicpid() {
        return picpid;
    }

    public void setPicpid(String picpid) {
        this.picpid = picpid;
    }



    private static String pid1 = null;

    public String showPatientPic() {
        System.out.println("picpid:---------" + picpid);
        if (!"".equals(pid1) && pid1 != null) {
            Patient patient = new Patient();
            patient.setPid(pid1);
            patientPic.setPatient(patient);
            pid1 = null;
        } else if (!"".equals(picpid) && picpid != null) {
            Patient patient = new Patient();
            patient.setPid(picpid);
            patientPic.setPatient(patient);
            picpid = null;
        }


        System.out.println("showPatientPic" + patientPic.getPatient().getPid());
        List<PatientPic> patientPics = patientService.showPatientPic(patientPic.getPatient().getPid());
        ActionContext.getContext().put("baseResult", baseResult);
        baseResult = null;
        ActionContext.getContext().put("patientPics", patientPics);
        return "showPatientPicSuccess";
    }

    public String addPatientPic() {
        patientService.addPatientPic(patientPic);
        pid1 = patientPic.getPatient().getPid();
        return "addPatientPicSuccess";
    }

    public String showOnePatientpic() {
        PatientPic showOnePatientpic = patientService.showOnePatientpic(patientPic.getTid());
        System.out.println(showOnePatientpic.getPatient().getPid());
//        ActionContext.getContext().put("showOnePatientpic",showOnePatientpic);
        ActionContext.getContext().getValueStack().push(showOnePatientpic);
        return "showOnePatientpicSuccess";
    }



    public String addOnePatientPic() {
        System.out.println(pid);
        ActionContext.getContext().put("pid",pid);
        return "addOnePatientPicSuccess";

    }

    public String deleteOnePatientPic() {
        System.out.println("tid:" + patientPic.getTid());
        System.out.println("patientpid:" + patientPic.getPatient().getPid());

        baseResult = patientService.deleteOnePatientPic(patientPic);
        pid1 = patientPic.getPatient().getPid();
        return "deleteOnePatientPicSuccess";
    }


}
