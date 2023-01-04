using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using RecipeBizObjects;
using CPUFramework;
using System.Data.SqlClient;

namespace RecipeWinForm
{
    public partial class frmMain : Form
    {
        public frmMain()
        {
            InitializeComponent();
            DataUtility.SetSQLExpressConnectionString("RecipeDB");
           
            BindForm();
            gRecipeList.CellDoubleClick += GRecipeList_CellDoubleClick;
            btnNewRecipe.Click += BtnNewRecipe_Click;


        }

        private void BindForm()
        {
            gRecipeSummary.DataSource = DataService.GetRecipeDBSummary();
            //gRecipeList.DataSource = DataService.GetRecipeList();
            gRecipeList.DataSource = bizRecipe.GetAll();


            this.FormatGrid(gRecipeSummary);
            this.FormatGrid(gRecipeList, "RecipeId");
        }
        private void FormatGrid(DataGridView gridobj, string PrimaryKeyFieldName = "")
        {
            gridobj.ReadOnly = true;
            gridobj.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            gridobj.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
            gridobj.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;
            gridobj.RowHeadersWidth = 25;

            if (PrimaryKeyFieldName != "")
            {
                gridobj.Columns[PrimaryKeyFieldName].Visible = false;
            }

        }
        private void GRecipeList_CellDoubleClick(object? sender, DataGridViewCellEventArgs e)
        {
            int RecipeId = (int)gRecipeList.Rows[e.RowIndex].Cells["RecipeId"].Value;
            frmRecipeDetails f = new frmRecipeDetails();
            this.StartPosition = FormStartPosition.CenterParent;
            f.ShowRecipeDetails(RecipeId);

            this.Show();

        }
        private void CreateNewRecipe()
        {
            frmRecipeDetails f = new();
            this.StartPosition = FormStartPosition.CenterScreen;
            f.ShowRecipeDetails(0);

            this.Show();
        }
        private void BtnNewRecipe_Click(object? sender, EventArgs e)
        {
            CreateNewRecipe();
        }
    }
}
