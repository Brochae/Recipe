using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace RecipeBizObjects
{
    public class bizRecipeSteps : bizObject<bizRecipeSteps>
    {
        int sequencenumval;
        string stepdescval = "";
        public int RecipeId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }

        public int SequenceNum
        {
            get
            {
                return sequencenumval;
            }
            set
            {
                sequencenumval = value;
                InvokePropertyChanged();
            }
        }

        public string StepDesc
        {
            get
            {
                return stepdescval;
            }
            set
            {
                stepdescval = value;
                InvokePropertyChanged();
            }
        }
    }
}
