package in.fiinfra.common.service.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileUpload {
	MultipartFile file; 
	MultipartFile file1; 
	MultipartFile file2; 
	 
	MultipartFile editfile; 
	MultipartFile editfile1;  
	MultipartFile editfile2;   
  
	public MultipartFile getFile2() {
		return file2;
	}
 
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}

	public MultipartFile getFile1() {
		return file1;
	}

	public void setFile1(MultipartFile file1) {
		this.file1 = file1;  
	}

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

	public MultipartFile getEditfile1() {
		return editfile1;
	}  

	public void setEditfile1(MultipartFile editfile1) {
		this.editfile1 = editfile1;
	}

	public MultipartFile getEditfile2() {
		return editfile2;
	}

	public void setEditfile2(MultipartFile editfile2) {
		this.editfile2 = editfile2;
	} 
  
}
