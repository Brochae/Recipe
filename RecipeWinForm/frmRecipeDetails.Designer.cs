namespace RecipeWinForm
{
    partial class frmRecipeDetails
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            this.tblMain = new System.Windows.Forms.TableLayoutPanel();
            this.gIngredients = new System.Windows.Forms.DataGridView();
            this.gSteps = new System.Windows.Forms.DataGridView();
            this.tblButtons = new System.Windows.Forms.TableLayoutPanel();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.tblRecipeInfo = new System.Windows.Forms.TableLayoutPanel();
            this.lblNumberOfSteps = new System.Windows.Forms.Label();
            this.lblNumberOfCalories = new System.Windows.Forms.Label();
            this.lblRecipeStatus = new System.Windows.Forms.Label();
            this.lblDateArchived = new System.Windows.Forms.Label();
            this.lblDatePublished = new System.Windows.Forms.Label();
            this.lblDateDrafted = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.lblRecipeName = new System.Windows.Forms.Label();
            this.txtRecipeName = new System.Windows.Forms.TextBox();
            this.txtCalorieCount = new System.Windows.Forms.TextBox();
            this.txtSteps = new System.Windows.Forms.TextBox();
            this.txtIngredients = new System.Windows.Forms.TextBox();
            this.lblNumberOfIngredients = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.lstUsers = new System.Windows.Forms.ComboBox();
            this.lstCuisine = new System.Windows.Forms.ComboBox();
            this.tblMain.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gIngredients)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gSteps)).BeginInit();
            this.tblButtons.SuspendLayout();
            this.tblRecipeInfo.SuspendLayout();
            this.SuspendLayout();
            // 
            // tblMain
            // 
            this.tblMain.ColumnCount = 4;
            this.tblMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tblMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tblMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tblMain.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tblMain.Controls.Add(this.gIngredients, 0, 5);
            this.tblMain.Controls.Add(this.gSteps, 2, 5);
            this.tblMain.Controls.Add(this.tblButtons, 0, 6);
            this.tblMain.Controls.Add(this.tblRecipeInfo, 0, 1);
            this.tblMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tblMain.Location = new System.Drawing.Point(0, 0);
            this.tblMain.Name = "tblMain";
            this.tblMain.RowCount = 7;
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 5F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 200F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 95F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle());
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tblMain.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tblMain.Size = new System.Drawing.Size(1829, 1341);
            this.tblMain.TabIndex = 0;
            // 
            // gIngredients
            // 
            this.gIngredients.AllowUserToAddRows = false;
            this.gIngredients.AllowUserToDeleteRows = false;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.gIngredients.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.gIngredients.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.tblMain.SetColumnSpan(this.gIngredients, 2);
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.gIngredients.DefaultCellStyle = dataGridViewCellStyle2;
            this.gIngredients.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gIngredients.Location = new System.Drawing.Point(3, 343);
            this.gIngredients.Name = "gIngredients";
            this.gIngredients.RowHeadersWidth = 102;
            this.gIngredients.RowTemplate.Height = 49;
            this.gIngredients.Size = new System.Drawing.Size(908, 918);
            this.gIngredients.TabIndex = 8;
            // 
            // gSteps
            // 
            this.gSteps.AllowUserToAddRows = false;
            this.gSteps.AllowUserToDeleteRows = false;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.gSteps.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.gSteps.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.tblMain.SetColumnSpan(this.gSteps, 2);
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle4.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            dataGridViewCellStyle4.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle4.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle4.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle4.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.gSteps.DefaultCellStyle = dataGridViewCellStyle4;
            this.gSteps.Dock = System.Windows.Forms.DockStyle.Fill;
            this.gSteps.Location = new System.Drawing.Point(917, 343);
            this.gSteps.Name = "gSteps";
            this.gSteps.RowHeadersWidth = 102;
            this.gSteps.RowTemplate.Height = 49;
            this.gSteps.Size = new System.Drawing.Size(909, 918);
            this.gSteps.TabIndex = 9;
            // 
            // tblButtons
            // 
            this.tblButtons.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.tblButtons.AutoSize = true;
            this.tblButtons.ColumnCount = 2;
            this.tblMain.SetColumnSpan(this.tblButtons, 4);
            this.tblButtons.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblButtons.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tblButtons.Controls.Add(this.btnSave, 0, 0);
            this.tblButtons.Controls.Add(this.btnDelete, 0, 0);
            this.tblButtons.Location = new System.Drawing.Point(1438, 1268);
            this.tblButtons.Name = "tblButtons";
            this.tblButtons.RowCount = 1;
            this.tblButtons.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tblButtons.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tblButtons.Size = new System.Drawing.Size(388, 70);
            this.tblButtons.TabIndex = 14;
            // 
            // btnSave
            // 
            this.btnSave.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnSave.AutoSize = true;
            this.btnSave.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.btnSave.Location = new System.Drawing.Point(197, 3);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(188, 64);
            this.btnSave.TabIndex = 0;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            // 
            // btnDelete
            // 
            this.btnDelete.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnDelete.AutoSize = true;
            this.btnDelete.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.btnDelete.Location = new System.Drawing.Point(3, 3);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(188, 64);
            this.btnDelete.TabIndex = 1;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            // 
            // tblRecipeInfo
            // 
            this.tblRecipeInfo.ColumnCount = 5;
            this.tblMain.SetColumnSpan(this.tblRecipeInfo, 4);
            this.tblRecipeInfo.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tblRecipeInfo.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tblRecipeInfo.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tblRecipeInfo.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tblRecipeInfo.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tblRecipeInfo.Controls.Add(this.lblNumberOfSteps, 3, 0);
            this.tblRecipeInfo.Controls.Add(this.lblNumberOfCalories, 1, 0);
            this.tblRecipeInfo.Controls.Add(this.lblRecipeStatus, 3, 3);
            this.tblRecipeInfo.Controls.Add(this.lblDateArchived, 2, 3);
            this.tblRecipeInfo.Controls.Add(this.lblDatePublished, 1, 3);
            this.tblRecipeInfo.Controls.Add(this.lblDateDrafted, 0, 3);
            this.tblRecipeInfo.Controls.Add(this.label4, 3, 2);
            this.tblRecipeInfo.Controls.Add(this.label3, 2, 2);
            this.tblRecipeInfo.Controls.Add(this.label2, 1, 2);
            this.tblRecipeInfo.Controls.Add(this.label1, 0, 2);
            this.tblRecipeInfo.Controls.Add(this.lblRecipeName, 0, 0);
            this.tblRecipeInfo.Controls.Add(this.txtRecipeName, 0, 1);
            this.tblRecipeInfo.Controls.Add(this.txtCalorieCount, 1, 1);
            this.tblRecipeInfo.Controls.Add(this.txtSteps, 3, 1);
            this.tblRecipeInfo.Controls.Add(this.txtIngredients, 2, 1);
            this.tblRecipeInfo.Controls.Add(this.lblNumberOfIngredients, 2, 0);
            this.tblRecipeInfo.Controls.Add(this.label5, 4, 0);
            this.tblRecipeInfo.Controls.Add(this.label6, 4, 2);
            this.tblRecipeInfo.Controls.Add(this.lstUsers, 4, 1);
            this.tblRecipeInfo.Controls.Add(this.lstCuisine, 4, 3);
            this.tblRecipeInfo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tblRecipeInfo.Location = new System.Drawing.Point(3, 3);
            this.tblRecipeInfo.Name = "tblRecipeInfo";
            this.tblRecipeInfo.RowCount = 4;
            this.tblMain.SetRowSpan(this.tblRecipeInfo, 4);
            this.tblRecipeInfo.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tblRecipeInfo.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tblRecipeInfo.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tblRecipeInfo.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 25F));
            this.tblRecipeInfo.Size = new System.Drawing.Size(1823, 334);
            this.tblRecipeInfo.TabIndex = 27;
            // 
            // lblNumberOfSteps
            // 
            this.lblNumberOfSteps.AutoSize = true;
            this.lblNumberOfSteps.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblNumberOfSteps.Location = new System.Drawing.Point(1095, 0);
            this.lblNumberOfSteps.Name = "lblNumberOfSteps";
            this.lblNumberOfSteps.Size = new System.Drawing.Size(358, 83);
            this.lblNumberOfSteps.TabIndex = 3;
            this.lblNumberOfSteps.Text = "Number of Steps:";
            // 
            // lblNumberOfCalories
            // 
            this.lblNumberOfCalories.AutoSize = true;
            this.lblNumberOfCalories.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblNumberOfCalories.Location = new System.Drawing.Point(367, 0);
            this.lblNumberOfCalories.Name = "lblNumberOfCalories";
            this.lblNumberOfCalories.Size = new System.Drawing.Size(358, 83);
            this.lblNumberOfCalories.TabIndex = 1;
            this.lblNumberOfCalories.Text = "Number of Calories:";
            // 
            // lblRecipeStatus
            // 
            this.lblRecipeStatus.AutoSize = true;
            this.lblRecipeStatus.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblRecipeStatus.Location = new System.Drawing.Point(1095, 249);
            this.lblRecipeStatus.Name = "lblRecipeStatus";
            this.lblRecipeStatus.Size = new System.Drawing.Size(358, 85);
            this.lblRecipeStatus.TabIndex = 26;
            // 
            // lblDateArchived
            // 
            this.lblDateArchived.AutoSize = true;
            this.lblDateArchived.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblDateArchived.Location = new System.Drawing.Point(731, 249);
            this.lblDateArchived.Name = "lblDateArchived";
            this.lblDateArchived.Size = new System.Drawing.Size(358, 85);
            this.lblDateArchived.TabIndex = 25;
            // 
            // lblDatePublished
            // 
            this.lblDatePublished.AutoSize = true;
            this.lblDatePublished.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblDatePublished.Location = new System.Drawing.Point(367, 249);
            this.lblDatePublished.Name = "lblDatePublished";
            this.lblDatePublished.Size = new System.Drawing.Size(358, 85);
            this.lblDatePublished.TabIndex = 24;
            // 
            // lblDateDrafted
            // 
            this.lblDateDrafted.AutoSize = true;
            this.lblDateDrafted.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblDateDrafted.Location = new System.Drawing.Point(3, 249);
            this.lblDateDrafted.Name = "lblDateDrafted";
            this.lblDateDrafted.Size = new System.Drawing.Size(358, 85);
            this.lblDateDrafted.TabIndex = 23;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label4.Location = new System.Drawing.Point(1095, 166);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(358, 83);
            this.label4.TabIndex = 22;
            this.label4.Text = "RecipeStatus:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label3.Location = new System.Drawing.Point(731, 166);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(358, 83);
            this.label3.TabIndex = 21;
            this.label3.Text = "DateArchived:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label2.Location = new System.Drawing.Point(367, 166);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(358, 83);
            this.label2.TabIndex = 20;
            this.label2.Text = "DatePublished:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label1.Location = new System.Drawing.Point(3, 166);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(358, 83);
            this.label1.TabIndex = 19;
            this.label1.Text = "DateDrafted:";
            // 
            // lblRecipeName
            // 
            this.lblRecipeName.AutoSize = true;
            this.lblRecipeName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblRecipeName.Location = new System.Drawing.Point(3, 0);
            this.lblRecipeName.Name = "lblRecipeName";
            this.lblRecipeName.Size = new System.Drawing.Size(358, 83);
            this.lblRecipeName.TabIndex = 0;
            this.lblRecipeName.Text = "Recipe Name:";
            // 
            // txtRecipeName
            // 
            this.txtRecipeName.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtRecipeName.Location = new System.Drawing.Point(3, 86);
            this.txtRecipeName.Name = "txtRecipeName";
            this.txtRecipeName.Size = new System.Drawing.Size(358, 47);
            this.txtRecipeName.TabIndex = 15;
            // 
            // txtCalorieCount
            // 
            this.txtCalorieCount.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtCalorieCount.Location = new System.Drawing.Point(367, 86);
            this.txtCalorieCount.Name = "txtCalorieCount";
            this.txtCalorieCount.Size = new System.Drawing.Size(358, 47);
            this.txtCalorieCount.TabIndex = 16;
            // 
            // txtSteps
            // 
            this.txtSteps.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtSteps.Location = new System.Drawing.Point(1095, 86);
            this.txtSteps.Name = "txtSteps";
            this.txtSteps.Size = new System.Drawing.Size(358, 47);
            this.txtSteps.TabIndex = 18;
            // 
            // txtIngredients
            // 
            this.txtIngredients.Dock = System.Windows.Forms.DockStyle.Fill;
            this.txtIngredients.Location = new System.Drawing.Point(731, 86);
            this.txtIngredients.Name = "txtIngredients";
            this.txtIngredients.Size = new System.Drawing.Size(358, 47);
            this.txtIngredients.TabIndex = 17;
            // 
            // lblNumberOfIngredients
            // 
            this.lblNumberOfIngredients.AutoSize = true;
            this.lblNumberOfIngredients.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblNumberOfIngredients.Location = new System.Drawing.Point(731, 0);
            this.lblNumberOfIngredients.Name = "lblNumberOfIngredients";
            this.lblNumberOfIngredients.Size = new System.Drawing.Size(358, 83);
            this.lblNumberOfIngredients.TabIndex = 2;
            this.lblNumberOfIngredients.Text = "Number of Ingredients:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label5.Location = new System.Drawing.Point(1459, 0);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(361, 83);
            this.label5.TabIndex = 27;
            this.label5.Text = "Created By:";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Dock = System.Windows.Forms.DockStyle.Fill;
            this.label6.Location = new System.Drawing.Point(1459, 166);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(361, 83);
            this.label6.TabIndex = 28;
            this.label6.Text = "Cuisine:";
            // 
            // lstUsers
            // 
            this.lstUsers.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lstUsers.FormattingEnabled = true;
            this.lstUsers.Location = new System.Drawing.Point(1459, 86);
            this.lstUsers.Name = "lstUsers";
            this.lstUsers.Size = new System.Drawing.Size(361, 49);
            this.lstUsers.TabIndex = 29;
            // 
            // lstCuisine
            // 
            this.lstCuisine.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lstCuisine.FormattingEnabled = true;
            this.lstCuisine.Location = new System.Drawing.Point(1459, 252);
            this.lstCuisine.Name = "lstCuisine";
            this.lstCuisine.Size = new System.Drawing.Size(361, 49);
            this.lstCuisine.TabIndex = 30;
            // 
            // frmRecipeDetails
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(17F, 41F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1829, 1341);
            this.Controls.Add(this.tblMain);
            this.Name = "frmRecipeDetails";
            this.Text = "RecipeDetails";
            this.tblMain.ResumeLayout(false);
            this.tblMain.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gIngredients)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gSteps)).EndInit();
            this.tblButtons.ResumeLayout(false);
            this.tblButtons.PerformLayout();
            this.tblRecipeInfo.ResumeLayout(false);
            this.tblRecipeInfo.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private TableLayoutPanel tblMain;
        private Label lblRecipeName;
        private Label lblNumberOfCalories;
        private Label lblNumberOfIngredients;
        private Label lblNumberOfSteps;
        private TableLayoutPanel tblButtons;
        private Button btnSave;
        private Button btnDelete;
        private DataGridView gIngredients;
        private DataGridView gSteps;
        private TextBox txtRecipeName;
        private TextBox txtCalorieCount;
        private TextBox txtIngredients;
        private TextBox txtSteps;
        private TableLayoutPanel tblRecipeInfo;
        private Label lblRecipeStatus;
        private Label lblDateArchived;
        private Label lblDatePublished;
        private Label lblDateDrafted;
        private Label label4;
        private Label label3;
        private Label label2;
        private Label label1;
        private Label label5;
        private Label label6;
        private ComboBox lstUsers;
        private ComboBox lstCuisine;
    }
}