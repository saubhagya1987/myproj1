package in.fiinfra.utils;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	MultipartFile file;
	MultipartFile editfile;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public MultipartFile getEditfile() {
		return editfile;
	}

	public void setEditfile(MultipartFile editfile) {
		this.editfile = editfile;
	}

	

	
}
