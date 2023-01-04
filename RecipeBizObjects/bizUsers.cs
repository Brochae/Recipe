using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CPUFramework;

namespace RecipeBizObjects
{
    public class bizUsers : bizObject<bizUsers>
    {
        string userfirstnameval = "";
        string userlastnameval = "";
        string userfullnameval = "";
        string userpasswordval = "";

        public int UserId { get => this.PrimaryKeyValue; set => this.PrimaryKeyValue = value; }

        public string UserFirstName
        {
            get
            {
                return userfirstnameval;
            }
            set
            {
                userfirstnameval = value;
                InvokePropertyChanged();
            }
        }

        public string UserLastName
        {
            get
            {
                return userlastnameval;
            }
            set
            {
                userlastnameval = value;
                InvokePropertyChanged();
            }
        }
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
        public string UserPassword
        {
            get
            {
                return userpasswordval; ;
            }
            set
            {
                userpasswordval = value;
                InvokePropertyChanged();
            }
        }
    }
}
