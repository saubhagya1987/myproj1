package in.fiinfra.query.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MultiPartFileUploadBean {

    private List<MultipartFile> files;

    public void setFiles(List<MultipartFile> files) {
        this.files = files;
    }

    public List<MultipartFile> getFiles() {
        return files;
    }
}
