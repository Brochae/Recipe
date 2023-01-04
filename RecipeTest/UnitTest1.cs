using CPUFramework;
using RecipeBizObjects;
using System.Data;
using System.Data.SqlClient;
using Dapper;

namespace RecipeTest
{
    public class Tests
    {
        int totalrecipes;
        int minrecipeid;
        int minrecipeidsteps;
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
            minrecipeid = (int)dt.Rows[0]["RecipeId"];
            minrecipeidsteps = (int)dt.Rows[0]["TotalSteps"];

            dt = SQLUtility.GetDataTable(DataUtility.ConnectionString, "select top 1 u.UserId from users u");
            randomuser = (int)dt.Rows[0]["UserId"];
            dt = SQLUtility.GetDataTable(DataUtility.ConnectionString, "select top 1 c.CuisineId from cuisine c");
            randomcuisine = (int)dt.Rows[0]["CuisineId"];
            dt = SQLUtility.GetDataTable(DataUtility.ConnectionString, "select c.CuisineId from Cuisine c where c.CuisineName = 'Zero Calorie'");
            zerocaloriecuisineid = (int)dt.Rows[0]["CuisineId"];

        }
        [Test]
        public void TestLoadRecipeDapper()
        {
            using (SqlConnection conn = new(DataUtility.ConnectionString))
            {
                bizRecipe recipeobj = conn.QueryFirstOrDefault<bizRecipe>("select top 1 * from Recipe r join Cuisine c on r.CuisineId = c.CuisineId join Users u on r.CreatedByUserId = u.UserId");
                TestContext.WriteLine(recipeobj.RecipeName + " " + recipeobj.CuisineId);
            }
        }

        [Test]
        public void TestRecipeList()
        {
            DataTable dt = DataService.GetRecipeList();
            TestContext.WriteLine("Num Recipes: " + dt.Rows.Count.ToString());
            Assert.IsTrue(dt.Rows.Count == totalrecipes, "Num Recipes: " + dt.Rows.Count.ToString());
        }
        [Test]
        public void TestLoadRecipe()
        {
            bizRecipe recipeobj = bizRecipe.Get(minrecipeid);
            TestContext.WriteLine("Steps in this Recipe: " + recipeobj.TotalSteps);
            Assert.IsTrue(recipeobj.TotalSteps == minrecipeidsteps);

        }
        [Test]
        public void TestNewRecipe()
        {
            bizRecipe recipeobj = new();
            recipeobj.RecipeName = "RecipeTest";
            recipeobj.CalorieCount = 364;
            recipeobj.CreatedByUserId = randomuser;
            recipeobj.CuisineId = randomcuisine;
            recipeobj.DateDrafted = DateTime.Now;
            recipeobj.DatePublished = DateTime.Now;
            recipeobj.DateArchived = DateTime.Now;
            recipeobj.Save();
            TestContext.WriteLine("Recipe Name: " + recipeobj.RecipeName);
            recipeobj.Delete();

        }
        [Test]
        public void TestZeroCalorieCuisine()
        {
            bizRecipe recipeobj = bizRecipe.Get(minrecipeid);
            recipeobj.CuisineId = zerocaloriecuisineid;
            Assert.Throws<CPUException>(() => recipeobj.Save(), "If the Cuisine Type is \"Zero Calorie\" the number of calories must be zero.");
        }
        [Test]
        public void TestNewRecipeWithMissingData()
        {
            bizRecipe recipeobj = new();
            recipeobj.RecipeName = "Cherry Pie";
            recipeobj.CreatedByUserId = randomuser;
            recipeobj.DateDrafted = DateTime.Now;
            recipeobj.DatePublished = DateTime.Now;
            recipeobj.DateArchived = DateTime.Now;
            Assert.Throws<CPUException>(() => recipeobj.Save(), "This Recipe record cannot be saved as attempted because the value for Cuisine is not valid.");
        }
    }
}