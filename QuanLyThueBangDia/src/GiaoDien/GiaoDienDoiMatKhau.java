package GiaoDien;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import DieuKhien.QuanLyNhanVien;
import DieuKhien.QuanLyTaiKhoan;
import DoiTuong.TaiKhoan;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;
import javax.swing.border.LineBorder;
import java.awt.Color;
import javax.swing.SwingConstants;

public class GiaoDienDoiMatKhau extends JFrame implements ActionListener {

	private JPanel contentPane;
	private JPasswordField pwfMKCu;
	private JPasswordField pwfMKMoi;
	private JPasswordField pwfMKNhapLai;
	private QuanLyTaiKhoan TK;
	private String maTK;
	private JButton btnXacNhan, btnTroVe;
	private QuanLyNhanVien NV;
	private JPanel panel;
	private JPanel panel_1;
	private JLabel lblThayiMt;
	private JLabel label_3;

	public GiaoDienDoiMatKhau(String maTK) {
		this.maTK = maTK;
		setTitle("Thay đổi mật khẩu");
		setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		setBounds(100, 100, 1014, 572);
		setLocationRelativeTo(null);
		setResizable(false);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);

		panel = new JPanel();
		panel.setBorder(new LineBorder(new Color(0, 0, 0)));
		panel.setBounds(310, 150, 400, 226);
		contentPane.add(panel);
		panel.setLayout(null);

		panel_1 = new JPanel();
		panel_1.setLayout(null);
		panel_1.setBorder(new LineBorder(new Color(0, 0, 0)));
		panel_1.setBackground(Color.CYAN);
		panel_1.setBounds(0, 0, 400, 34);
		panel.add(panel_1);

		lblThayiMt = new JLabel("Thay Đổi Mật Khẩu");
		lblThayiMt.setHorizontalAlignment(SwingConstants.CENTER);
		lblThayiMt.setFont(new Font("Tahoma", Font.BOLD, 16));
		lblThayiMt.setBounds(0, 0, 400, 34);
		panel_1.add(lblThayiMt);

		JLabel label = new JLabel("Mật khẩu cũ:");
		label.setBounds(10, 55, 109, 20);
		panel.add(label);
		label.setFont(new Font("Tahoma", Font.BOLD, 14));

		JLabel label_1 = new JLabel("Mật khẩu mới:");
		label_1.setBounds(10, 94, 109, 20);
		panel.add(label_1);
		label_1.setFont(new Font("Tahoma", Font.BOLD, 14));

		JLabel label_2 = new JLabel("Nhập lại mật khẩu mới:");
		label_2.setBounds(10, 133, 170, 20);
		panel.add(label_2);
		label_2.setFont(new Font("Tahoma", Font.BOLD, 14));

		btnXacNhan = new JButton("Xác nhận");
		btnXacNhan.setBounds(80, 174, 100, 25);
		panel.add(btnXacNhan);
		btnXacNhan.setFont(new Font("Tahoma", Font.PLAIN, 14));

		btnTroVe = new JButton("Trở Về");
		btnTroVe.setBounds(249, 174, 100, 25);
		panel.add(btnTroVe);
		btnTroVe.setFont(new Font("Tahoma", Font.PLAIN, 14));

		pwfMKCu = new JPasswordField();
		pwfMKCu.setBounds(190, 57, 182, 20);
		panel.add(pwfMKCu);

		pwfMKMoi = new JPasswordField();
		pwfMKMoi.setBounds(190, 96, 182, 20);
		panel.add(pwfMKMoi);

		pwfMKNhapLai = new JPasswordField();
		pwfMKNhapLai.setBounds(190, 135, 182, 20);
		panel.add(pwfMKNhapLai);

		label_3 = new JLabel("");
		label_3.setBounds(0, 0, 1008, 543);
		label_3.setIcon(new ImageIcon(getClass().getResource("/5474953677_e90dfcbb71_b.jpg")));
		contentPane.add(label_3);
		btnTroVe.addActionListener(this);
		btnXacNhan.addActionListener(this);
	}

	private boolean kiemTraMK() {
		char[] c = pwfMKCu.getPassword();
		char[] m = pwfMKMoi.getPassword();
		char[] nlmk = pwfMKNhapLai.getPassword();
		String mkcu = "";
		String mkmoi = "";
		String nlmkmoi = "";
		// String tenTK;
		for (int i = 0; i < c.length; i++) {
			mkcu += c[i];
		}
		for (int i = 0; i < m.length; i++) {
			mkmoi += m[i];
		}
		for (int i = 0; i < nlmk.length; i++) {
			nlmkmoi += nlmk[i];
		}
		if (mkcu.matches("\\s*")) {
			JOptionPane.showMessageDialog(this, "Mật khẩu cũ không được để trống");
			pwfMKCu.requestFocus();
			return false;
		}
		TK = new QuanLyTaiKhoan();
		int k = 0;
		List<TaiKhoan> list = TK.docTuBang();
		for (TaiKhoan taiKhoan : list) {
			if (mkcu.equals(taiKhoan.getMatKhau()))
				k++;
		}
		if (k == 0) {
			JOptionPane.showMessageDialog(this, "Sai mật khẩu");
			pwfMKCu.setText("");
			pwfMKCu.requestFocus();
			pwfMKMoi.setText("");
			pwfMKNhapLai.setText("");
			return false;
		}
		if (!mkmoi.matches("[a-zA-Z0-9]+")) {
			JOptionPane.showMessageDialog(this, "Nhập Mật khẩu mới. Mật khẩu không được có các kí tự đặc biệt!");
			pwfMKCu.setText("");
			pwfMKCu.requestFocus();
			pwfMKMoi.setText("");
			pwfMKNhapLai.setText("");
			return false;
		}
		if (mkmoi.length() < 5) {
			JOptionPane.showMessageDialog(this, "Nhập mật khẩu mới. Mật khẩu mới phải từ 5 kí tự trở lên!");
			pwfMKCu.setText("");
			pwfMKCu.requestFocus();
			pwfMKMoi.setText("");
			pwfMKNhapLai.setText("");
			return false;
		}
		if (mkcu.equals(mkmoi)) {
			JOptionPane.showMessageDialog(this, "Mật khẩu mới không được giống mật khẩu cũ!");
			pwfMKCu.setText("");
			pwfMKCu.requestFocus();
			pwfMKMoi.setText("");
			pwfMKNhapLai.setText("");
			return false;
		}
		if (!mkmoi.equals(nlmkmoi)) {
			JOptionPane.showMessageDialog(this, "Nhập lại mật khẩu mới không khớp!");
			pwfMKCu.setText("");
			pwfMKCu.requestFocus();
			pwfMKMoi.setText("");
			pwfMKNhapLai.setText("");
			return false;
		}
		return true;

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object o = e.getSource();
		if (o.equals(btnXacNhan)) {
			char[] m2 = pwfMKMoi.getPassword();
			String mk2 = "";
			for (int i = 0; i < m2.length; i++) {
				mk2 += m2[i];
			}
			if (kiemTraMK()) {
				TK.doiMatKhau(maTK, mk2);
				JOptionPane.showMessageDialog(this, "Đã thay đổi mật khẩu , mời bại đăng nhập lại");
				setVisible(false);
				GiaoDienDangNhap dn = new GiaoDienDangNhap();
				dn.setVisible(true);
			}
		} else if (o.equals(btnTroVe)) {
			NV = new QuanLyNhanVien();
			String maNV = NV.layMaNV(maTK);
			GiaoDienTong t = new GiaoDienTong(maNV);
			t.setVisible(true);
			setVisible(false);
		}
	}
}
