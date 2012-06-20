using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Web.UI.WebControls;
using System.Reflection;

namespace Detetive.WEB
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

        protected void FillControl<T>(DropDownList dropDownList, List<T> list)
        {
            if (dropDownList != null)
            {
                PropertyInfo propertyInfoTextField = null;
                PropertyInfo propertyInfoValueField = null;

                dropDownList.Items.Clear();
                dropDownList.Items.Insert(0, new ListItem("Selecione...", ""));

                string dataTextField = null;
                string dataValueField = null;

                if (list != null)
                {
                    foreach (T item in list)
                    {
                        propertyInfoTextField = (PropertyInfo)item.GetType().GetProperty(dropDownList.DataTextField);
                        if (propertyInfoTextField != null) dataTextField = Convert.ToString(propertyInfoTextField.GetValue(item, null));

                        propertyInfoValueField = (PropertyInfo)item.GetType().GetProperty(dropDownList.DataValueField);
                        if (propertyInfoValueField != null) dataValueField = Convert.ToString(propertyInfoValueField.GetValue(item, null));

                        dropDownList.Items.Add(new ListItem(dataTextField, dataValueField));
                    }
                }
            }
        }
    }
}