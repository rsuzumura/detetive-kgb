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
        public SqlInt32 AccuseActorId { get; set; }
        public SqlInt32 AccuseWeaponId { get; set; }
        public SqlInt32 AccuseRoomId { get; set; }
        public SqlString Winner { get; set; }

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

        public static bool SetShowCards(int color, int actorId, int weaponId, int roomId)
        {
            bool r;
            SqlXmlRun.Execute("det_p_NextPlayerCards", out r, new SqlXmlParams("color", color, "actor", actorId, "weapon", weaponId, "room", roomId));
            return r;
        }

        public static bool TryAccusation(int game, int color, int actorId, int weaponId, int roomId)
        {
            bool r;
            SqlXmlRun.Execute("det_p_TryAccusation", out r, new SqlXmlParams("game", game, "color", color, "actor", actorId, "weapon", weaponId, "room", roomId));
            return r;
        }

        public static void ChangeStatus(int game, string userName, int status)
        {
            SqlXmlRun.Execute("det_p_ChangePlayerStatus", new SqlXmlParams("game", game, "userName", userName, "status", status));
        }

        public static void ResetPosition(int game, string userName, int color)
        {
            SqlXmlRun.Execute("det_p_ResetPosition", new SqlXmlParams("game", game, "userName", userName, "color", color));
        }

        public static void SetWinner(int game, string userName)
        {
            SqlXmlRun.Execute("det_p_SetWinner", new SqlXmlParams("game", game, "userName", userName));
        }

        public static bool ExistsPlayer(int game, string userName, int actor)
        {
            bool r;
            SqlXmlRun.Execute("det_p_ExistsPlayer", out r, new SqlXmlParams("game", game, "username", userName, "actor", actor));
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
