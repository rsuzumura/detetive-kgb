using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Diagnostics;

namespace Detetive.ADM
{
    public partial class User_LostPassword : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                lblMensagem.Text = string.Format("Olá {0}! Digite a resposta para a sua pergunta secreta.", Request.QueryString["user"]);
                if (!Page.IsPostBack)
                {
                    MembershipUser mu = Membership.GetUser(Request.QueryString["user"]);
                    if (mu == null)
                    {
                        lblMensagem.Text = "Usuário não encontrado!";
                        cmdRecuperar.Visible = false;
                        txtResposta.Enabled = false;
                    }
                    else
                    {
                        lblPergunta.Text = mu.PasswordQuestion;
                        mu = null;
                    }
                }
            }
            catch (Exception err)
            {
                ShowMessage(MessageType.Error, err.Message, "Erro de Recuperação de senha");
                EventLog.WriteEntry("Orbium.CR50", err.ToString(), EventLogEntryType.Error);
            }
        }

        protected void cmdRecuperar_Click(object sender, EventArgs e)
        {
            try
            {
                MembershipUser mu = Membership.GetUser(Request.QueryString["user"]);
                lblSenha.Text = string.Format("Sua senha é \"{0}\"", mu.GetPassword(txtResposta.Text));
            }
            catch (Exception err)
            {
                ShowMessage(MessageType.Error, err.Message, "Erro de Recuperação de senha");
                EventLog.WriteEntry("Detetive", err.ToString(), EventLogEntryType.Error);
            }
        }
    }
}