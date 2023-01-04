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

namespace RecipeWinForm
{
    public partial class frmRecipeDetails : Form
    {
        bizRecipe recipeobj = new();
        public frmRecipeDetails()
        {
            InitializeComponent();
            btnDelete.Click += BtnDelete_Click;
            btnSave.Click += BtnSave_Click;
        }

        public void ShowRecipeDetails(int RecipeId)
        {
            recipeobj = bizRecipe.Get(RecipeId);//new bizRecipe();

            lstCuisine.DataSource = DataService.GetCuisineList(true);
            lstCuisine.ValueMember = "CuisineId";
            lstCuisine.DisplayMember = "CuisineName";

            lstUsers.DataSource = DataService.GetUsersList(true);
            lstUsers.ValueMember = "UserId";
            lstUsers.DisplayMember = "UserFullName";

            lstCuisine.DataBindings.Add("SelectedValue", recipeobj, "CuisineId");
            lstUsers.DataBindings.Add("SelectedValue", recipeobj, "CreatedByUserId");

            txtRecipeName.DataBindings.Add("Text", recipeobj, "RecipeName");
            txtCalorieCount.DataBindings.Add("Text", recipeobj, "CalorieCount");
            txtIngredients.DataBindings.Add("Text", recipeobj, "TotalIngredients");
            txtSteps.DataBindings.Add("Text", recipeobj, "TotalSteps");
            lblDateDrafted.DataBindings.Add("Text", recipeobj, "DateDrafted");
            lblDatePublished.DataBindings.Add("Text", recipeobj, "DatePublished");
            lblDateArchived.DataBindings.Add("Text", recipeobj, "DateArchived");
            lblRecipeStatus.DataBindings.Add("Text", recipeobj, "RecipeStatus");

            gIngredients.DataSource = DataService.GetRecipeIngredients(RecipeId);
            gSteps.DataSource = DataService.GetRecipeSteps(RecipeId);

            this.Show();
            this.FormatGrid(gIngredients, "RecipeId");
            this.FormatGrid(gSteps, "RecipeId");
            
        }
        private void FormatGrid(DataGridView gridobj,string PrimaryKeyFieldName = "")
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
        private void Delete()
        {
            try
            {
                recipeobj.Delete();
                this.Close();
            }
            catch (CPUException ex)
            {
                MessageBox.Show(ex.FriendlyMessage, this.Text, MessageBoxButtons.OK);
            }
        }
        private void Save()
        {
            try
            {
                recipeobj.Save();
            }
            catch (CPUException ex)
            {
                MessageBox.Show(ex.FriendlyMessage, this.Text, MessageBoxButtons.OK);
            }

        }

        private void BtnDelete_Click(object? sender, EventArgs e)
        {
            Delete();
        }
        private void BtnSave_Click(object? sender, EventArgs e)
        {
            Save();
        }
    }
}
