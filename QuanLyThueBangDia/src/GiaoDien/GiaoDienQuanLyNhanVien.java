package GiaoDien;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Properties;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import org.jdatepicker.impl.JDatePanelImpl;
import org.jdatepicker.impl.JDatePickerImpl;
import org.jdatepicker.impl.UtilDateModel;

import Database.Database;
import DatePicker.DateLabelFormatter;
import DieuKhien.QuanLyChucVu;
import DieuKhien.QuanLyNhaCungCap;
import DieuKhien.QuanLyNhanVien;
import DieuKhien.QuanLyTheLoai;
import DoiTuong.ChucVu;
import DoiTuong.NhaCungCap;
import DoiTuong.NhanVien;
import DoiTuong.TheLoai;

import javax.swing.JComboBox;
import javax.swing.JButton;
import java.awt.Color;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JRadioButton;
import javax.swing.JTextArea;
import javax.swing.JFormattedTextField.AbstractFormatter;
import javax.swing.border.LineBorder;
import javax.swing.border.TitledBorder;

public class GiaoDienQuanLyNhanVien extends JFrame implements ActionListener, MouseListener {

	private JPanel contentPane;
	private JTable table;
	private DefaultTableModel tableModel;
	private JComboBox<String> cbotimKiem;
	private JButton btntimKiem;
	private JButton btnthem;
	private JButton btnxoa;
	private JButton btnthoat, btnluu;
	private JPanel panel;
	private JLabel lblThngTinNhn;
	private JLabel lblmaNV;
	private JLabel lbltenNV;
	private JLabel lblchucVu;
	private JLabel lblngaySinh;
	private JLabel lblngayLamViec;
	private JTextField txtmaNV;
	private JTextField txttenNV;
	private JLabel lblphai;
	private JTextField txtcmnd;
	private JTextField txtdiaChi;
	private JTextField txtemail;
	private JTextField txtsdt;
	private List<NhanVien> list;
	private QuanLyNhanVien qlNV;
	private Properties p;
	private UtilDateModel model1, model2;
	private JDatePanelImpl datePanel1, datePanel2;
	private JDatePickerImpl datePicker1, datePicker2;
	private JRadioButton radNam, radNu, rabLam, rabNghi;
	private JPanel panel_1;
	private JPanel panel_2;
	private JLabel label;
	private JComboBox cboChucVu;
	private QuanLyChucVu qlcv;
	private List<ChucVu> cv;

	public GiaoDienQuanLyNhanVien() {
		setTitle("Qu???n l?? nh??n vi??n");
		setBounds(100, 100, 1298, 631);
		setLocationRelativeTo(null);
		setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		taoGiaoDien();
		// XuatTT();
	}

