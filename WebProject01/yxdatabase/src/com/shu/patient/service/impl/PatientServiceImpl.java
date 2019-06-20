package com.shu.patient.service.impl;

import com.shu.patient.dao.PatientDao;
import com.shu.patient.domain.Patient;
import com.shu.patient.domain.PatientBingli;
import com.shu.patient.domain.PatientPic;
import com.shu.patient.service.PatientService;
import com.shu.utils.BaseResult;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

/**
 * @author panyexiong
 * @date 2019/4/12 - 13:33
 */
public class PatientServiceImpl implements PatientService {

    private PatientDao patientDao;

    public void setPatientDao(PatientDao patientDao) {
        this.patientDao = patientDao;
    }


    @Override
    public BaseResult addPatient(Patient patient) {
        BaseResult baseResult = checkPatient(patient);
        //通过验证
        if (baseResult.getStatus() == BaseResult.STATUS_SUCCESS) {
            //新增用户
            patientDao.addPatient(patient);
            baseResult.setMessage("新增病人成功");
        }

        return baseResult;
    }

    @Override
    public List<Patient> findAllPatients() {
        return patientDao.findAllPatients();
    }

    @Override
    public Patient findPatientByPid(String pid) {
        return patientDao.findPatientByPid(pid);
    }

    @Override
    public void editPatient(Patient patient) {
        patientDao.editPatient(patient);
    }

    @Override
    public void addPatientBingli(PatientBingli patientBingli) {
        patientDao.addPatientBingli(patientBingli);
    }

    @Override
    public List<PatientBingli> showPatientBingli(String pid) {
        return patientDao.showPatientBingli(pid);
    }

    @Override
    public PatientBingli showOnePatientBingli(String bid) {
        return patientDao.showOnePatientBingli(bid);
    }

    @Override
    public BaseResult editOnePatientBingli(PatientBingli patientBingli) {
        BaseResult baseResult = checkPatientBingli(patientBingli);

        //通过验证
        if (baseResult.getStatus() == BaseResult.STATUS_SUCCESS) {
            //新增用户
            patientDao.editOnePatientBingli(patientBingli);
            baseResult.setMessage("修改病理信息成功");
        }
        return baseResult;
    }

    @Override
    public List<PatientPic> showPatientPic(String pid) {
        return patientDao.showPatientPic(pid);
    }

    @Override
    public void addPatientPic(PatientPic patientPic) {
        patientDao.addpatientPic(patientPic);
    }

    @Override
    public String uploadPatientPic(PatientPic patientPic) {
        return patientDao.uploadPatientPic(patientPic);
    }

    @Override
    public PatientPic showOnePatientpic(String tid) {
        return patientDao.showOnePatientpic(tid);
    }

    @Override
    public void editOnePatientPic(PatientPic patientPic) {
        patientDao.editOnePatientPic(patientPic);
    }

    @Override
    public List searchPatients(List list) {
        return patientDao.searchPatients(list);
    }

    /**
     * 根据bid删除病理信息
     * @param bid
     * @return
     */
    @Override
    public BaseResult deleteOnePatientBingli(String bid) {
        patientDao.deleteOnePatientBingli(bid);
        BaseResult baseResult = BaseResult.success("删除成功");
        return baseResult;
    }

    /**
     * 根据patient删除病人的所有信息
     * @param patient
     * @return
     */
    @Override
    public BaseResult deleteOnePatientByPid(Patient patient) {
        patientDao.deleteOnePatientByPid(patient);
        BaseResult baseResult = BaseResult.success("删除成功");
        return baseResult;
    }

    /**
     * 删除图像信息
     * @param patientPic
     * @return
     */
    @Override
    public BaseResult deleteOnePatientPic(PatientPic patientPic) {
        patientDao.deleteOnePatientPic(patientPic);
        BaseResult baseResult = BaseResult.success("删除成功");
        return baseResult;
    }

    private BaseResult checkPatient(Patient patient) {
        BaseResult baseResult = BaseResult.success();
        //非空验证
        if (StringUtils.isBlank(patient.getPpid())) {
            baseResult = BaseResult.fail("ID不能为空，请按照要求填写");
        }
        return baseResult;
    }

    private BaseResult checkPatientBingli(PatientBingli patientBingli) {
        BaseResult baseResult = BaseResult.success();
        //非空验证
        if (patientBingli.getCheckdate() == null || "".equals(patientBingli.getCheckdate())) {
            baseResult = BaseResult.fail("检查日期不能为空，请填写");
        }
        return baseResult;
    }

}
