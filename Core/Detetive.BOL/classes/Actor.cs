using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Serialization;
using System.Data.SqlTypes;

namespace Detetive.BOL
{
    public class Actor
    {
        public SqlInt32 ActorId { get; set; }
        public SqlString Name { get; set; }
        public SqlString Description { get; set; }
        public SqlBoolean Enabled { get; set; }
        public SqlString ImageName { get; set; }
        public SqlInt32 Color { get; set; }

        public static Actor Get(int actorId)
        {
            return SqlXmlGet<Actor>.Select("det_p_GetActor", new SqlXmlParams("actor", actorId));
        }

        public void Add()
        {
            int actorId;
            SqlXmlRun.Execute("det_p_AddActor", this, "actor", out actorId);
            this.ActorId = actorId; 
        }

        public void Save()
        {
            SqlXmlRun.Execute("det_p_SaveActor", this);
        }

        public static void Delete(int actorId)
        {
            SqlXmlRun.Execute("det_p_DeleteActor", new SqlXmlParams("actor", actorId));
        }

        public static byte[] GetPhoto(int actorId)
        {
            return XmlSerialization.GetBinaryBytes(Global.ConnectionString, "det_p_GetActorPhoto", "actor", actorId);
        }

        public static void SavePhoto(int actorId, System.IO.Stream fileStream)
        {
            XmlSerialization.SaveBinaryFromStream(Global.ConnectionString, "det_p_SaveActorPhoto", "actor", actorId, fileStream, true);
        }
    }

    [XmlRoot("Actors")]
    public class ActorCollection : List<Actor>
    {
        public static ActorCollection List()
        {
            return SqlXmlGet<ActorCollection>.Select("det_p_ListActors");
        }

        public static ActorCollection ListUnused(int gameId)
        {
            return SqlXmlGet<ActorCollection>.Select("det_p_ListUnusedActors", new SqlXmlParams("game", gameId));
        }
    }
}
