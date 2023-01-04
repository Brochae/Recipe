using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace RecipeBizObjects
{
    public class bizRecipeIngredients : bizObject<bizRecipeIngredients>
    {
        string ingredientsval = "";

        public int RecipeId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }
        public string Ingredients
        {
            get
            {
                return ingredientsval;
            }
            set
            {
                ingredientsval = value;
                InvokePropertyChanged();
            }
        }
    }
}
