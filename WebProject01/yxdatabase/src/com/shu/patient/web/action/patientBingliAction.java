package com.shu.patient.web.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shu.patient.domain.Patient;
import com.shu.patient.domain.PatientBingli;
import com.shu.patient.service.PatientService;
import com.shu.utils.BaseResult;
import com.sun.org.apache.xml.internal.resolver.helpers.PublicId;

import java.util.LinkedList;
import java.util.List;

/**
 * @author panyexiong
 * @date 2019/4/13 - 11:01
 */
public class patientBingliAction extends ActionSupport implements ModelDriven<PatientBingli> {

    private static BaseResult baseResult = null;
    private String pid;

    public void setPid(String pid) {
        this.pid = pid;
    }

    private PatientBingli patientBingli = new PatientBingli();

    @Override
    public PatientBingli getModel() {
        return patientBingli;
    }

    private PatientService patientService;

    public void setPatientService(PatientService patientService) {
        this.patientService = patientService;
    }

    private static String pid1 = null;

    public String addPatientBingli() {
        patientService.addPatientBingli(patientBingli);
        pid1 = patientBingli.getPatient().getPid();
        System.out.println(pid1);
        baseResult = BaseResult.success("添加病理信息成功");
        return "addPatientBingliSuccess";
    }

    /**
     * 通过pid显示病人所有病理信息
     *
     * @return
     */
    public String showPatientBingli() {
        if (!"".equals(pid1) && pid1 != null) {
            Patient patient = new Patient();
            patient.setPid(pid1);
            patientBingli.setPatient(patient);
            pid1 = null;
        }
        System.out.println("showPatientBingli:" + patientBingli.getPatient().getPid());
        List<PatientBingli> patientBinglis = patientService.showPatientBingli(patientBingli.getPatient().getPid());

        ActionContext.getContext().put("baseResult", baseResult);
        ActionContext.getContext().put("patientBinglis", patientBinglis);
        baseResult = null;
        return "showPatientBingliSuccess";
    }

    /**
     * 根据bid查找该病人的该条病理信息，回显，用于修改
     *
     * @return
     */
    public String showOnePatientBingli() {
        System.out.println("bid:" + patientBingli.getBid());
        PatientBingli showOnePatientBingli = patientService.showOnePatientBingli(patientBingli.getBid());
        System.out.println("showOnePatientBingli:" + showOnePatientBingli.getBid());
        ActionContext.getContext().getValueStack().push(showOnePatientBingli);
        return "showOnePatientBingliSuccess";
    }

    /**
     * 修改该条病理信息
     *
     * @return
     */
    public String editOnePatientBingli() {
        baseResult = patientService.editOnePatientBingli(patientBingli);
        if (baseResult.getStatus() == BaseResult.STATUS_SUCCESS) {
            pid1 = patientBingli.getPatient().getPid();

            return "editOnePatientBingliSuccess";
        } else {
            return "editOnePatientBinglifail";
        }

    }

    /**
     * 添加病理信息页面
     * @return
     */
    public String addOnePatientBingli() {

        System.out.println(pid);
        ActionContext.getContext().put("pid",pid);
        return "addOnePatientBingliSuccess";
    }

    /**
     * 根据bid删除病理信息
     * @return
     */
    public String deleteOnePatientBingli() {
        System.out.println("bid:" + patientBingli.getBid());
        System.out.println("patientpid:" + patientBingli.getPatient().getPid());

        baseResult = patientService.deleteOnePatientBingli(patientBingli.getBid());
        pid1=patientBingli.getPatient().getPid();
        return "deleteOnePatientBingliSuccess";
    }


}
