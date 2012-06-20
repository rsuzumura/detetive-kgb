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
    public partial class Actor_View : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ActorCollection ac = ActorCollection.List();
                grdActors.DataSource = ac;
                grdActors.DataBind();
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Actor_Edit.aspx", false);
        }

        protected void imgEdit_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgEdit = (ImageButton)sender;
            Response.Redirect(string.Format("~/Actor_Edit.aspx?actor={0}", imgEdit.CommandArgument), false);
        }

        protected void imgDelete_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                ImageButton imgDelete = (ImageButton)sender;
                Actor a = Actor.Get(Convert.ToInt32(imgDelete.CommandArgument));
                if (File.Exists(Server.MapPath(string.Format("~/images/Actors/{0}", a.ImageName.Value))))
                    File.Delete(Server.MapPath(string.Format("~/images/Actors/{0}", a.ImageName.Value)));
                Actor.Delete(Convert.ToInt32(imgDelete.CommandArgument));
                ActorCollection ac = ActorCollection.List();
                grdActors.DataSource = ac;
                grdActors.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage(MessageType.Error, string.Format("Erro ao remover personagem: {0}.", ex.Message), "Erro");
            }
        }
    }
}