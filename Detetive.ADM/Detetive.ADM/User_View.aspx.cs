using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Detetive.BOL;
using System.Web.Security;

namespace Detetive.ADM
{
    public partial class User_View : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MembershipUserCollection muc = Membership.GetAllUsers();
                grdUsers.DataSource = muc;
                grdUsers.DataBind();
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User_Edit.aspx", false);
        }

        protected void imgEdit_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgEdit = (ImageButton)sender;
            Response.Redirect(string.Format("~/User_Edit.aspx?login={0}", imgEdit.CommandArgument), false);
        }

        protected void imgDelete_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ImageButton imgDelete = (ImageButton)sender;
                Membership.DeleteUser(imgDelete.CommandArgument);
                MembershipUserCollection muc = Membership.GetAllUsers();
                grdUsers.DataSource = muc;
                grdUsers.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage(MessageType.Error, string.Format("Erro ao remover usuário: {0}", ex.Message), "Erro");
            }
        }
    }
}