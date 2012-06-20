using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlTypes;
using System.Xml.Serialization;

namespace Detetive.BOL
{
    public class Weapon
    {
        public SqlInt32 WeaponId { get; set; }
        public SqlString Name { get; set; }
        public SqlString Description { get; set; }
        public SqlBoolean Enabled { get; set; }
        public SqlString ImageName { get; set; }

        public static Weapon Get(int weaponId)
        {
            return SqlXmlGet<Weapon>.Select("det_p_GetWeapon", new SqlXmlParams("weapon", weaponId));
        }

        public void Add()
        {
            int weaponId;
            SqlXmlRun.Execute("det_p_AddWeapon", this, "weapon", out weaponId);
            this.WeaponId = weaponId;
        }

        public void Save()
        {
            SqlXmlRun.Execute("det_p_SaveWeapon", this);
        }

        public static void Delete(int weaponId)
        {
            SqlXmlRun.Execute("det_p_DeleteWeapon", new SqlXmlParams("weapon", weaponId));
        }

        public static byte[] GetPhoto(int weaponId)
        {
            return XmlSerialization.GetBinaryBytes(Global.ConnectionString, "det_p_GetWeaponPhoto", "weapon", weaponId);
        }

        public static void SavePhoto(int weaponId, System.IO.Stream fileStream)
        {
            XmlSerialization.SaveBinaryFromStream(Global.ConnectionString, "det_p_SaveWeaponPhoto", "weapon", weaponId, fileStream, true);
        }
    }

    [XmlRoot("Weapons")]
    public class WeaponCollection : List<Weapon>
    {
        public static WeaponCollection List()
        {
            return SqlXmlGet<WeaponCollection>.Select("det_p_ListWeapons");
        }
    }
}