	public void taoGiaoDien() {

		contentPane = new JPanel();
		contentPane.setBackground(Color.WHITE);
		// contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		// setContentPane(contentPane);
		getContentPane().add(contentPane);
		contentPane.setLayout(null);

		JScrollPane scroll;
		String[] header = "M?? Nh??n Vi??n;T??n Nh??n Vi??n;Ng??y Sinh;CMND;S??? ??i???n Tho???i;Email".split(";");
		tableModel = new DefaultTableModel(header, 0);
		contentPane.add(scroll = new JScrollPane(table = new JTable(tableModel), JScrollPane.VERTICAL_SCROLLBAR_ALWAYS,
				JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED));
		table.addMouseListener(this);
		Database.getInstance().connect();

		panel = new JPanel();
		panel.setBackground(Color.WHITE);
		panel.setBorder(new LineBorder(new Color(0, 0, 0)));
		panel.setBounds(696, 13, 575, 571);
		contentPane.add(panel);
		panel.setLayout(null);

		lblThngTinNhn = new JLabel("TH??NG TIN NH??N VI??N");
		lblThngTinNhn.setForeground(Color.BLUE);
		lblThngTinNhn.setFont(new Font("Arial", Font.BOLD, 30));
		lblThngTinNhn.setBounds(151, 13, 400, 49);
		panel.add(lblThngTinNhn);

		lblmaNV = new JLabel("M?? Nh??n Vi??n: ");
		lblmaNV.setBounds(12, 87, 110, 26);
		panel.add(lblmaNV);

		lbltenNV = new JLabel("T??n Nh??n Vi??n: ");
		lbltenNV.setBounds(12, 145, 110, 26);
		panel.add(lbltenNV);

		lblchucVu = new JLabel("Ch???c V???:");
		lblchucVu.setBounds(12, 203, 110, 26);
		panel.add(lblchucVu);

		p = new Properties();
		p.put("text.today", "Today");
		p.put("text.month", "Month");
		p.put("text.year", "Year");
		model1 = new UtilDateModel();
		datePanel1 = new JDatePanelImpl(model1, p);
		datePicker1 = new JDatePickerImpl(datePanel1, new DateLabelFormatter());
		panel.add(datePicker1);

		lblngaySinh = new JLabel("Ng??y Sinh:");
		lblngaySinh.setBounds(12, 261, 110, 26);
		panel.add(lblngaySinh);

		model2 = new UtilDateModel();
		datePanel2 = new JDatePanelImpl(model2, p);
		datePicker2 = new JDatePickerImpl(datePanel2, new DateLabelFormatter());
		panel.add(datePicker2);
		model2.setValue(Date.valueOf(LocalDate.now()));

		lblngayLamViec = new JLabel("Ng??y L??m Vi???c:");
		lblngayLamViec.setBounds(265, 261, 110, 26);
		panel.add(lblngayLamViec);

		txtmaNV = new JTextField();
		txtmaNV.setEditable(false);
		txtmaNV.setFont(new Font("Tahoma", Font.BOLD, 11));
		txtmaNV.setBounds(105, 87, 110, 26);
		panel.add(txtmaNV);
		txtmaNV.setColumns(10);

		txttenNV = new JTextField();
		txttenNV.setColumns(10);
		txttenNV.setBounds(105, 145, 342, 26);
		panel.add(txttenNV);

		lblphai = new JLabel("Gi???i T??nh:");
		lblphai.setBounds(300, 203, 66, 26);
		panel.add(lblphai);
		ButtonGroup group = new ButtonGroup();
		radNam = new JRadioButton("Nam");
		radNam.setBackground(Color.WHITE);
		group.add(radNam);
		radNam.setBounds(374, 203, 66, 26);
		panel.add(radNam);

		radNu = new JRadioButton("N???");
		radNu.setBackground(Color.WHITE);
		group.add(radNu);
		radNu.setBounds(451, 203, 66, 26);
		panel.add(radNu);

		JLabel lblcmnd = new JLabel("CMND:");
		lblcmnd.setBounds(12, 319, 110, 26);
		panel.add(lblcmnd);

		JLabel lbldiaChi = new JLabel("?????a Ch???:");
		lbldiaChi.setBounds(12, 377, 110, 26);
		panel.add(lbldiaChi);

		JLabel lblemail = new JLabel("Email:");
		lblemail.setBounds(12, 432, 110, 26);
		panel.add(lblemail);

		JLabel lblsdt = new JLabel("S??? ??i???n Tho???i:");
		lblsdt.setBounds(265, 319, 110, 26);
		panel.add(lblsdt);

		txtcmnd = new JTextField();
		txtcmnd.setColumns(10);
		txtcmnd.setBounds(105, 319, 142, 26);
		panel.add(txtcmnd);

		txtdiaChi = new JTextField();
		txtdiaChi.setColumns(10);
		txtdiaChi.setBounds(105, 377, 394, 26);
		panel.add(txtdiaChi);

		txtemail = new JTextField();
		txtemail.setColumns(10);
		txtemail.setBounds(105, 432, 394, 26);
		panel.add(txtemail);

		txtsdt = new JTextField();
		txtsdt.setColumns(10);
		txtsdt.setBounds(353, 319, 142, 26);
		panel.add(txtsdt);

		JLabel lblghiChu = new JLabel("Tr???ng Th??i:");
		lblghiChu.setBounds(265, 87, 79, 26);
		panel.add(lblghiChu);

		datePicker1.setBounds(105, 261, 142, 26);
		datePicker2.setBounds(353, 263, 142, 26);

		panel_1 = new JPanel();
		panel_1.setBounds(12, 483, 553, 76);
		panel.add(panel_1);
		panel_1.setBorder(new TitledBorder(new LineBorder(new Color(0, 0, 0)), "Thanh C\u00F4ng C\u1EE5",
				TitledBorder.LEADING, TitledBorder.TOP, null, null));
		panel_1.setBackground(Color.WHITE);
		panel_1.setLayout(null);

		btnthoat = new JButton("Tr??? V???");
		btnthoat.setBounds(447, 26, 96, 26);
		panel_1.add(btnthoat);
		btnthoat.setBackground(Color.WHITE);
		btnthoat.setIcon(new ImageIcon("C:\\Users\\PC\\Downloads\\icons8-export-50.png"));

		btnxoa = new JButton("X??a R???ng");
		btnxoa.setBounds(294, 26, 110, 26);
		panel_1.add(btnxoa);
		btnxoa.setBackground(Color.WHITE);
		btnxoa.setIcon(new ImageIcon("C:\\Users\\PC\\Downloads\\icons8-delete-bin-50.png"));

		btnluu = new JButton("C???p Nh???t");
		btnluu.setBounds(149, 26, 110, 26);
		panel_1.add(btnluu);
		btnluu.setIcon(new ImageIcon("C:\\Users\\PC\\Downloads\\icons8-save-50.png"));
		btnluu.setBackground(Color.WHITE);

		btnthem = new JButton("Th??m");
		btnthem.setBounds(10, 26, 110, 26);
		panel_1.add(btnthem);
		btnthem.setBackground(Color.WHITE);
		btnthem.setIcon(new ImageIcon("C:\\Users\\PC\\Downloads\\icons8-support-50.png"));

		ButtonGroup group1 = new ButtonGroup();

		rabLam = new JRadioButton("??ang l??m vi???c");
		rabLam.setBackground(Color.WHITE);
		rabLam.setBounds(330, 87, 110, 26);
		panel.add(rabLam);
		group1.add(rabLam);
		rabNghi = new JRadioButton("???? ngh??? vi???c");
		rabNghi.setBackground(Color.WHITE);
		rabNghi.setBounds(442, 87, 100, 26);
		panel.add(rabNghi);
		group1.add(rabNghi);
		panel_2 = new JPanel();
		panel_2.setBorder(new TitledBorder(new LineBorder(new Color(0, 0, 0)), "Thanh t\u00ECm ki\u1EBFm",
				TitledBorder.LEADING, TitledBorder.TOP, null, null));
		panel_2.setBackground(Color.WHITE);
		panel_2.setBounds(12, 512, 674, 72);
		contentPane.add(panel_2);
		panel_2.setLayout(null);

		label = new JLabel("T??n Nh??n Vi??n: ");
		label.setBounds(39, 23, 110, 26);
		panel_2.add(label);

		cbotimKiem = new JComboBox();
		cbotimKiem.setBounds(146, 21, 304, 31);
		panel_2.add(cbotimKiem);
		cbotimKiem.setBackground(Color.WHITE);

		btntimKiem = new JButton("T??m ki???m");
		btntimKiem.setBounds(520, 23, 119, 26);
		panel_2.add(btntimKiem);
		btntimKiem.setBackground(Color.WHITE);
		btntimKiem.addActionListener(this);
		btntimKiem.setIcon(new ImageIcon("C:\\Users\\PC\\Downloads\\icons8-search-more-48.png"));
		btnthem.addActionListener(this);
		btnluu.addActionListener(this);
		btnxoa.addActionListener(this);
		btnthoat.addActionListener(this);
		scroll.setEnabled(false);
		scroll.setBounds(12, 13, 672, 488);
		capNhatBangDuLieu();
		rabLam.setSelected(true);
		radNam.setSelected(true);

		cboChucVu = new JComboBox();
		cboChucVu.setFont(new Font("Tahoma", Font.PLAIN, 14));
		cboChucVu.setBounds(105, 205, 142, 24);
		panel.add(cboChucVu);
		XuatTTCombobox();
	}

