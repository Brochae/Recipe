using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace RecipeBizObjects
{
    public static class DataService
    {
        public static DataTable GetRecipeDBSummary()
        {
            return SQLUtility.GetDataTableFromSproc(DataUtility.ConnectionString, "RecipeSummaryGet");
        }
        public static DataTable GetRecipeList()
        {
            return SQLUtility.GetDataTableFromSproc(DataUtility.ConnectionString, "RecipeListGet");
        }
        public static DataTable GetRecipeHeader(int RecipeId)
        {
            SqlCommand cmd = SQLUtility.GetSQLCommand(DataUtility.ConnectionString, "RecipeHeaderGet");
            cmd.Parameters["@RecipeId"].Value = RecipeId;

            return SQLUtility.GetDataTable(cmd, DataUtility.ConnectionString);
        }
        public static DataTable GetRecipeIngredients(int RecipeId)
        {
            SqlCommand cmd = SQLUtility.GetSQLCommand(DataUtility.ConnectionString, "RecipeIngredientsGet");
            cmd.Parameters["@RecipeId"].Value = RecipeId;

            return SQLUtility.GetDataTable(cmd, DataUtility.ConnectionString);
        }
        public static DataTable GetRecipeSteps(int RecipeId)
        {
            SqlCommand cmd = SQLUtility.GetSQLCommand(DataUtility.ConnectionString, "RecipeStepsGet");
            cmd.Parameters["@RecipeId"].Value = RecipeId;

            return SQLUtility.GetDataTable(cmd, DataUtility.ConnectionString);
        }
        public static DataTable GetCuisineList(bool includeblank = false)
        {
            SqlCommand cmd = SQLUtility.GetSQLCommand(DataUtility.ConnectionString, "CuisineGet");
            cmd.Parameters["@IncludeBlank"].Value = includeblank;
            cmd.Parameters["@All"].Value = 1;

            return SQLUtility.GetDataTable(cmd, DataUtility.ConnectionString);
        }
        public static DataTable GetUsersList(bool includeblank = false)
        {
            SqlCommand cmd = SQLUtility.GetSQLCommand(DataUtility.ConnectionString, "UsersGet");
            cmd.Parameters["@IncludeBlank"].Value = includeblank;
            cmd.Parameters["@All"].Value = 1;

            return SQLUtility.GetDataTable(cmd, DataUtility.ConnectionString);
        }

    }
}
