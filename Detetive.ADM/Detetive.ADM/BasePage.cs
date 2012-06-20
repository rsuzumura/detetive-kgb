using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;

namespace Detetive.ADM
{
    public enum MessageType
    {
        Info,
        Warning,
        Error
    }
    public class BasePage : System.Web.UI.Page
    {
        public void ShowMessage(MessageType messageType, string message, string title)
        {
            message = Server.HtmlEncode(message).Replace("\r\n", "<br />");
            string type = "info";
            switch (messageType)
            {
                case MessageType.Info:
                    type = "info";
                    break;
                case MessageType.Error:
                    type = "error";
                    break;
                case MessageType.Warning:
                    type = "alert";
                    break;
            }

            StringBuilder script = new StringBuilder();
            script.Append("$(document).ready(function(){");
            script.Append("$.msgBox({");
            script.AppendFormat("title:\"{0}\",", title);
            script.AppendFormat("content:\"{0}\",", message);
            script.AppendFormat("type:\"{0}\"", type);
            script.Append("});");
            script.Append("});");
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "", script.ToString(), true);
        }

        public void ShowMessage(MessageType messageType, string message, string title, string pageRedirect)
        {
            message = Server.HtmlEncode(message).Replace("\r\n", "<br />");
            string type = "info";
            switch (messageType)
            {
                case MessageType.Info:
                    type = "info";
                    break;
                case MessageType.Error:
                    type = "error";
                    break;
                case MessageType.Warning:
                    type = "alert";
                    break;
            }

            StringBuilder script = new StringBuilder();
            script.Append("$(document).ready(function(){");
            script.Append("$.msgBox({");
            script.AppendFormat("title:\"{0}\",", title);
            script.AppendFormat("content:\"{0}\",", message);
            script.AppendFormat("type:\"{0}\",", type);
            script.Append("buttons: [{ value: \"OK\" }],");
            script.Append("success: function (result) {");
            script.Append("if (result == \"OK\") {");
            script.AppendFormat("window.navigate(\"{0}\")", pageRedirect);
            script.Append("}");
            script.Append("}");
            script.Append("});");
            script.Append("});");
            System.Web.UI.ScriptManager.RegisterStartupScript(this, this.GetType(), "", script.ToString(), true);
        }
    }
}