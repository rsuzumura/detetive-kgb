using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlTypes;
using System.Xml.Serialization;

namespace Detetive.BOL
{
    public class Room
    {
        public SqlInt32 RoomId { get; set; }
        public SqlString Name { get; set; }
        public SqlString Description { get; set; }
        public SqlBoolean Enabled { get; set; }
        public SqlString ImageName { get; set; }

        public static Room Get(int roomId)
        {
            return SqlXmlGet<Room>.Select("det_p_GetRoom", new SqlXmlParams("room", roomId));
        }

        public void Add()
        {
            int roomId;
            SqlXmlRun.Execute("det_p_AddRoom", this, "room", out roomId);
            this.RoomId = roomId;
        }

        public void Save()
        {
            SqlXmlRun.Execute("det_p_SaveRoom", this);
        }

        public static void Delete(int roomId)
        {
            SqlXmlRun.Execute("det_p_DeleteRoom", new SqlXmlParams("room", roomId));
        }
    }

    [XmlRoot("Rooms")]
    public class RoomCollection : List<Room>
    {
        public static RoomCollection List()
        {
            return SqlXmlGet<RoomCollection>.Select("det_p_ListRooms");
        }
    }
}
