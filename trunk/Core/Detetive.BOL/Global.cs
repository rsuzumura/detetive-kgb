using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace Detetive.BOL
{
    public class Global
    {
        public static string ConnectionString
        {
            get
            {
                try
                {
                    return ConfigurationManager.ConnectionStrings[ConfigurationManager.AppSettings["ConnectionString"]].ConnectionString;
                }
                catch
                {
                    return string.Empty;
                }
            }
        }
    }
}
