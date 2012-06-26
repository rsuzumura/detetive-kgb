using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Detetive.BOL;
using System.IO;

namespace Detetive.WEB
{
    public partial class WaitRoom : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            if (!IsPostBack)
            {
                timerUpdate.Enabled = false;
                int gameId = Convert.ToInt32(Request.QueryString["id"]);
                FillControl<Actor>(ddlActors, ActorCollection.ListUnused(Convert.ToInt32(Request.QueryString["id"])));
                btnBeginGame.Visible = GamePlayer.DisplayStartButton(Page.User.Identity.Name, gameId);
            }
        }

        protected void ddlActors_SelectedIndexChanged(object sender, EventArgs e)
        {
            int actorId = 0;
            int gameId = Convert.ToInt32(Request.QueryString["id"]);
            if (int.TryParse(ddlActors.SelectedValue, out actorId))
            {
                if (!GamePlayer.ExistsPlayer(gameId, User.Identity.Name, actorId))
                {
                    Actor act = Actor.Get(actorId);
                    if (!act.ImageName.IsNull)
                    {
                        string path = Server.MapPath(string.Format("~/Images/Cards/{0}", act.ImageName.Value));
                        if (!File.Exists(Server.MapPath(string.Format("~/Images/Cards/{0}", act.ImageName.Value))))
                        {
                            byte[] b = Actor.GetPhoto(act.ActorId.Value);
                            if (b != null)
                            {
                                MemoryStream ms = new MemoryStream(b);
                                FileStream file = File.Create(Server.MapPath(string.Format("~/Images/Cards/{0}", act.ImageName.Value)));
                                ms.WriteTo(file);
                                ms.Close();
                                ms.Dispose();
                                file.Close();
                                file.Dispose();
                            }
                            b = null;
                        }
                        imgPhoto.ImageUrl = "~/images/Cards/" + act.ImageName.Value;
                    }
                }
                else
                {
                    FillControl<Actor>(ddlActors, ActorCollection.ListUnused(Convert.ToInt32(Request.QueryString["id"])));
                    ShowMessage(MessageType.Warning, "O usuário selecionado já havia sido escolhido previamente, escolha um novo personagem.", "Atenção: Personagem já selecionado!");
                }
            }
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            int actorId = 0;
            int gameId = Convert.ToInt32(Request.QueryString["id"]);
            if (int.TryParse(ddlActors.SelectedValue, out actorId))
            {
                if (!GamePlayer.ExistsPlayer(gameId, User.Identity.Name, actorId))
                {
                    if (btnSelect.Text == "SELECIONAR")
                    {
                        if (hdnUpdate.Value == "0")
                        {
                            GamePlayer gp = new GamePlayer()
                            {
                                GameId = gameId,
                                Username = Page.User.Identity.Name,
                                ActorId = Convert.ToInt32(ddlActors.SelectedValue),
                                Enabled = true,
                                Position = string.Empty,
                                Status = 0
                            };
                            gp.Add();
                            hdnUpdate.Value = gp.GamePlayerId.Value.ToString();
                        }
                        else
                        {
                            GamePlayer gp = GamePlayer.Get(Convert.ToInt32(hdnUpdate.Value));
                            gp.ActorId = Convert.ToInt32(ddlActors.SelectedValue);
                            gp.Save();
                        }
                        timerUpdate.Enabled = true;
                        ddlActors.Enabled = false;
                        btnSelect.Text = "TROCAR";
                    }
                    else
                    {
                        ddlActors.Enabled = true;
                        FillControl<Actor>(ddlActors, ActorCollection.ListUnused(Convert.ToInt32(Request.QueryString["id"])));
                        btnSelect.Text = "SELECIONAR";
                    }
                }
                else
                {
                    FillControl<Actor>(ddlActors, ActorCollection.ListUnused(Convert.ToInt32(Request.QueryString["id"])));
                    ShowMessage(MessageType.Warning, "O usuário selecionado já havia sido escolhido previamente, escolha um novo personagem.", "Atenção: Personagem já selecionado!");
                }
            }
        }

        protected void btnExitRoom_Click(object sender, EventArgs e)
        { 
            int gameId = Convert.ToInt32(Request.QueryString["id"]);
            GamePlayer.Remove(gameId, User.Identity.Name);
            Response.Redirect("~/Rooms.aspx", false);
        }

        protected void btnBeginGame_Click(object sender, EventArgs e)
        {
            btnBeginGame.Enabled = false;
            int gameId = Convert.ToInt32(Request.QueryString["id"]);
            Game.StartGame(gameId);
            GamePlayerCollection gpc = GamePlayerCollection.List(gameId);
            string js = string.Empty;
            foreach (GamePlayer gplay in gpc)
            {
                gplay.Position = Detetive.BOL.Tabuleiro.StartPosition(gplay.Color.Value, out js);
                gplay.Save();
            }
            StartGame();
            Response.Redirect(string.Format("~/Tabuleiro.aspx?game={0}", gameId), false);
        }

        protected void timerUpdate_Tick(object sender, EventArgs e)
        {
            int gameId = Convert.ToInt32(Request.QueryString["id"]);
            Game game = Game.Get(gameId);
            GamePlayer gplayer = GamePlayer.Get(gameId, User.Identity.Name);

            if (!game.Started.IsNull && game.Started.Value)
            {
                if (gplayer == null)
                {
                    ShowMessage(MessageType.Warning, "Atenção: o jogo foi iniciado e nenhum personagem foi escolhido, portanto você será retirado da sala.", "Atenção: Jogo Iniciado", "Rooms.aspx");
                }
                else
                {
                    Response.Redirect(string.Format("~/Tabuleiro.aspx?game={0}", gameId), false);
                }
            }

            if (ddlActors.Enabled) FillControl<Actor>(ddlActors, ActorCollection.ListUnused(Convert.ToInt32(Request.QueryString["id"])));
            btnBeginGame.Visible = GamePlayer.DisplayStartButton(Page.User.Identity.Name, gameId);
            btnBeginGame.Enabled = GamePlayer.EnableStartButton(gameId);
        }

        protected void StartGame()
        {
            int gameId = Convert.ToInt32(Request.QueryString["id"]);
            Random r = new Random();            
            int randomActor  = r.Next(6);
            int randomWeapon = r.Next(6);
            int randomRoom   = r.Next(9);
            ActorCollection ac  = ActorCollection.List();
            WeaponCollection wc = WeaponCollection.List();
            RoomCollection rc   = RoomCollection.List();

            Actor act   = ac[randomActor];
            Weapon weap = wc[randomWeapon];
            Room room   = rc[randomRoom];

            Game.SaveCards(gameId, act.ActorId.Value, weap.WeaponId.Value, room.RoomId.Value);

            ac.RemoveAt(randomActor);
            wc.RemoveAt(randomWeapon);
            rc.RemoveAt(randomRoom);

            GamePlayerCollection gpc = GamePlayerCollection.List(gameId);
            CardCollection cc = CardCollection.List(gameId);
            int player = 0;
            while (cc.Count > 0)
            {
                if (player == gpc.Count)
                    player = 0;
                int record = r.Next(cc.Count);
                Card card = new Card() 
                {
                    GamePlayerId = gpc[player].GamePlayerId,
                    Type         = cc[record].Type.Value,
                    Subtype      = cc[record].Subtype.Value
                };
                cc.RemoveAt(record);
                player++;
                card.Add(); 
            }
        }
    }
}