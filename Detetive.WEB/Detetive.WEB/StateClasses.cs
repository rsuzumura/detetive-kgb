using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Detetive.WEB
{
    public static class Current
    {
        public static int Color
        {
            get
            {
                object o = HttpContext.Current.Session["color"];
                if (o == null)
                    return 0;
                else
                    return (int)o;
            }
            set
            {
                HttpContext.Current.Session["color"] = value;
            }
        }
    }
}