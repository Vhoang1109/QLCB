using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Security.Cryptography;
using System.Text;


namespace QLBANVEMAYBAY
{
    public class Connection
    {

        //SqlConnection cn = new SqlConnection(@"Data Source=MSI;Initial Catalog=QuanlyBanVe;Integrated Security=True");  MSI tên SQL name, QuanLyBanVe tên CSDL có ở SQL
        //string chuoiketnoi = @"Data Source=MSI;Initial Catalog=QuanLyBanVe;Integrated Security=True";
        SqlConnection cn = new SqlConnection(@"Data Source=MSI;Initial Catalog=QuanlyBanVe;Integrated Security=True");
        string chuoiketnoi = @"Data Source=MSI;Initial Catalog=QuanLyBanVe;Integrated Security=True";
        public Connection()
        {

            if (cn.State == ConnectionState.Closed)
            {
                cn.Open();
            }
        }

        public Connection(string s)
        {
            cn = new SqlConnection(s);
        }

        public SqlConnection connection()
        {
            SqlConnection conn = new SqlConnection(chuoiketnoi);
            return conn;
        }
        public void KetNoi()
        {
            if (cn.State == ConnectionState.Closed)
                cn.Open();
        }    
        public void DongKetNoi()
        {
            if (cn.State == ConnectionState.Open)
                cn.Close();
        }  
        public int ExecuteNonQuery(string strQuery)
        {
            int CS = -1;
            try
            {
                int result = 0;
                if (this.cn.State == ConnectionState.Closed)
                {
                    this.cn.Open();
                }
                result = new SqlCommand { Connection = this.cn, CommandType = CommandType.Text, CommandText = strQuery }.ExecuteNonQuery();
                this.cn.Close();
                CS = result;
            }
            catch
            {
                
                return -1;
            }
            return CS;
        }
      
        public DataTable ExecuteData(string strQuery)
        {
            try
            {
                KetNoi();
                SqlDataAdapter adapter = new SqlDataAdapter(strQuery, cn);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet);
                DongKetNoi();
                return dataSet.Tables[0];
            }
            catch { return null; }
        }
        public object ExecuteScalar(string sql)
        {
            object CS = null;
            try
            {
                object result = 0;
                KetNoi();
                result = new SqlCommand { Connection = this.cn, CommandType = CommandType.Text, CommandText = sql }.ExecuteScalar();
                DongKetNoi();
                CS = result;
            }
            catch
            {
                return null;

            }
            return CS;
        }
        public int ThemSuaXoa(string sql)
        {
            SqlCommand comm = new SqlCommand(sql, cn);
            KetNoi();
            int ketqua = comm.ExecuteNonQuery();
            DongKetNoi();
            return ketqua;
        }
        public static string Encrypt_md5(string p)
        {

            MD5CryptoServiceProvider mdcsp = new MD5CryptoServiceProvider();
            byte[] b = System.Text.Encoding.UTF8.GetBytes(p);
            b = mdcsp.ComputeHash(b);
            StringBuilder s = new StringBuilder();
            foreach (byte by in b)
            {
                s.Append(by.ToString("x2").ToLower());
            }
            return s.ToString();
        }
        public DataTable LoadDuLieu(string sql)
        {
            SqlDataAdapter da = new SqlDataAdapter(sql, cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }
}
