package in.fiinfra.opportunity.controller;

import java.net.MalformedURLException;
import java.net.URL;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.JOptionPane;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

public class Validator {

	public static int charvalid(String text) {
		int i = 0;
		String input = text;
		Pattern p = Pattern.compile("[A-Z,a-z,&%$#@!()*^`{}[]\\|+=-_<>.?/, ]");
		Matcher m = p.matcher(input);
		if (m.find()) {
			i = 1;
			//JOptionPane.showMessageDialog(null, "String not allowed");
		} else {
		}
		return i;
	}

	public static int largeval(String text, int len) {
		int i = 0;
		int lentext = text.length();
		if (lentext == len) {
			i = 0;
		} else {
			i = 1;
//			JOptionPane.showMessageDialog(null,
//					"You must enter 10 digit mobile number");
		}
		return i;
	}

	public static int numvalid(String text) {
		int i = 0;
		String input = text;
		Pattern p = Pattern.compile("[0-9]");
		Matcher m = p.matcher(input);
		if (m.find()) {
//			JOptionPane.showMessageDialog(null, "Number not allowed");
			i = 1;
		} else {
		}
		return i;
	}

	public static int emailvalid(String text) {
		int i = 0;
		String input = text;
		Pattern p = Pattern
				.compile("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
		Matcher m = p.matcher(input);
		if (m.find()) {

		} else {
//			JOptionPane.showMessageDialog(null, "Invalid Email ID");
			i = 1;
		}
		return i;
	}

	public static String getFormatedDate(java.util.Date date) {
		String dateString = "";
		Format formatter = new SimpleDateFormat("MM/dd/yyyy");
		dateString = formatter.format(date);
		return dateString;
	}

	public static int urlValid(String text) {
		int i = 0;
		try {
			URL url = new URL(text);
			url.getPath();
		} catch (MalformedURLException e) {
			//JOptionPane.showMessageDialog(null, "Invalid Url");
			i = 1;
		}
		return i;
	}

	public static String getFormatedTime(java.util.Date date) {
		String timeString = "";
		Format formatter = new SimpleDateFormat("HH:mm:ss");
		timeString = formatter.format(date);
		return timeString;
	}

	public static boolean isValidAlphanumeric(String text) {
		boolean result = false;
		text = text.replaceAll("[ ]", "");
		Pattern p = Pattern.compile(".*\\W+.*");
		Matcher m = p.matcher(text);
		if (!m.matches()) {
			result = true;
		} else {

		}
		return result;
	}

	public static boolean isThisDateValid(Date dateToValidate, String dateFromat) {

		boolean result = false;
		// if(dateToValidate == null){
		// return false;
		// }
		//
		// SimpleDateFormat sdf = new SimpleDateFormat(dateFromat);
		// sdf.setLenient(false);
		//
		// try {
		//
		// //if not valid, it will throw ParseException
		// Date date = sdf.parse(dateToValidate);
		//
		// } catch (ParseException e) {
		//
		// return false;
		// }
		//
		// return true;
		// }
		// try {
		// Date d = new Date(dateToValidate);
		// result = true;
		// } catch (Exception e) {
		// // TODO: handle exception
		// return false;
		// }

		try {

			// if not valid, it will throw ParseException
			SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
			String date = DATE_FORMAT.format(dateToValidate);
			result = true;
		} catch (Exception e) {
			return false;
		}
		return result;
	}

	public static boolean isValidUserName(String userName) {
//		~!@$%^&*_.#-
		userName = userName.replaceAll("-", "_");
		/*userName = userName.replaceAll(".", "_");
		userName = userName.replaceAll("~", "_");
		userName = userName.replaceAll("!", "_");
		userName = userName.replaceAll("$", "_");
		userName = userName.replaceAll("%", "_");
		userName = userName.replaceAll("&", "_");
		userName = userName.replaceAll("*", "_");
		userName = userName.replaceAll("#", "_");*/
		//boolean result = true;
		String pattern = "^[a-zA-Z0-9.@_]*$";
		//String pattern="/^[a-zA-Z0-9~!@$%^&*_.#-]+$/";
		
		//String pattern="^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
	
		if (userName.matches(pattern)) {
			return true;
		}
		return false;
	}

	// public boolean isAlphaNumeric(String s) {
	// String pattern = "^[a-zA-Z0-9]*$";
	// if (s.matches(pattern)) {
	// return true;
	// }
	// return false;
	// }
}
