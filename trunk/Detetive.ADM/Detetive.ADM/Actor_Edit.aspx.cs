using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Detetive.BOL;
using System.IO;
using System.Drawing;

namespace Detetive.ADM
{
    public partial class Actor_Edit : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["actor"]))
                {
                    int actorId = Convert.ToInt32(Request.QueryString["actor"]);
                    Actor a = Actor.Get(actorId);
                    txtName.Text = a.Name.Value;
                    txtDescription.Text = !a.Description.IsNull ? a.Description.Value : string.Empty;
                    ddlColor.SelectedValue = a.Color.Value.ToString();
                    ddlColor.Attributes.Remove("class");
                    ddlColor.Attributes.Add("class", GetByCode(ddlColor.SelectedValue));
                    chkEnabled.Checked = a.Enabled.Value;
                    if (!a.ImageName.IsNull)
                    {
                        string path = Server.MapPath(string.Format("~/images/Actors/{0}", a.ImageName.Value));
                        if (!File.Exists(Server.MapPath(string.Format("~/images/Actors/{0}", a.ImageName.Value))))
                        {
                            byte[] b = Actor.GetPhoto(a.ActorId.Value);
                            if (b != null)
                            {
                                MemoryStream ms = new MemoryStream(b);
                                FileStream file = File.Create(Server.MapPath(string.Format("~/images/Actors/{0}", a.ImageName.Value)));
                                ms.WriteTo(file);
                                ms.Close();
                                ms.Dispose();
                                file.Close();
                                file.Dispose();
                            }
                            b = null;
                        }
                        imgPhoto.ImageUrl = "~/images/Actors/" + a.ImageName.Value;
                    }
                }
                else
                {
                    ddlColor.Attributes.Remove("class");
                    ddlColor.Attributes.Add("class", GetByCode(ddlColor.SelectedValue));
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
                try
                {
                    Actor a = null;
                    int actorId;
                    int.TryParse(Request.QueryString["actor"], out actorId);

                    if (actorId != 0)
                    {
                        a = Actor.Get(actorId);

                        a.Name = txtName.Text;
                        a.Description = txtDescription.Text;
                        a.Enabled = chkEnabled.Checked;
                        a.Color = Convert.ToInt32(ddlColor.SelectedValue);
                        if (fileUploadImage.HasFile)
                            a.ImageName = fileUploadImage.FileName;

                        a.Save();
                    }
                    else
                    {
                        a = new Actor()
                        {
                            Name = txtName.Text,
                            Description = txtDescription.Text,
                            Enabled = chkEnabled.Checked,
                            Color = Convert.ToInt32(ddlColor.SelectedValue)
                        };
                        a.ImageName = fileUploadImage.FileName;

                        a.Add();
                    }
                    if (fileUploadImage.HasFile)
                    {
                        Actor.SavePhoto(a.ActorId.Value, fileUploadImage.PostedFile.InputStream);
                        fileUploadImage.SaveAs(Server.MapPath("~/images/Actors/") + Path.GetFileName(fileUploadImage.FileName));
                    }


                    Response.Redirect("Actor_View.aspx", false);
                }
                catch (Exception ex)
                {
                    ShowMessage(MessageType.Error, ex.Message, "Erro");
                }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Actor_View.aspx", false);
        }
        
        protected string GetByCode(string code)
        {
            switch (ddlColor.SelectedValue)
            {
                case "91":
                    return "pink";
                case "92":
                    return "blue";
                case "93":
                    return "white";
                case "94":
                    return "yellow";
                case "95":
                    return "purple";
                case "96":
                    return "green";
                default:
                    return "white";
            }
        }
    }
}