using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Detetive.BOL;
using System.IO;

namespace Detetive.ADM
{
    public partial class Weapon_View : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WeaponCollection wc = WeaponCollection.List();
                grdWeapons.DataSource = wc;
                grdWeapons.DataBind();
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Weapon_Edit.aspx", false);
        }

        protected void imgEdit_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgEdit = (ImageButton)sender;
            Response.Redirect(string.Format("~/Weapon_Edit.aspx?weapon={0}", imgEdit.CommandArgument), false);
        }

        protected void imgDelete_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ImageButton imgDelete = (ImageButton)sender;
                Weapon w = Weapon.Get(Convert.ToInt32(imgDelete.CommandArgument));
                if (File.Exists(Server.MapPath(string.Format("~/images/Weapons/{0}", w.ImageName.Value))))
                    File.Delete(Server.MapPath(string.Format("~/images/Weapons/{0}", w.ImageName.Value)));
                Weapon.Delete(Convert.ToInt32(imgDelete.CommandArgument));
                WeaponCollection wc = WeaponCollection.List();
                grdWeapons.DataSource = wc;
                grdWeapons.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage(MessageType.Error, string.Format("Erro ao excluir arma: {0}.", ex.Message), "Erro");
            }
        }
    }
}