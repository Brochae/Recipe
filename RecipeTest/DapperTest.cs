using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using CPUFramework;
using RecipeBizObjects;
using System.Data;
using NUnit.Framework;
using System.Data.SqlClient;


namespace RecipeTest
{
    internal class DapperTest
    {
        string newrecipename = "";
        string maxrecipeidname = "";
        int totalrecipes;
        int maxrecipeid;
        int maxrecipeidsteps;
        int randomuser;
        int randomcuisine;
        int zerocaloriecuisineid;
        DataTable dt = new();
        [SetUp]
        public void Setup()
        {
            DataUtility.SetSQLExpressConnectionString("RecipeDB");

            dt = SQLUtility.GetDataTable(DataUtility.ConnectionString, "select Total = Count(*) from Recipe");

            totalrecipes = (int)dt.Rows[0]["Total"];

            dt = SQLUtility.GetDataTable(DataUtility.ConnectionString, "select top 1 r.RecipeId, r.RecipeName, TotalIngredients = COUNT(distinct ri.IngredientId), TotalSteps = COUNT(distinct rs.SequenceNum), r.CreatedByUserId from recipe r join RecipeIngredient ri on r.RecipeId = ri.RecipeId join RecipeStep rs on r.RecipeId = rs.RecipeId group by r.RecipeId, r.RecipeName, r.CalorieCount, r.CreatedByUserId order by r.recipeId");
            maxrecipeid = (int)dt.Rows[0]["RecipeId"];
            maxrecipeidsteps = (int)dt.Rows[0]["TotalSteps"];
            maxrecipeidname = (string)dt.Rows[0]["RecipeName"];

            dt = SQLUtility.GetDataTable(DataUtility.ConnectionString, "select top 1 u.UserId from users u order by u.UserId desc");
            randomuser = (int)dt.Rows[0]["UserId"];
            dt = SQLUtility.GetDataTable(DataUtility.ConnectionString, "select top 1 c.CuisineId from cuisine c");
            randomcuisine = (int)dt.Rows[0]["CuisineId"];
            dt = SQLUtility.GetDataTable(DataUtility.ConnectionString, "select c.CuisineId from Cuisine c where c.CuisineName = 'Zero Calorie'");
            zerocaloriecuisineid = (int)dt.Rows[0]["CuisineId"];

        }

        private SqlConnection GetConnection()
        {
            return new(DataUtility.ConnectionString);
        }

        private bizRecipe LoadRecipe(int Id)
        {
            bizRecipe recipeobj = bizRecipe.Get(Id);
            return recipeobj;
        }

        private List<bizRecipe> LoadRecipeList()
        {
            List<bizRecipe> lst = bizRecipe.GetAll();
            return lst;
        }

        private bizRecipe InsertNewRecipe()
        {
            newrecipename = "RecipeTest " + DateTime.Now.ToString();
            bizRecipe recipeobj = new();
            recipeobj.RecipeName = newrecipename;
            recipeobj.CalorieCount = 364;
            recipeobj.CreatedByUserId = randomuser;
            recipeobj.CuisineId = randomcuisine;

            recipeobj.Save();

            return recipeobj;
        }

        private void UpdateRecipeName( bizRecipe recipeobj)
        {
            recipeobj.CreatedByUserId = randomuser;

            recipeobj.Save();
   
        }
        private int DeleteRecipe(int Id = 0)
        {
            bizRecipe recipeobj;
            if (Id == 0)
            {
                recipeobj = this.InsertNewRecipe();
            }
            else
            {
                recipeobj = this.LoadRecipe(Id);
            }
            Id = recipeobj.RecipeId;

            recipeobj.Delete();

            return Id;
        }

        private bizRecipe InsertRecipeWithMissingData()
        {
            newrecipename = "RecipeTest " + DateTime.Now.ToString();
            bizRecipe recipeobj = new();
            recipeobj.CalorieCount = 364;
            recipeobj.CreatedByUserId = randomuser;
            recipeobj.CuisineId = randomcuisine;
            recipeobj.DateDrafted = DateTime.Now;
            recipeobj.DatePublished = DateTime.Now;
            recipeobj.DateArchived = DateTime.Now;

            recipeobj.Save();

            return recipeobj;
        }
        
        private void ZeroCalorieCuisine()
        {
            bizRecipe recipeobj = bizRecipe.Get(maxrecipeid);
            recipeobj.CuisineId = zerocaloriecuisineid;

            recipeobj.Save();

        }
        [Test]

        public void TestLoadRecipe()
        {
            bizRecipe r = this.LoadRecipe(maxrecipeid);
            TestContext.WriteLine(r.RecipeName);
            Assert.IsTrue(r.TotalSteps == maxrecipeidsteps);
        }

        [Test]

        public void TestLoadRecipeList()
        {
            List<bizRecipe> lst = this.LoadRecipeList();
            TestContext.WriteLine("Total Recipes = " + lst.Count);
            Assert.IsTrue(lst.Count == totalrecipes);
        }

        [Test]

        public void TestInsertNewRecipe()
        {
            bizRecipe r = this.InsertNewRecipe();
            TestContext.WriteLine("Recipe Name: " + r.RecipeName);
            Assert.IsTrue(r.RecipeName == newrecipename);
            r.Delete();
        }

        [Test]
        public void TestUpdateRecipe()
        {
            bizRecipe recipeobj = this.LoadRecipe(maxrecipeid);
            int olduserid = recipeobj.CreatedByUserId;
            this.UpdateRecipeName(recipeobj);
            TestContext.WriteLine("Original Id: " + olduserid+ " New Id: " + recipeobj.CreatedByUserId);
            Assert.IsTrue(recipeobj.CreatedByUserId == randomuser);

        }

        [Test]

        public void TestDeleteNewRecipe()
        {
            int Id = this.DeleteRecipe();
            bizRecipe recipeobj = this.LoadRecipe(Id);
            Assert.IsTrue(recipeobj.RecipeId == 0);
        }

        [Test]

        public void TestInsertRecipeWithMissingData()
        {
            CPUException? ex = Assert.Throws<CPUException>(() => this.InsertRecipeWithMissingData());
            TestContext.WriteLine(ex?.FriendlyMessage);
        }

        [Test]

        public void TestZeroCalorieCuisine()
        {
            CPUException? ex = Assert.Throws<CPUException>(() => this.ZeroCalorieCuisine());
            TestContext.WriteLine(ex?.FriendlyMessage);
        }
    
    }
}