	private void XuatTTCombobox() {
		qlcv = new QuanLyChucVu();
		List<ChucVu> listCV = qlcv.docTubang();
		for (ChucVu chucVu : listCV) {
			cboChucVu.addItem(chucVu.getTenCV());
		}
	}

	private void capNhatBangDuLieu() {
		qlNV = new QuanLyNhanVien();
		List<NhanVien> list = qlNV.docTuBang();
		for (NhanVien Nhanvien : list) {
			String[] rowData = { Nhanvien.getMaNV(), Nhanvien.getTenNV(), Nhanvien.getNgaySinh().toString(),
					Nhanvien.getcMND(), Nhanvien.getSdt(), Nhanvien.getEmail() };
			tableModel.addRow(rowData);
			cbotimKiem.addItem(Nhanvien.getTenNV());
		}
		table.setModel(tableModel);
	}

	private void dienThongTin(int row) {
		if (row != -1) {
			btnthem.setVisible(false);
			String ma = (String) table.getValueAt(row, 0);
			List<NhanVien> list = qlNV.docTuBang();
			for (NhanVien nv : list) {
				if (ma.trim().equals(nv.getMaNV().trim())) {
					// txtmaNV.setEditable(false);
					txtmaNV.setText(ma);
					txttenNV.setText(nv.getTenNV());
					cboChucVu.setSelectedItem(nv.getChuVu());
					String phai;
					if (nv.getGioiTinh().trim().equals("Nam"))
						radNam.setSelected(true);
					else
						radNu.setSelected(true);
					model1.setValue(nv.getNgaySinh());
					model2.setValue(nv.getNgayLamViec());
					txtcmnd.setText(nv.getcMND());
					txtsdt.setText(nv.getSdt());
					txtdiaChi.setText(nv.getDiaChi());
					txtemail.setText(nv.getEmail());
					int i = nv.getTinhTrang();
					if (i == 1)
						rabLam.setSelected(true);
					else
						rabNghi.setSelected(true);

				}
			}
		}
	}

