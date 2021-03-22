package DoiTuong;

public class ChucVu {
	private String maCV, tenCV;

	public String getMaCV() {
		return maCV;
	}

	public String getTenCV() {
		return tenCV;
	}

	public void setTenCV(String tenCV) {
		this.tenCV = tenCV;
	}

	public ChucVu(String maCV, String tenCV) {
		super();
		this.maCV = maCV;
		this.tenCV = tenCV;
	}

	@Override
	public String toString() {
		return "ChucVu [maCV=" + maCV + ", tenCV=" + tenCV + "]";
	}

}
