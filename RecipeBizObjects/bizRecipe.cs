using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;
using System.Data;
using System.Data.SqlClient;
using Dapper;
using System.ComponentModel.DataAnnotations;

namespace RecipeBizObjects
{
    public class bizRecipe : bizObject<bizRecipe>
    {
        string recipenameval = "";
        string recipestatusval = "";
        string codeval = "";
        string cuisinenameval = "";
        string userfullnameval = "";
        int createdbyuseridval;
        int cuisineidval;
        int caloriecountval;
        int totalingredientsval;
        int totalstepsval;
        DateTime? datedraftedval;
        DateTime? datepublishedval;
        DateTime? datearchivedval;
        List<bizRecipeIngredients> lstingredients;
        List<bizRecipeSteps> lststeps;
        public bizRecipe()
        {
        }
        public void Save()
        {
            DynamicParameters dp = new(this);
            SqlMapper.AddTypeMap(typeof(DateTime), DbType.DateTime2);
            dp.Output<bizRecipe>(this, r => r.RecipeId);
            dp.Output<bizRecipe>(this, r => r.DateDrafted);
            dp.Output<bizRecipe>(this, r => r.RecipeCode);

            SQLUtility.ExecuteSQLDapper(SprocName(SprocActionEnum.Update), dp);
            
        }
        public int RecipeId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        [Display(Name = "Name")]
        public string RecipeName
        {
            get
            {
                return recipenameval;
            }
            set
            {
                recipenameval = value;
                InvokePropertyChanged();
            }
        }
        [Required]
        [Display(Name ="Created By User")]
        public int CreatedByUserId
        {
            get
            {
                return createdbyuseridval;
            }
            set
            {
                createdbyuseridval = value;
                InvokePropertyChanged();
            }
        }
        [Display(Name = "Created By User")]
        public string UserFullName
        {
            get
            {
                return userfullnameval;
            }
            set
            {
                userfullnameval = value;
                InvokePropertyChanged();
            }
        }
        [Required]
        [Display(Name = "Cuisine")]
        public int CuisineId
        {
            get
            {
                return cuisineidval;
            }
            set
            {
                cuisineidval = value;
                InvokePropertyChanged();
            }
        }
        [Display(Name = "Cuisine")]
        public string CuisineName
        {
            get
            {
                return cuisinenameval;
            }
            set
            {
                cuisinenameval = value;
                InvokePropertyChanged();
            }
        }
        [Display(Name ="Calorie Count")]
        public int CalorieCount
        {
            get
            {
                return caloriecountval;
            }
            set
            {
                caloriecountval = value;
                InvokePropertyChanged();
            }
        }
        [Display(Name ="Total Ingredients")]
        public int TotalIngredients
        {
            get
            {
                return totalingredientsval;
            }
            set
            {
                totalingredientsval = value;
                InvokePropertyChanged();
            }
        }
        [Display(Name ="Total Steps")]
        public int TotalSteps
        {
            get
            {
                return totalstepsval;
            }
            set
            {
                totalstepsval = value;
                InvokePropertyChanged();
            }
        }
        [Display(Name ="Date Drafted")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        [DataType(DataType.Date)]
        public DateTime? DateDrafted
        {
            get
            {
                return datedraftedval;
            }
            set
            {
                datedraftedval = value;
                InvokePropertyChanged();
            }
        }
        [Display(Name ="Date Published")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        [DataType(DataType.Date)]
        public DateTime? DatePublished
        {
            get
            {
                return datepublishedval;
            }
            set
            {
                datepublishedval = value;
                InvokePropertyChanged();
            }
        }
        [Display(Name ="Date Archived")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:yyyy-MM-dd}")]
        [DataType(DataType.Date)]
        public DateTime? DateArchived
        {
            get
            {
                return datearchivedval;
            }
            set
            {
                datearchivedval = value;
                InvokePropertyChanged();
            }
        }
        [Display(Name = "Status")]
        public string RecipeStatus
        {
            get
            {
                return recipestatusval;
            }
            set
            {
                recipestatusval = value;
                InvokePropertyChanged();
            }
        }
        [Display(Name ="Code")]
        public string RecipeCode
        {
            get
            {
                return codeval;
            }
            set
            {
                codeval = value;
                InvokePropertyChanged();
            }
        }
        public List<bizRecipeIngredients> IngredientsList(bool refresh)
        {
            if (refresh == true || lstingredients == null)
            {
                lstingredients = bizRecipeIngredients.GetList("RecipeId", this.RecipeId);
            }
            return lstingredients;
        }
        public List<bizRecipeSteps> StepsList(bool refresh)
        {
            if (refresh == true || lststeps == null)
            {
                lststeps = bizRecipeSteps.GetList("RecipeId", this.RecipeId);
            }
            return lststeps;
        }

        public List<bizCuisine> CuisineList()
        {
            return bizCuisine.GetAll();
        }

        public List<bizUsers> UsersList()
        {
            return bizUsers.GetAll();
        }
        
    }
}
