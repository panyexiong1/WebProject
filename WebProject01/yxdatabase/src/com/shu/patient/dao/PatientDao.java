package com.shu.patient.dao;

import com.shu.patient.domain.Patient;
import com.shu.patient.domain.PatientBingli;
import com.shu.patient.domain.PatientPic;
import com.shu.utils.BaseResult;

import java.util.List;

/**
 * @author panyexiong
 * @date 2019/4/12 - 13:20
 */
public interface PatientDao {
    Integer addPatient(Patient patient);

    List<Patient> findAllPatients();

    Patient findPatientByPid(String pid);

    void editPatient(Patient patient);

    void addPatientBingli(PatientBingli patientBingli);

    List<PatientBingli> showPatientBingli(String pid);

    PatientBingli showOnePatientBingli(String bid);

    void editOnePatientBingli(PatientBingli patientBingli);

    List<PatientPic> showPatientPic(String pid);

    void addpatientPic(PatientPic patientPic);

    String uploadPatientPic(PatientPic patientPic);

    PatientPic showOnePatientpic(String tid);

    void editOnePatientPic(PatientPic patientPic);

    List searchPatients(List list);

    void deleteOnePatientBingli(String bid);

    void deleteOnePatientByPid(Patient patient);

    void deleteOnePatientPic(PatientPic patientPic);
}
