using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Detetive.BOL;

namespace Detetive.WEB
{
    public partial class Rooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Detetive.BOL.Tabuleiro tab = new Detetive.BOL.Tabuleiro();
            string teste = tab.ToString();
            tab.FromString(teste);
            if (!IsPostBack)
            {
                UpdateResults();
            }
        }

        protected void btnEnter_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Response.Redirect(string.Format("~/WaitRoom.aspx?id={0}", btn.CommandArgument), false);
        }

        protected void TimerUpdate_Tick(object sender, EventArgs e)
        {
            UpdateResults();
        }

        private void UpdateResults()
        {
            Game g1 = Game.Get(1);
            GamePlayerCollection gpc1 = GamePlayerCollection.List(1);
            ltPlayers_1.Text    = string.Format("{0}", gpc1 != null ? gpc1.Count : 0);
            ltStartedGame1.Text = !g1.Started.IsNull && g1.Started.Value ? "JOGO INICIADO!" : "JOGO NÃO INICIADO";

            Game g2 = Game.Get(2);
            GamePlayerCollection gpc2 = GamePlayerCollection.List(2);
            ltPlayers_2.Text    = string.Format("{0}", gpc2 != null ? gpc2.Count : 0);
            ltStartedGame2.Text = !g2.Started.IsNull && g2.Started.Value ? "JOGO INICIADO!" : "JOGO NÃO INICIADO";

            Game g3 = Game.Get(3);
            GamePlayerCollection gpc3 = GamePlayerCollection.List(3);
            ltPlayers_3.Text    = string.Format("{0}", gpc3 != null ? gpc3.Count : 0);
            ltStartedGame3.Text = !g3.Started.IsNull && g3.Started.Value ? "JOGO INICIADO!" : "JOGO NÃO INICIADO";
        }
    }
}