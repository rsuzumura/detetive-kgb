using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlTypes;
using System.Xml.Serialization;

namespace Detetive.BOL
{
    public class GamePlayer
    {
        public SqlInt32 GamePlayerId { get; set; }
        public SqlInt32 GameId { get; set; }
        public SqlString Username { get; set; }
        public SqlInt32 ActorId { get; set; }
        public SqlBoolean Enabled { get; set; }
        public SqlString Position { get; set; }
        public SqlInt32 Status { get; set; }
        public SqlInt32 Color { get; set; }

        public void Add()
        {
            int gamePlayerId;
            SqlXmlRun.Execute("det_p_AddGamePlayer", this, "gamePlayer", out gamePlayerId);
            this.GamePlayerId = gamePlayerId;
        }

        public void Save()
        {
            SqlXmlRun.Execute("det_p_SaveGamePlayer", this);
        }

        public static GamePlayer Get(int gamePlayerId)
        {
            return SqlXmlGet<GamePlayer>.Select("det_p_GetGamePlayer", new SqlXmlParams("gamePlayer", gamePlayerId));
        }

        public static GamePlayer Get(int game, string userName)
        {
            return SqlXmlGet<GamePlayer>.Select("det_p_GetGamePlayerByUsername", new SqlXmlParams("game", game, "userName", userName));
        }

        public static void Remove(int game, string userName)
        {
            SqlXmlRun.Execute("det_p_RemoveGamePlayer", new SqlXmlParams("game", game, "userName", userName));
        }

        public static bool DisplayStartButton(string userName, int gameId)
        {
            bool r;
            SqlXmlRun.Execute("det_p_ShowStartButton", out r, new SqlXmlParams("userName", userName, "game", gameId));
            return r;
        }

        public static bool EnableStartButton(int gameId)
        {
            bool r;
            SqlXmlRun.Execute("det_p_EnableStartButton", out r, new SqlXmlParams("game", gameId));
            return r;
        }
    }

    [XmlRoot("GamePlayers")]
    public class GamePlayerCollection : List<GamePlayer>
    {
        public static GamePlayerCollection List(int gameId)
        {
            return SqlXmlGet<GamePlayerCollection>.Select("det_p_ListGamePlayer", new SqlXmlParams("game", gameId));
        }

        public GamePlayer GetByColor(int color)
        {
            foreach (GamePlayer gp in this)
            {
                if (gp.Color.Value == color)
                    return gp;
            }
            return null;
        }
    }
}
