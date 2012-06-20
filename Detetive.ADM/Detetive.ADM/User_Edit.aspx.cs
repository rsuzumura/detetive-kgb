using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Detetive.ADM
{
    public partial class User_Edit : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {                    
                    txtUsername.Enabled = true;
                    if (string.IsNullOrEmpty(Request.QueryString["login"]))
                    {   //novo
                        chkApproved.Checked = true;
                        chkApproved.Enabled = false;
                    }
                    else
                    {   //edicao
                        txtUsername.Enabled = false;

                        MembershipUser mu = Membership.GetUser(Request.QueryString["login"]);
                        txtUsername.Text = mu.UserName;
                        txtNotes.Text = mu.Comment;
                        txtMail.Text = mu.Email;
                        chkApproved.Checked = mu.IsApproved;
                        btnReset.Enabled = true;                        
                    }
                }
            }
            catch (Exception err)
            {
                ShowMessage(MessageType.Error, err.Message, "Erro");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(Request.QueryString["login"]))
                {   //novo
                    MembershipCreateStatus s;
                    Membership.CreateUser(txtUsername.Text, "password", txtMail.Text, "pergunta", "resposta", true, out s);
                    if (s != MembershipCreateStatus.Success)
                    { }
                    else
                    {
                        MembershipUser mu = Membership.GetUser(txtUsername.Text);
                        mu.Comment = txtNotes.Text;
                        Membership.UpdateUser(mu);
                        Roles.AddUserToRole(txtUsername.Text, "Admin");
                        Response.Redirect("User_View.aspx", false);
                    }
                }
                else
                {   //edicao
                    String userName = Membership.GetUserNameByEmail(txtMail.Text);
                    MembershipUser mu = Membership.GetUser(Request.QueryString["login"]);

                    if (userName != mu.UserName && !String.IsNullOrEmpty(userName) && Membership.Provider.RequiresUniqueEmail)
                    { }
                    else
                    {
                        mu.Email = txtMail.Text;
                        mu.Comment = txtNotes.Text;
                        mu.IsApproved = chkApproved.Checked;
                        Membership.UpdateUser(mu);
                        
                        Response.Redirect("User_View.aspx", false);
                    }
                }
            }
            catch (Exception err)
            {
                ShowMessage(MessageType.Error, err.Message, "Erro");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/User_View.aspx", false);
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                MembershipUser mu = Membership.GetUser(Request.QueryString["login"]);
                mu.ResetPassword("");
            }
            catch (Exception err)
            {
                ShowMessage(MessageType.Error, string.Format("Erro ao resetar a senha: {0}.", err.Message), "Erro");
            }
        }
    }
}