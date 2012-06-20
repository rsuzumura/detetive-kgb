using System;
using System.IO;
using System.Web.UI;
using Detetive.BOL;
using System.Configuration;

namespace Detetive.ADM
{
    public partial class Weapon_Edit : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["weapon"]))
                {
                    int weaponId = Convert.ToInt32(Request.QueryString["weapon"]);
                    Weapon w = Weapon.Get(weaponId);
                    txtName.Text = w.Name.Value;
                    txtDescription.Text = !w.Description.IsNull ? w.Description.Value : string.Empty;
                    chkEnabled.Checked = w.Enabled.Value;
                    if (!w.ImageName.IsNull)
                    {
                        string path = Server.MapPath(string.Format("~/images/Weapons/{0}", w.ImageName.Value));
                        if (!File.Exists(Server.MapPath(string.Format("~/images/Weapons/{0}", w.ImageName.Value))))
                        {
                            byte[] b = Weapon.GetPhoto(w.WeaponId.Value);
                            if (b != null)
                            {
                                MemoryStream ms = new MemoryStream(b);
                                FileStream file = File.Create(Server.MapPath(string.Format("~/images/Weapons/{0}", w.ImageName.Value)));
                                ms.WriteTo(file);
                                ms.Close();
                                ms.Dispose();
                                file.Close();
                                file.Dispose();
                            }
                            b = null;
                        }
                        imgPhoto.ImageUrl = "~/images/Weapons/" + w.ImageName.Value;
                    }   
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
                try
                {
                    Weapon w = null;
                    int weaponId;
                    int.TryParse(Request.QueryString["weapon"], out weaponId);

                    if (weaponId != 0)
                    {
                        w = Weapon.Get(weaponId);

                        w.Name          = txtName.Text;
                        w.Description   = txtDescription.Text;
                        w.Enabled       = chkEnabled.Checked;
                        if (fileUploadImage.HasFile)
                            w.ImageName     = fileUploadImage.FileName;

                        w.Save();
                    }
                    else
                    {
                        w = new Weapon()
                        {
                            Name = txtName.Text,
                            Description = txtDescription.Text,
                            Enabled = chkEnabled.Checked
                        };
                        w.ImageName = fileUploadImage.FileName;

                        w.Add();
                    }
                    if (fileUploadImage.HasFile)
                    {
                        Weapon.SavePhoto(w.WeaponId.Value, fileUploadImage.PostedFile.InputStream);
                        fileUploadImage.SaveAs(Server.MapPath("~/images/Weapons/") + Path.GetFileName(fileUploadImage.FileName));
                    }
                    
                    
                    Response.Redirect("Weapon_View.aspx", false);
                }
                catch (Exception ex)
                {
                    ShowMessage(MessageType.Error, ex.Message, "Erro");
                }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weapon_View.aspx", false);
        }
    }
}