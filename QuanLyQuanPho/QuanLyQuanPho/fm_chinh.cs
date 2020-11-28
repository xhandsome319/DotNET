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

namespace QuanLyQuanPho
{
    public partial class fm_chinh : Form
    {
        public fm_chinh()
        {
            InitializeComponent();
        }

        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void chủQuánToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fm_chuquan f = new fm_chuquan();
            f.Show();

        }
        Connection ketnoi = new Connection();

        private void fm_chinh_Load(object sender, EventArgs e)
        {           
          
                if (ketnoi.openConn() == true)
                {
                    MessageBox.Show("ket noi thanh cong ");
                }
                else
                    MessageBox.Show("ket noi that bai ");

                ketnoi.openConn();
                String sql = "SELECT * FROM TableFood";
                SqlDataReader drd = ketnoi.executeSQL(sql);
                String kq = ""; while (drd.Read())
                {
                    kq += drd["name"].ToString() + ", ";
                }
                drd.Close();
                sql = "SELECT * FROM TableFood";
                DataTable dt2 = ketnoi.loadDataTable(sql);
                dataGridView1.DataSource = dt2;

        }

    }
}
