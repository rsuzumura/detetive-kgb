using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Detetive.WEB
{
    public partial class User_Login : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FormsAuthentication.SignOut();
            }
            Login1.FindControl("UserName").Focus();
            Login1.FindControl("ForgetPassword").Visible = (Membership.Provider.PasswordFormat != MembershipPasswordFormat.Hashed);
        }

        protected void ForgetPassword_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Login1.UserName))
                ShowMessage(MessageType.Warning, "O preenchimento do usuário é obrigatório.", "Usuário Obrigatório");
            //HttpContext.Current.Response.Write("<script language='javascript'>alert(unescape('O preenchimento do usuário é obrigatório.'));</script>");
            else
                Response.Redirect("User_LostPassword.aspx?user=" + Login1.UserName, false);
        }

        protected void ChangePassword_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Login1.UserName))
                ShowMessage(MessageType.Warning, "O preenchimento do usuário é obrigatório.", "Usuário Obrigatório");
            //HttpContext.Current.Response.Write("<script language='javascript'>alert(unescape('O preenchimento do usuário é obrigatório.'));</script>");
            else
                Response.Redirect("User_ChangePassword.aspx?user=" + Login1.UserName, false);
        }

        protected void Create_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User_Create.aspx", false);
        }
    }
}