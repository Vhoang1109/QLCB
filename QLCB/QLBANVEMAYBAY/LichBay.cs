using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QLBANVEMAYBAY
{
    public partial class LichBay : Form
    {
        public LichBay()
        {
            InitializeComponent();
        }

        Connection cn = new Connection();

        private void frm_ThemChuyenBay_Load(object sender, EventArgs e)
        {

            dataGridView1.DataSource = SelectAll();
            comboBox1.DataSource = cn.ExecuteData("select * from sanbay ");
            comboBox1.DisplayMember = "TenSanBay";
            comboBox1.ValueMember = "MaSanBay";
            comboBox1.SelectedIndex = 0;

            comboBox2.DataSource = cn.ExecuteData("select MASANBAY, TENSANBAY from TUYENBAY, SANBAY where SANBAY.MASANBAY = TUYENBAY.MASANBAYDEN and MASANBAYDI='" + comboBox1.SelectedValue + "' ");
            comboBox2.DisplayMember = "TENSANBAY";
            comboBox2.ValueMember = "MASANBAY";
        }
        public DataTable SelectAll()
        {
            return cn.ExecuteData("select * from CCHUYENBAY");
        }
        public int INSERT(string MACHUYENBAY, string SANBAYDI, string SANBAYDEN, DateTime NGAYGIO, int THOIGIANBAY, int SOLUONGGHEHANG1, int SOLUONGGHEHANG2)
        {
            string sql = "INSERT INTO CCHUYENBAY(MACHUYENBAY,SANBAYDI,SANBAYDEN,NGAYGIO,THOIGIANBAY,SOLUONGGHEHANG1,SOLUONGGHEHANG2) VALUES (N'" + MACHUYENBAY + "',N'" + SANBAYDI + "',N'" + SANBAYDEN + "',N'" + NGAYGIO.ToString("MM/dd/yyyy") + "'," + THOIGIANBAY + "," + SOLUONGGHEHANG1 + "," + SOLUONGGHEHANG2 + ")";
            return cn.ExecuteNonQuery(sql);
        }
        public int UPDATE(string MACHUYENBAY, string SANBAYDI, string SANBAYDEN, DateTime NGAYGIO, int THOIGIANBAY, int SOLUONGGHEHANG1, int SOLUONGGHEHANG2)
        {
            string sql = "UPDATE CCHUYENBAY SET [MACHUYENBAY]='" + MACHUYENBAY + "',[SANBAYDI]='" + SANBAYDI + "',[SANBAYDEN]='" + SANBAYDEN + "',[NGAYGIO]='" + NGAYGIO.ToString("MM/dd/yyyy") + "',[THOIGIANBAY]=" + THOIGIANBAY + ",[SOLUONGGHEHANG1]=" + SOLUONGGHEHANG1 + ",[SOLUONGGHEHANG2]=" + SOLUONGGHEHANG2 + " WHERE [MACHUYENBAY]=N'" + MACHUYENBAY + "'";
            return cn.ExecuteNonQuery(sql);
        }
        public int Delete(string MACHUYENBAY)
        {
            string sql = "DELETE FROM CCHUYENBAY WHERE [MACHUYENBAY]=N'" + MACHUYENBAY + "'";
            return cn.ExecuteNonQuery(sql);
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboBox2.Text = "";
            comboBox2.DataSource = cn.ExecuteData("select MASANBAY, TENSANBAY from TUYENBAY, SANBAY where SANBAY.MASANBAY = TUYENBAY.MASANBAYDEN and MASANBAYDI='" + comboBox1.SelectedValue + "' ");
            comboBox2.DisplayMember = "TENSANBAY";
            comboBox2.ValueMember = "MASANBAY";
          

        }

        private void button1_Click(object sender, EventArgs e)
        {
            SanBay sb = new SanBay();
            sb.ShowDialog();
            comboBox1.DataSource = cn.ExecuteData("select * from sanbay ");
            comboBox1.DisplayMember = "TenSanBay";
            comboBox1.ValueMember = "MaSanBay";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            TuyenBay tb = new TuyenBay();
            tb.ShowDialog();
        }

        private void bt_them_Click(object sender, EventArgs e)
        {
            try
            {
                if (INSERT(textBox1.Text, comboBox1.Text, comboBox2.Text, dateTimePicker1.Value, int.Parse(textBox6.Text), int.Parse(textBox2.Text), int.Parse(textBox3.Text)) != -1)
                {
                    dataGridView1.DataSource = SelectAll();
                    MessageBox.Show("Thêm dữ liệu thành công", "Thông báo");
                }
                else
                {
                    MessageBox.Show("Thêm dữ liệu thất bại", "Thông báo");
                }
            }
            catch (Exception m) { MessageBox.Show(m.Message, "Thông báo"); }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            try
            {
                textBox1.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
                comboBox1.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
               comboBox2.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
                dateTimePicker1.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
                textBox6.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
                textBox2.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
                textBox3.Text = dataGridView1.CurrentRow.Cells[6].Value.ToString();
            }
            catch { }
        }

        private void bt_capnhat_Click(object sender, EventArgs e)
        {
            if (UPDATE(textBox1.Text, comboBox1.Text, comboBox2.Text, dateTimePicker1.Value, int.Parse(textBox6.Text), int.Parse(textBox2.Text), int.Parse(textBox3.Text)) != -1)
            {
                MessageBox.Show("Đã cập nhật thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                frm_ThemChuyenBay_Load(new object(), new EventArgs());
            }
            else
            {
                MessageBox.Show("Cập nhật thất bại!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void bt_xoa_Click(object sender, EventArgs e)
        {
            if (textBox1.Text != "")
            {
                if (MessageBox.Show("Bạn muốn xóa chuyến bay: " + textBox1.Text, "Cảnh báo", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {
                    if (Delete(textBox1.Text) != -1)
                    {
                        MessageBox.Show("Đã xóa chuyến bay thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        frm_ThemChuyenBay_Load(new object(), new EventArgs());
                    }
                    else
                    {
                        MessageBox.Show("Xóa chuyến bay thất bại!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
            }
        }

        private void bt_re_Click(object sender, EventArgs e)
        {
            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();
            textBox6.Clear();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            SanBay sb = new SanBay();
            sb.ShowDialog();
            comboBox1.DataSource = cn.ExecuteData("select * from SanBay ");
            comboBox1.DisplayMember = "TenSanBay";
            comboBox1.ValueMember = "MaSanBay";
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            TuyenBay tb = new TuyenBay();
            tb.ShowDialog();
            comboBox2.DataSource = cn.ExecuteData("select MASANBAY, TENSANBAY from TUYENBAY, SANBAY where SANBAY.MASANBAY = TUYENBAY.MASANBAYDEN and MASANBAYDI='" + comboBox1.SelectedValue + "' ");
            comboBox2.DisplayMember = "TENSANBAY";
            comboBox2.ValueMember = "MASANBAY";
        }
        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