	private void xoaRong() {
		btnthem.setVisible(true);
		txtmaNV.setText("");
		txttenNV.setText("");
		cboChucVu.setSelectedIndex(0);
		model1.setValue(Date.valueOf(LocalDate.now()));
		model2.setValue(Date.valueOf(LocalDate.now()));
		txtcmnd.setText("");
		txtsdt.setText("");
		txtdiaChi.setText("");
		txtemail.setText("");
		rabLam.setSelected(true);
	}

	private boolean kiemTraDinhDang() {
		String ten = txttenNV.getText();
		int namSinh = model1.getYear();
		Date ngayLam = Date.valueOf(LocalDate.of(model2.getYear(), model2.getMonth() + 1, model2.getDay()));
		String cCCD = txtcmnd.getText();
		String sdt = txtsdt.getText();
		String diachi = txtsdt.getText();
		String email = txtemail.getText();
		// String ghi = txtghiChu.getText();
		if (ten.matches("\\s*")) {
			JOptionPane.showMessageDialog(this, "T??n kh??ng ???????c ????? tr???ng!");
			txttenNV.requestFocus();
			txttenNV.selectAll();
			return false;
		} else if (!ten.matches("^[\\p{L} ]+$")) {
			JOptionPane.showMessageDialog(this, "Vui l??ng ??i???n t??n ch??nh x??c!");
			txttenNV.requestFocus();
			txttenNV.selectAll();
			return false;
		} else if (cCCD.matches("\\s*")) {
			JOptionPane.showMessageDialog(this, "CCCD/CMND kh??ng ???????c ????? tr???ng!");
			txtcmnd.requestFocus();
			txtcmnd.selectAll();
			return false;
		} else if (!cCCD.matches("[0-9]{9}") && !cCCD.matches("[0-9]{12}")) {
			JOptionPane.showMessageDialog(this, "CCCD ph???i l?? s??? v?? ph???i ????? 12 s???(CMND ph???i l?? s??? v?? ph???i ????? 9 s???) !");
			txtcmnd.requestFocus();
			txtcmnd.selectAll();
			return false;
		} else if (sdt.matches("\\s*")) {
			JOptionPane.showMessageDialog(this, "S??? ??i???n tho???i kh??ng ???????c ????? tr???ng!");
			txtsdt.requestFocus();
			txtsdt.selectAll();
			return false;
		} else if (!sdt.matches("[0-9]{10}")) {
			JOptionPane.showMessageDialog(this, "S??? ??i???n tho???i ph???i l?? s??? v?? ph???i ????? 10 s???!");
			txtsdt.requestFocus();
			txtsdt.selectAll();
			return false;
		} else if (email.matches("\\s*")) {
			JOptionPane.showMessageDialog(this, "Email kh??ng ???????c ????? tr???ng");
			txtemail.requestFocus();
			txtemail.selectAll();
			return false;
		} else if (!email.matches("^([a-z0-9_])+@([\\da-z])+\\.([a-z\\.]{2,6})$")) {
			JOptionPane.showMessageDialog(this, "Vui l??ng nh???p ????ng Email!");
			txtemail.requestFocus();
			txtemail.selectAll();
			return false;
		} else if (diachi.matches("\\s*")) {
			JOptionPane.showMessageDialog(this, "?????a ch??? kh??ng ???????c ????? tr???ng!");
			txtdiaChi.requestFocus();
			txtdiaChi.selectAll();
			return false;
		} else if (!diachi.matches("^[\\p{L}0-9 -/]+$")) {
			JOptionPane.showMessageDialog(this, "Vui l??ng nh???p ????ng ?????a ch???!");
			txtdiaChi.requestFocus();
			txtdiaChi.selectAll();
			return false;
		} else if (namSinh >= 2002) {
			JOptionPane.showMessageDialog(this, "Vui l??ng nh???p tu???i tr??n 18!");
			return false;
		} else if (ngayLam.after(Date.valueOf(LocalDate.now()))) {
			JOptionPane.showMessageDialog(this, "Nh???p ng??y ph???i tr?????c ng??y hi???n t???i!");
			return false;
		}

		return true;
	}

