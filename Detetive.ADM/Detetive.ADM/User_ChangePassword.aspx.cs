using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Detetive.ADM
{
    public partial class User_ChangePassword : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    MembershipUser mu = Membership.GetUser(Request.QueryString["user"]);
                    if (mu == null)
                    {
                        ShowMessage(MessageType.Warning, "Atenção, usuário não encontrado!", "Usuário não encontrado");
                        cmdChange.Visible = false;
                        txtPassword.Enabled = false;
                        txtNewPassword.Enabled = false;
                    }
                }
            }
            catch (Exception err)
            {
                ShowMessage(MessageType.Error, err.Message, "Erro na troca de senha");
            }
        }

        protected void cmdChange_Click(object sender, EventArgs e)
        {
            try
            {
                MembershipUser mu = Membership.GetUser(Request.QueryString["user"]);
                if (mu.ChangePassword(txtPassword.Text, txtNewPassword.Text))
                    ShowMessage(MessageType.Info, "Senha alterada com sucesso!", "Senha Alterada", "User_Login.aspx");
                else
                    ShowMessage(MessageType.Error, "Senha antiga não confere.", "Erro");
            }
            catch (Exception err)
            {
                ShowMessage(MessageType.Error, err.Message, "Erro de Alteração de senha");
            }
        }
    }
}