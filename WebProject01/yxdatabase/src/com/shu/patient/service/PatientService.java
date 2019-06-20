package com.shu.patient.service;

import com.shu.patient.domain.Patient;
import com.shu.patient.domain.PatientBingli;
import com.shu.patient.domain.PatientPic;
import com.shu.utils.BaseResult;

import java.util.List;

/**
 * @author panyexiong
 * @date 2019/4/12 - 13:32
 */
public interface PatientService {
    public BaseResult addPatient(Patient patient);

    public List<Patient> findAllPatients();

    Patient findPatientByPid(String pid);

    void editPatient(Patient patient);

    void addPatientBingli(PatientBingli patientBingli);

    List<PatientBingli> showPatientBingli(String pid);

    PatientBingli showOnePatientBingli(String bid);

    BaseResult editOnePatientBingli(PatientBingli patientBingli);

    List<PatientPic> showPatientPic(String pid);

    void addPatientPic(PatientPic patientPic);

    String uploadPatientPic(PatientPic patientPic);

    PatientPic showOnePatientpic(String tid);

    void editOnePatientPic(PatientPic patientPic);

    List searchPatients(List list);

    BaseResult deleteOnePatientBingli(String bid);

    BaseResult deleteOnePatientByPid(Patient patient);

    BaseResult deleteOnePatientPic(PatientPic patientPic);
}
