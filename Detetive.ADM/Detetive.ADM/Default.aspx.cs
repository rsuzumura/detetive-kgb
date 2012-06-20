using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Web.Security;

namespace Detetive.ADM
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Roles.RoleExists("Admin")) Roles.CreateRole("Admin");
                if (!Roles.RoleExists("Player")) Roles.CreateRole("Player");

                if ((bool)new AppSettingsReader().GetValue("ForceCreateUserAdmin", typeof(bool)))
                    return;
                //
                string[] u = Roles.GetUsersInRole("Admin");
                if (u.Length > 0)
                {  //não permite criar login e redireciona para interface administrativa
                    Response.Redirect("Main.aspx", false);
                }
            }
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            Roles.AddUserToRole(CreateUserWizard1.UserName, "Admin");
            //
            Response.Redirect("Main.aspx", false);
        }
    }
}