namespace RecipeWinForm
{
    partial class frmMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tblMain = new System.Windows.Forms.TableLayoutPanel();
            this.gRecipeSummary = new System.Windows.Forms.DataGridView();
            this.gRecipeList = new System.Windows.Forms.DataGridView();
            this.btnNewRecipe = new System.Windows.Forms.Button();
            this.tblMain.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gRecipeSummary)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gRecipeList)).BeginInit();
            this.SuspendLayout();
            // 
            // tblMain
            // 
            this.tblMain.ColumnCount = 2;
            this.tblMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblMain.Controls.Add(this.gRecipeSummary, 0, 0);
            this.tblMain.Controls.Add(this.gRecipeList, 1, 0);
            this.tblMain.Controls.Add(this.btnNewRecipe, 1, 1);
            this.tblMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tblMain.Location = new System.Drawing.Point(0, 0);
            this.tblMain.Name = "tblMain";
            this.tblMain.RowCount = 2;
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tblMain.Size = new System.Drawing.Size(1808, 1406);
            this.tblMain.TabIndex = 0;
            // 
            // gRecipeSummary
            // 
            this.gRecipeSummary.AllowUserToAddRows = false;
            this.gRecipeSummary.AllowUserToDeleteRows = false;
            this.gRecipeSummary.AllowUserToOrderColumns = true;
            this.gRecipeSummary.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gRecipeSummary.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gRecipeSummary.Location = new System.Drawing.Point(3, 3);
            this.gRecipeSummary.Name = "gRecipeSummary";
            this.gRecipeSummary.RowHeadersWidth = 102;
            this.gRecipeSummary.RowTemplate.Height = 49;
            this.gRecipeSummary.Size = new System.Drawing.Size(898, 1330);
            this.gRecipeSummary.TabIndex = 0;
            // 
            // gRecipeList
            // 
            this.gRecipeList.AllowUserToAddRows = false;
            this.gRecipeList.AllowUserToDeleteRows = false;
            this.gRecipeList.AllowUserToOrderColumns = true;
            this.gRecipeList.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.gRecipeList.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.gRecipeList.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gRecipeList.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gRecipeList.Location = new System.Drawing.Point(907, 3);
            this.gRecipeList.Name = "gRecipeList";
            this.gRecipeList.RowHeadersWidth = 102;
            this.gRecipeList.RowTemplate.Height = 49;
            this.gRecipeList.Size = new System.Drawing.Size(898, 1330);
            this.gRecipeList.TabIndex = 1;
            // 
            // btnNewRecipe
            // 
            this.btnNewRecipe.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnNewRecipe.AutoSize = true;
            this.btnNewRecipe.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.btnNewRecipe.Location = new System.Drawing.Point(1564, 1339);
            this.btnNewRecipe.Name = "btnNewRecipe";
            this.btnNewRecipe.Size = new System.Drawing.Size(241, 64);
            this.btnNewRecipe.TabIndex = 2;
            this.btnNewRecipe.Text = "New Recipe";
            this.btnNewRecipe.UseVisualStyleBackColor = true;
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(17F, 41F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1808, 1406);
            this.Controls.Add(this.tblMain);
            this.Name = "frmMain";
            this.Text = "Recipe";
            this.tblMain.ResumeLayout(false);
            this.tblMain.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gRecipeSummary)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gRecipeList)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private TableLayoutPanel tblMain;
        private DataGridView gRecipeSummary;
        private DataGridView gRecipeList;
        private Button btnNewRecipe;
    }
}