using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlTypes;
using System.Xml.Serialization;

namespace Detetive.BOL
{
    public class Card
    {
        public SqlInt32 GamePlayerId { get; set; }
        public SqlInt32 Subtype { get; set; }
        public SqlInt32 Type { get; set; }
        public SqlString Username { get; set; }

        public void Add()
        {
            SqlXmlRun.Execute("det_p_AddGamePlayerCards", this);
        }
    }

    [XmlRoot("Cards")]
    public class CardCollection : List<Card>
    {
        public static CardCollection List(int gameId)
        {
            return SqlXmlGet<CardCollection>.Select("det_p_GetCards", new SqlXmlParams("game", gameId));
        }

        public static CardCollection ListByUser(string userName)
        {
            return SqlXmlGet<CardCollection>.Select("det_p_ListGameCards", new SqlXmlParams("userName", userName));
        }

        public static CardCollection ListAccuseCards(int color, int actorId, int weaponId, int roomId)
        {
            return SqlXmlGet<CardCollection>.Select("det_p_NextPlayerCards", new SqlXmlParams("color", color, "actor", actorId, "weapon", weaponId, "room", roomId));
        }
    }
}