	@Override
	public void mouseClicked(MouseEvent e) {
		// TODO Auto-generated method stub
		Object o = e.getSource();
		if (o.equals(table)) {
			dienThongTin(table.getSelectedRow());
		}

	}

	@Override
	public void mouseEntered(MouseEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseExited(MouseEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mousePressed(MouseEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void mouseReleased(MouseEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob = e.getSource();
		if (ob.equals(btntimKiem)) {
			dienThongTin(cbotimKiem.getSelectedIndex());

		} else if (ob.equals(btnthem)) {
			// xoaRong();
			if (kiemTraDinhDang()) {
				qlNV = new QuanLyNhanVien();
				String ma = qlNV.tuDongLayMa();
				String ten = txttenNV.getText();
				String chuc = (String) cboChucVu.getSelectedItem();
				String phai;
				if (radNam.isSelected())
					phai = "Nam";
				else
					phai = "N???";
				Date ngaySinh = Date.valueOf(LocalDate.of(model1.getYear(), model1.getMonth() + 1, model1.getDay()));
				Date ngayLam = Date.valueOf(LocalDate.of(model2.getYear(), model2.getMonth() + 1, model2.getDay()));
				String cCCD = txtcmnd.getText();
				String sdt = txtsdt.getText();
				String diachi = txtsdt.getText();
				String email = txtemail.getText();
				int tinhTrang = 1;

				GiaoDienThemTaiKhoan tk = new GiaoDienThemTaiKhoan(ma, ten, chuc, phai, ngaySinh, ngayLam, cCCD, sdt,
						diachi, email, tinhTrang);
				tk.setVisible(true);
				setVisible(false);

			}
		} else if (ob.equals(btnthoat)) {
			setVisible(false);
		} else if (ob.equals(btnluu)) {
			if (kiemTraDinhDang()) {
				String ma = txtmaNV.getText().trim();
				String ten = txttenNV.getText();
				String chuc = (String) cboChucVu.getSelectedItem();
				String phai = "Sai";
				if (radNam.isSelected())
					phai = "Nam";
				if (radNu.isSelected())
					phai = "N???";
				Date ngaySinh = Date.valueOf(LocalDate.of(model1.getYear(), model1.getMonth() + 1, model1.getDay()));
				Date ngayLam = Date.valueOf(LocalDate.of(model2.getYear(), model2.getMonth() + 1, model2.getDay()));
				String cCCD = txtcmnd.getText();
				String sdt = txtsdt.getText();
				String diachi = txtsdt.getText();
				String email = txtemail.getText();
				int tinhTrang;
				if (rabLam.isSelected())
					tinhTrang = 1;
				else
					tinhTrang = 0;

				int row = table.getSelectedRow();
				if (qlNV.capNhat(ma, ten, chuc, phai, ngaySinh, ngayLam, cCCD, sdt, diachi, email, tinhTrang)) {
					int rowCount = table.getRowCount();
					for (int i = rowCount; i > 0; i--) {
						tableModel.removeRow(i - 1);
					}
					capNhatBangDuLieu();
					xoaRong();
					JOptionPane.showMessageDialog(this, "L??u th??nh c??ng !");
				} else
					JOptionPane.showMessageDialog(this, "L??u ko th??nh c??ng !");
			}

		} else if (ob.equals(btnxoa)) {
			xoaRong();
		}

	}
}
