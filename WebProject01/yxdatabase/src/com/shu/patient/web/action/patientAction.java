package com.shu.patient.web.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shu.patient.domain.Patient;
import com.shu.patient.domain.PatientBingli;
import com.shu.patient.service.PatientService;
import com.shu.patient.service.impl.PatientServiceImpl;
import com.shu.user.service.UserService;
import com.shu.utils.BaseResult;
import org.apache.struts2.dispatcher.mapper.ActionMapper;
import org.apache.struts2.dispatcher.mapper.ActionMapping;
import org.apache.struts2.result.ServletActionRedirectResult;
import org.apache.struts2.views.freemarker.tags.SetModel;

import java.util.List;

/**
 * @author panyexiong
 * @date 2019/4/12 - 11:15
 */
public class patientAction extends ActionSupport implements ModelDriven<Patient> {

    private static BaseResult baseResult = null;

    private Patient patient = new Patient();

    @Override
    public Patient getModel() {
        return patient;
    }


    private PatientService patientService;

    public void setPatientService(PatientService patientService) {
        this.patientService = patientService;
    }

    public String home() {
        return "success";
    }

    /**
     * 跳转至添加病人界面
     *
     * @return
     */
    public String addPatientjsp() {
        return "addPatientjsp";
    }

    /**
     * 添加病人逻辑
     *
     * @return
     */
    public String addPatient() {
        baseResult = patientService.addPatient(patient);
        if (baseResult.getStatus() == BaseResult.STATUS_SUCCESS) {
            return "addPatientSuccess";
        } else {
            ActionContext.getContext().put("savePatient", baseResult);
            return "addPatientjsp";
        }
    }

    /**
     * 查询所有的病人
     *
     * @return
     */
    public String findAllPatients() {

        List<Patient> allPatients = patientService.findAllPatients();
        ActionContext.getContext().put("allPatients", allPatients);

        if (baseResult != null) {
            if (baseResult.getStatus() == BaseResult.STATUS_SUCCESS) {
                ActionContext.getContext().put("savePatient", baseResult);
                baseResult = null;
            }
        }
        System.out.println("findAllPatientsSuccess");
        return "findAllPatientsSuccess";
    }

    /**
     * 修改病人基本信息
     * 根据pid查找病人的基本信息，用于回显数据
     *
     * @return
     */
    public String findPatientByPid() {
        System.out.println("findPatientByPid执行了！！！");
        Patient findPatient = patientService.findPatientByPid(patient.getPid());
        ActionContext.getContext().getValueStack().push(findPatient);
        return "findPatientByPidSuccess";
    }

    /**
     * 修改病人基本信息
     * 根据pid修改病人基本信息
     *
     * @return
     */
    public String editPatient() {
        System.out.println("editPatient方法执行了");
        patientService.editPatient(patient);

        baseResult = BaseResult.success("修改病人信息成功");

        return "editPatientSuccess";
    }

    /**
     * 点击病人ID编号，显示该病人的基本信息信息
     *
     * @return
     */
    public String findPatientAll() {
        Patient findPatient = patientService.findPatientByPid(patient.getPid());
        System.out.println(findPatient.getPpid());
        ActionContext.getContext().put("patientAll", findPatient);
        return "findPatientAllSuccess";
    }

    public String searchJsp() {
        return "searchJspSuccess";
    }

    /**
     * 删除一个病人的所有信息
     * @return
     */
    public String deleteOnePatientByPid() {
        System.out.println("pid:----"+patient.getPid());
        baseResult = patientService.deleteOnePatientByPid(patient);
        return "deleteOnePatientByPidSuccess";
    }


}
