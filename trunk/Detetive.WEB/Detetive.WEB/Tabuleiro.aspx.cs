using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Detetive.BOL;
using System.Text;

namespace Detetive.WEB
{
    public partial class Tabuleiro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                StringBuilder sb = new StringBuilder();
                int first = 100;
                string js = string.Empty;

                FillActors();
                FillWeapons();
                FillRooms();
                int gameId = Convert.ToInt32(Request.QueryString["game"]);
                GamePlayer gp = GamePlayer.Get(gameId, User.Identity.Name);
                Current.Color = gp.Color.Value;
                if (gp.Status.IsNull || gp.Status.Value == 0)
                {

                    GamePlayerCollection gpc = GamePlayerCollection.List(gameId);
                    string currentPos = string.Empty;
                    foreach (GamePlayer gplay in gpc)
                    {
                        gplay.Position = Detetive.BOL.Tabuleiro.StartPosition(gplay.Color.Value, out js);
                        gplay.Save();
                        sb.Append(js);
                        if (gplay.Color.Value < first)
                        {
                            first = gplay.Color.Value;
                            currentPos = gplay.Position.Value;
                        }
                    }
                    Game.SetPlayer(gameId, first);
                    btnDice.Enabled = Current.Color == first;
                    if (gp.Status.Value == 0)
                    {
                        sb.Append("loadCards();");
                        gp.Status = 1;
                        gp.Position = currentPos;
                        gp.Save();
                    }
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "loadCards", sb.ToString(), true);
                }
                else
                {
                    GamePlayerCollection gpc = GamePlayerCollection.List(gameId);
                    string currentPos = string.Empty;
                    foreach (GamePlayer gplay in gpc)
                    {
                        gplay.Position = Detetive.BOL.Tabuleiro.StartPosition(gplay.Color.Value, out js);
                        gplay.Save();
                        sb.Append(js);
                        if (gplay.Color.Value < first)
                        {
                            first = gplay.Color.Value;
                            currentPos = gplay.Position.Value;
                        }
                    }
                    Game.SetPlayer(gameId, first);
                    btnDice.Enabled = Current.Color == first;
                    System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "loadCards", sb.ToString(), true);
                }
                hdnPlayer1.Value = Current.Color.ToString();
                setCards();
            }
        }

        protected void btnDice_Click(object sender, EventArgs e)
        {
            Random r = new Random();
            int dice = r.Next(1, 7);
            int gameId = Convert.ToInt32(Request.QueryString["game"]);
            StringBuilder sb = new StringBuilder();
            GamePlayerCollection gpc = GamePlayerCollection.List(gameId);
            GamePlayer gp = gpc.GetByColor(Current.Color);
            string[] position = gp.Position.Value.Split('_');
            foreach (GamePlayer gplay in gpc)
            {
                sb.Append(Detetive.BOL.Tabuleiro.SetPosition(gplay.Color.Value, gplay.Position.Value));
            }
            Detetive.BOL.Tabuleiro tab = new Detetive.BOL.Tabuleiro();
            tab.positions[int.Parse(position[0])][int.Parse(position[1])] = Current.Color;
            string val = tab.ToString();
            sb.Append("getMAP('" + val + "');");
            //dice = 20;//@TODO remover
            sb.AppendFormat("randomDice({0}, {1}, {2});", dice, position[0], position[1]);
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "loadCards", sb.ToString(), true);
            btnDice.Enabled = false;
            TimerUpdateGame.Enabled = false;
            setCards();
        }

        protected void btnAcusar_Click(object sender, EventArgs e)
        {
        }

        private void FillActors()
        {
            ActorCollection ac = ActorCollection.List();

            for (int i = 1; i <= ac.Count; i++)
            {
                Literal lt = (Literal)form1.FindControl(string.Format("actor_{0}", i));
                lt.Text = ac[i - 1].Name.Value;
            }
        }

        private void FillWeapons()
        {
            WeaponCollection wc = WeaponCollection.List();

            for (int i = 1; i <= wc.Count; i++)
            {
                Literal lt = (Literal)form1.FindControl(string.Format("weapon_{0}", i));
                lt.Text = wc[i - 1].Name.Value;
            }
        }

        private void FillRooms()
        {
            RoomCollection rc = RoomCollection.List();

            for (int i = 1; i <= rc.Count; i++)
            {
                Literal lt = (Literal)form1.FindControl(string.Format("room_{0}", i));
                lt.Text = rc[i - 1].Name.Value;
            }
        }

        protected void TimerUpdateGame_Tick(object sender, EventArgs e)
        {
            Game gam = Game.Get(Convert.ToInt32(Request.QueryString["game"]));
            btnDice.Enabled = gam.Player.Value == Current.Color;
            UpdateTable();
            setCards();
        }

        protected void table_Click(object sender, EventArgs e)
        { 
        }

        private void UpdateTable()
        {
            StringBuilder sb = new StringBuilder();
            GamePlayerCollection gpc = GamePlayerCollection.List(Convert.ToInt32(Request.QueryString["game"]));
            foreach (GamePlayer gplay in gpc)
                sb.Append(Detetive.BOL.Tabuleiro.SetPosition(gplay.Color.Value, gplay.Position.Value));
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "loadCards", sb.ToString(), true);
        }

        protected void btnClicker_Click(object sender, EventArgs e)
        {            
            String args = hdnData.Value;
            StringBuilder sb = new StringBuilder();
            int gameId = Convert.ToInt32(Request.QueryString["game"]);
            GamePlayerCollection gpc = GamePlayerCollection.List(gameId);
            string currentPos = string.Empty;
            foreach (GamePlayer gplay in gpc)
            {
                if (gplay.Color.Value == Current.Color)
                {
                    gplay.Position = args;
                    gplay.Save();
                }
                sb.Append(Detetive.BOL.Tabuleiro.SetPosition(gplay.Color.Value, gplay.Position.Value));
            }
            Game.SetPlayerTime(gameId);
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "loadMoves", sb.ToString(), true);
            hdnEvent.Value = hdnData.Value = string.Empty;
            TimerUpdateGame.Enabled = true;
            setCards();
        }

        protected void btnAccuse_Click(object sender, EventArgs e)
        {
            String args = hdnData.Value;
            StringBuilder sb = new StringBuilder();
            TimerUpdateGame.Enabled = false;
            int gameId = Convert.ToInt32(Request.QueryString["game"]);
            GamePlayerCollection gpc = GamePlayerCollection.List(gameId);
            string currentPos = string.Empty;
            foreach (GamePlayer gplay in gpc)
            {
                if (gplay.Color.Value == Current.Color)
                {
                    gplay.Position = args;
                    gplay.Save();
                }
                sb.Append(Detetive.BOL.Tabuleiro.SetPosition(gplay.Color.Value, gplay.Position.Value));
            }
            Game.SetPlayerTime(gameId);
            sb.AppendFormat("if(confirm('Deseja fazer uma acusação?')) showAccuse({0});", hdnRoom.Value);
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "loadMoves", sb.ToString(), true);
            hdnEvent.Value = hdnData.Value = string.Empty;
            TimerUpdateGame.Enabled = false;
        }

        protected void btnMakeAccuse_Click(object sender, EventArgs e)
        {
            btnAcusar.Enabled = false;
            int actorId = Convert.ToInt32(hdnActor.Value);
            int weaponId = Convert.ToInt32(hdnWeapon.Value);
            int roomId = Convert.ToInt32(hdnRoom.Value);

            CardCollection cc = CardCollection.ListAccuseCards(Current.Color, actorId, weaponId, roomId);
            TimerUpdateGame.Enabled = true;
        }

        private void setCards()
        {
            ltImages.Text = string.Empty;
            CardCollection cc = CardCollection.ListByUser(User.Identity.Name);
            int index = 0;
            foreach (Card c in cc)
            {
                string img = "<img src=\"Images/Cards/{0}\" alt=\"\" width=\"150px\" id=\"image_{1}\" />";
                switch (c.Type.Value)
                {
                    case 1:
                        Actor a = Actor.Get(c.Subtype.Value);
                        ltImages.Text += string.Format(img, a.ImageName.Value, index);
                        break;
                    case 2:
                        Weapon w = Weapon.Get(c.Subtype.Value);
                        ltImages.Text += string.Format(img, w.ImageName.Value, index);
                        break;
                    case 3:
                        Room r = Room.Get(c.Subtype.Value);
                        ltImages.Text += string.Format(img, r.ImageName.Value, index);
                        break;
                }
                index++;
            }
        }
    }
}