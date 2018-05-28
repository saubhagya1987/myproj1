package in.fiinfra.partner.models;

public class Theme {
	private int themeId;
	private String icon;
	private final String theme;
	private final String thumbnail;
	
	public Theme(int themeId, String theme, String icon, String thumbnail){
		this.themeId = themeId;
		this.icon =icon;
		this.theme = theme;
		this.thumbnail = thumbnail;
	}
	
	public int getThemeId() {
		return themeId;
	}
	public void setThemeId(int themeId) {
		this.themeId = themeId;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getTheme() {
		return theme;
	}

	public String getThumbnail() {
		return thumbnail;
	}
	
	
}
