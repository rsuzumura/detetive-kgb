﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Detetive.WEB
{
    public partial class User_Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            Roles.AddUserToRole(CreateUserWizard1.UserName, "Player");
            //
            Response.Redirect("Rooms.aspx", false);
        }
    }
}