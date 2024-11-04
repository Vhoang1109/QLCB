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
    public partial class TuyenBay : Form
    {
        public TuyenBay()
        {
            InitializeComponent();
        }

        private void bt_them_Click(object sender, EventArgs e)
        {
            try
            {
                if (INSERT(txt_1.Text, comboBox1.SelectedValue.ToString(), comboBox2.SelectedValue.ToString()) != -1)
                {
                    dataGridView1.DataSource = cn.ExecuteData("select * from TUYENBAY");
                    MessageBox.Show("Đã thêm thành công", "Thông báo");
                }
                else
                {
                    MessageBox.Show("Thêm thất bại", "Thông báo");
                }
            }
            catch (Exception d)
            {
                MessageBox.Show("Thêm thất bại \n" + d.Message, "Thông báo");
            }
        }

        private void bt_Xoa_Click(object sender, EventArgs e)
        {
            if (txt_1.Text != "")
            {
                if (MessageBox.Show("Bạn muốn xóa tuyến bay: " + txt_1.Text, "Cảnh báo", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {
                    if (Delete(txt_1.Text) != -1)
                    {
                        MessageBox.Show("Đã xóa tuyến bay thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        TuyenBay_Load(new object(), new EventArgs());
                    }
                    else
                    {
                        MessageBox.Show("Xóa tuyến bay thất bại!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
            }
        }

        Connection cn = new Connection();
        private void TuyenBay_Load(object sender, EventArgs e)
        {
            comboBox1.DataSource = cn.ExecuteData("select * from sanbay");
            comboBox1.DisplayMember = "TenSanBay";
            comboBox1.ValueMember = "MaSanBay";
            comboBox2.DataSource = cn.ExecuteData("select * from sanbay");
            comboBox2.DisplayMember = "TenSanBay";
            comboBox2.ValueMember = "MaSanBay";
            txt_1.Text = "";
            dataGridView1.DataSource = cn.ExecuteData("select * from TUYENBAY");
            comboBox1.SelectedIndex = 0;
            comboBox2.SelectedIndex = 0;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_1.Text = comboBox1.SelectedValue + "-" + comboBox2.SelectedValue;
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_1.Text = comboBox1.SelectedValue + "-" + comboBox2.SelectedValue;
        }
        public int INSERT(string MATUYENBAY, string MASANBAYDI, string MASANBAYDEN)
        {
            if (MATUYENBAY == "")
                return -1;
            string sql = "INSERT INTO TUYENBAY(MATUYENBAY,MASANBAYDI,MASANBAYDEN) VALUES (N'" + MATUYENBAY + "',N'" + MASANBAYDI + "',N'" + MASANBAYDEN + "')";
            return cn.ExecuteNonQuery(sql);
        }

        public int Delete(string MATUYENBAY)
        {
            string sql = "DELETE FROM TUYENBAY WHERE [MATUYENBAY]=N'" + MATUYENBAY + "'";
            return cn.ExecuteNonQuery(sql);
        }

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            txt_1.Text = dataGridView1.CurrentRow.Cells["MATUYENBAY"].Value.ToString();
            comboBox1.SelectedValue = dataGridView1.CurrentRow.Cells["MASANBAYDI"].Value.ToString();
            comboBox2.SelectedValue = dataGridView1.CurrentRow.Cells["MASANBAYDEN"].Value.ToString();
        }

        private void txt_1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
