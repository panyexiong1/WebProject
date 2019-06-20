package com.shu.patient.web.action;

import com.opensymphony.xwork2.ActionSupport;
import com.shu.patient.service.PatientService;
import org.apache.struts2.ServletActionContext;

import java.io.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * @author panyexiong
 * @date 2019/4/18 - 18:17
 */
public class downloadAction extends ActionSupport {

    PatientService patientService;
    private static int flag = 0;

    public void setPatientService(PatientService patientService) {
        this.patientService = patientService;
    }

    private String[] pid;
    private String[] tid;

    private InputStream inputStream;
    private String fileName;

    public String downloadPatientPic() throws IOException {
        flag = 0;
        System.out.println(pid[0]);
        System.out.println(tid.length);
        File[] files = new File[tid.length];
        File zipFile = new File("E:/download/ZipFile.zip");

        for (int i = 0; i < tid.length; i++) {
            files[i] = new File("E:/yxdatabase/" + tid[i]);
        }

        ZipFiles(zipFile, "download", files);

//        String path = "E:/download/ZipFile.zip";
//        String path1 = "ZipFile.zip";
//
//        File file = new File(path);
//
//        if (file.exists()) {
//            inputStream = new FileInputStream(file);
//            fileName = path1;
//        }

        while (flag == 0){

        }
        return "dabaoing";
    }

    public String downloading() throws Exception {
        String path = "E:/download/ZipFile.zip";
        String path1 = "ZipFile.zip";

        File file = new File(path);

        if (file.exists()) {
            inputStream = new FileInputStream(file);
            fileName = path1;
        }
        return SUCCESS;
    }

    public String[] getPid() {
        return pid;
    }

    public void setPid(String[] pid) {
        this.pid = pid;
    }

    public String[] getTid() {
        return tid;
    }

    public void setTid(String[] tid) {
        this.tid = tid;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public static void ZipFiles(File zip, String path, File... srcFiles) throws IOException {
        ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zip));
        ZipFiles(out, path, srcFiles);
        out.close();
        System.out.println("*****************压缩完毕*******************");
        flag = 1;
    }

    public static void ZipFiles(ZipOutputStream out, String path, File... srcFiles) {
        path = path.replaceAll("\\*", "/");
        if (!path.endsWith("/")) {
            path += "/";
        }
        byte[] buf = new byte[1024];
        try {
            for (int i = 0; i < srcFiles.length; i++) {
                if (srcFiles[i].isDirectory()) {
                    File[] files = srcFiles[i].listFiles();
                    String srcPath = srcFiles[i].getName();
                    srcPath = srcPath.replaceAll("\\*", "/");
                    if (!srcPath.endsWith("/")) {
                        srcPath += "/";
                    }
                    out.putNextEntry(new ZipEntry(path + srcPath));
                    ZipFiles(out, path + srcPath, files);
                } else {
                    FileInputStream in = new FileInputStream(srcFiles[i]);
                    System.out.println(path + srcFiles[i].getName());
                    out.putNextEntry(new ZipEntry(path + srcFiles[i].getName()));
                    int len;
                    while ((len = in.read(buf)) > 0) {
                        out.write(buf, 0, len);
                    }
                    out.closeEntry();
                    in.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
