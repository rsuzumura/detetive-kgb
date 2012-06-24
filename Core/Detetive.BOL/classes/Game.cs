using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlTypes;

namespace Detetive.BOL
{
    public class Game
    {
        public SqlInt32 GameId { get; set; }
        public SqlBoolean Enabled { get; set; }
        public SqlBoolean Started { get; set; }
        public SqlInt32 Player { get; set; }
        public SqlInt32 Type { get; set; }
        public SqlInt32 Subtype { get; set; }
        public SqlInt32 ShowColor { get; set; }

        public static Game Get(int gameId)
        {
            return SqlXmlGet<Game>.Select("det_p_GetGame", new SqlXmlParams("game", gameId));
        }

        public static void StartGame(int gameId)
        {
            SqlXmlRun.Execute("det_p_StartGame", new SqlXmlParams("game", gameId));
        }

        public static void SaveCards(int gameId, int actorId, int weaponId, int roomId)
        {
            SqlXmlRun.Execute("det_p_SaveGameResult", new SqlXmlParams("game", gameId, "actor", actorId, "weapon", weaponId, "room", roomId));
        }

        public static void SetPlayer(int gameId, int color)
        {
            SqlXmlRun.Execute("det_p_SetPlayer", new SqlXmlParams("game", gameId, "color", color));
        }

        public static void SetPlayerTime(int gameId)
        {
            SqlXmlRun.Execute("det_p_SetPlayerTime", new SqlXmlParams("game", gameId));
        }

        public static void SetShowCard(int gameId, int type, int cardId)
        {
            SqlXmlRun.Execute("det_p_SetShowCard", new SqlXmlParams("game", gameId, "type", type, "card", cardId));
        }
    }
}
