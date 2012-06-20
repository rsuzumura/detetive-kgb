﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.261
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FivesLivraria.Security.SqlScripts {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    internal class Scripts {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal Scripts() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("Detetive.SEC.SqlScripts.Scripts", typeof(Scripts).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to insert into fiv_Logins_Roles(
        ///	lro_Username, 
        ///	lro_Rolename, 
        ///	lro_ApplicationName 
        ///) values (
        ///	@username, 
        ///	@rolename, 
        ///	@applicationName 
        ///);.
        /// </summary>
        internal static string AddRoles {
            get {
                return ResourceManager.GetString("AddRoles", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to set nocount off
        ///update fiv_Logins set
        ///	lgi_IsLockedOut = @isLockedOut,
        ///	lgi_LastLockedOutDate = @lastLockedOutDate
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string BlockLogin {
            get {
                return ResourceManager.GetString("BlockLogin", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to set nocount off;
        ///update fiv_Logins set
        ///	lgi_Password = @password,
        ///    lgi_CreationDate = @lastPasswordChangeDate
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string ChangePassword {
            get {
                return ResourceManager.GetString("ChangePassword", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to set nocount off;
        ///update fiv_Logins set
        ///	lgi_PasswordQuestion = @question,
        ///    lgi_PasswordAnswer = @answer
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string ChangeQuestionAndAnswer {
            get {
                return ResourceManager.GetString("ChangeQuestionAndAnswer", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select 
        ///	count(*)
        ///from 
        ///	fiv_Logins
        ///where 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string CountAll {
            get {
                return ResourceManager.GetString("CountAll", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select 
        ///	count(*)
        ///from 
        ///	fiv_Logins_Roles
        ///where 
        ///	lro_Username = @username and 
        ///	lro_Rolename = @rolename and 
        ///	lro_ApplicationName = @applicationName;.
        /// </summary>
        internal static string CountRolesByUser {
            get {
                return ResourceManager.GetString("CountRolesByUser", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select 
        ///	count(*)
        ///from 
        ///	fiv_Logins
        ///where 
        ///	lgi_Email like @emailSearch and
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string CountUsersByEmail {
            get {
                return ResourceManager.GetString("CountUsersByEmail", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select 
        ///	count(*) 
        ///from 
        ///	fiv_Logins
        ///where 
        ///	lgi_Username like @usernameSearch and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string CountUsersByName {
            get {
                return ResourceManager.GetString("CountUsersByName", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to set nocount off;
        ///insert into fiv_Logins (
        ///	lgi_Login, 
        ///	lgi_Username, 
        ///	lgi_Password, 
        ///	lgi_Email, 
        ///	lgi_PasswordQuestion, 
        ///	lgi_PasswordAnswer,
        ///	lgi_IsApproved, 
        ///	lgi_Notes, 
        ///	lgi_CreationDate, 
        ///	lgi_LastPasswordChangeDate, 
        ///	lgi_LastActivityDate,
        ///	lgi_ApplicationName, 
        ///	lgi_IsLockedOut, 
        ///	lgi_LastLockedOutDate, 
        ///	lgi_FailedAttemptCount,
        ///	lgi_FailedAttemptWindow, 
        ///	lgi_FailedAnswerAttemptCount, 
        ///	lgi_FailedAnswerAttemptWindow 
        ///) values (
        ///	@login, 
        ///	@username, 
        ///	@password, 
        ///	@email,  [rest of string was truncated]&quot;;.
        /// </summary>
        internal static string Create {
            get {
                return ResourceManager.GetString("Create", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to insert into fiv_Roles(
        ///	rol_Rolename, 
        ///	rol_ApplicationName 
        ///) values (
        ///	@rolename, 
        ///	@applicationName 
        ///);.
        /// </summary>
        internal static string CreateRole {
            get {
                return ResourceManager.GetString("CreateRole", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to delete from 
        ///	fiv_Logins
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string Delete {
            get {
                return ResourceManager.GetString("Delete", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to delete from 
        ///	fiv_Logins_Roles
        ///where 
        ///	lro_Username = @username and 
        ///	lro_ApplicationName = @applicationName;.
        /// </summary>
        internal static string DeleteRoles {
            get {
                return ResourceManager.GetString("DeleteRoles", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select 
        ///	lro_Username
        ///from 
        ///	fiv_Logins_Roles
        ///where 
        ///	lro_Username like @usernameSearch and 
        ///	lro_RoleName = @roleName and 
        ///	lro_ApplicationName = @applicationName;.
        /// </summary>
        internal static string FindUsersInRole {
            get {
                return ResourceManager.GetString("FindUsersInRole", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select 
        ///	rol_Rolename
        ///from 
        ///	fiv_Roles
        ///where 
        ///	rol_ApplicationName = @applicationName;.
        /// </summary>
        internal static string GetAllRoles {
            get {
                return ResourceManager.GetString("GetAllRoles", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select
        ///	lgi_Login, 
        ///	lgi_Username, 
        ///	lgi_ApplicationName, 
        ///	lgi_Email, 
        ///	lgi_Notes, 
        ///	lgi_Password, 
        ///	lgi_PasswordQuestion,
        ///    lgi_PasswordAnswer, 
        ///    lgi_IsApproved, 
        ///    lgi_LastActivityDate, 
        ///    lgi_LastLoginDate, 
        ///    lgi_LastPasswordChangeDate,
        ///    lgi_CreationDate, 
        ///    lgi_IsLockedOut, 
        ///    lgi_LastLockedOutDate, 
        ///    lgi_FailedAttemptCount,
        ///    lgi_FailedAttemptWindow, 
        ///    lgi_FailedAnswerAttemptCount, 
        ///    lgi_FailedAnswerAttemptWindow
        ///from 
        ///	fiv_Logins
        ///where 
        ///	lgi_Userna [rest of string was truncated]&quot;;.
        /// </summary>
        internal static string GetByUsername {
            get {
                return ResourceManager.GetString("GetByUsername", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select 
        ///	lgi_Password, 
        ///	lgi_PasswordAnswer, 
        ///	lgi_IsLockedOut
        ///from 
        ///	fiv_Logins
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string GetPassword {
            get {
                return ResourceManager.GetString("GetPassword", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select 
        ///	lro_Rolename
        ///from 
        ///	fiv_Logins_Roles
        ///where 
        ///	lro_Username = @username and 
        ///	lro_ApplicationName = @applicationName;.
        /// </summary>
        internal static string GetRolesByUser {
            get {
                return ResourceManager.GetString("GetRolesByUser", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select 
        ///	isnull(lgi_Username, &apos;&apos;)
        ///from 
        ///	fiv_Logins
        ///where 
        ///	lgi_Email = @email and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string GetUsernameByEmail {
            get {
                return ResourceManager.GetString("GetUsernameByEmail", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select 
        ///	lro_Username
        ///from 
        ///	fiv_Logins_Roles
        ///where 
        ///	lro_Rolename = @rolename and 
        ///	lro_ApplicationName = @applicationName;.
        /// </summary>
        internal static string GetUsersInRole {
            get {
                return ResourceManager.GetString("GetUsersInRole", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select
        ///	count(*)
        ///from
        ///	fiv_Logins
        ///where
        ///	lgi_LastActivityDate &gt; @compareDate and
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string GetUsersOnline {
            get {
                return ResourceManager.GetString("GetUsersOnline", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select 
        ///	lgi_Login, 
        ///	lgi_Username, 
        ///	lgi_Email, 
        ///	lgi_PasswordQuestion, 
        ///	lgi_Notes, 
        ///	lgi_IsApproved, 
        ///	lgi_IsLockedOut,
        ///	lgi_CreationDate, 
        ///	lgi_LastLoginDate, 
        ///	lgi_LastActivityDate, 
        ///	lgi_LastPasswordChangeDate, 
        ///	lgi_LastLockedOutDate
        ///from 
        ///	fiv_Logins
        ///where 
        ///	lgi_ApplicationName = @applicationName
        ///order by 
        ///	lgi_Username;.
        /// </summary>
        internal static string ListAll {
            get {
                return ResourceManager.GetString("ListAll", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to declare @startRow int, @endRow int;
        ///
        ///set @startRow = (@pageIndex * @pageSize) + 1;
        ///set @endRow = @startRow + @pageSize - 1;
        ///
        ///select
        ///	[Logins].*
        ///from (
        ///	select
        ///		lgi_Login, 
        ///		lgi_Username, 
        ///		lgi_ApplicationName, 
        ///		lgi_Email, 
        ///		lgi_Notes, 
        ///		lgi_Password, 
        ///		lgi_PasswordQuestion,
        ///		lgi_PasswordAnswer, 
        ///		lgi_IsApproved, 
        ///		lgi_LastActivityDate, 
        ///		lgi_LastLoginDate, 
        ///		lgi_LastPasswordChangeDate,
        ///		lgi_CreationDate, 
        ///		lgi_IsLockedOut, 
        ///		lgi_LastLockedOutDate, 
        ///		lgi_FailedAttempt [rest of string was truncated]&quot;;.
        /// </summary>
        internal static string ListByEmail {
            get {
                return ResourceManager.GetString("ListByEmail", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to declare @startRow int, @endRow int;
        ///
        ///set @startRow = (@pageIndex * @pageSize) + 1;
        ///set @endRow = @startRow + @pageSize - 1;
        ///
        ///select
        ///	[Logins].*
        ///from (
        ///	select
        ///		lgi_Login, 
        ///		lgi_Username, 
        ///		lgi_ApplicationName, 
        ///		lgi_Email, 
        ///		lgi_Notes, 
        ///		lgi_Password, 
        ///		lgi_PasswordQuestion,
        ///		lgi_PasswordAnswer, 
        ///		lgi_IsApproved, 
        ///		lgi_LastActivityDate, 
        ///		lgi_LastLoginDate, 
        ///		lgi_LastPasswordChangeDate,
        ///		lgi_CreationDate, 
        ///		lgi_IsLockedOut, 
        ///		lgi_LastLockedOutDate, 
        ///		lgi_FailedAttempt [rest of string was truncated]&quot;;.
        /// </summary>
        internal static string ListByName {
            get {
                return ResourceManager.GetString("ListByName", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select
        ///	lgi_FailedAttemptCount,
        ///	lgi_FailedAttemptWindow,
        ///	lgi_FailedAnswerAttemptCount,
        ///	lgi_FailedAnswerAttemptWindow
        ///from 
        ///	fiv_Logins
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string LoadFailureCounters {
            get {
                return ResourceManager.GetString("LoadFailureCounters", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to set nocount off;
        ///update fiv_Logins set
        ///	lgi_FailedAnswerAttemptCount = @count,
        ///	lgi_FailedAnswerAttemptWindow = @windowStart
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string PasswordAnswerErrorCounter {
            get {
                return ResourceManager.GetString("PasswordAnswerErrorCounter", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to set nocount off;
        ///update fiv_Logins set
        ///	lgi_FailedAttemptCount = @count,
        ///	lgi_FailedAttemptWindow = @windowStart
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string PasswordErrorCounter {
            get {
                return ResourceManager.GetString("PasswordErrorCounter", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to delete from 
        ///	fiv_Logins_Roles
        ///where 
        ///	lro_Rolename = @rolename and 
        ///	lro_ApplicationName = @applicationName;.
        /// </summary>
        internal static string RemoveLoginRoles {
            get {
                return ResourceManager.GetString("RemoveLoginRoles", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to delete from 
        ///	fiv_Roles
        ///where 
        ///	rol_Rolename = @rolename and 
        ///	rol_ApplicationName = @applicationName;.
        /// </summary>
        internal static string RemoveRoles {
            get {
                return ResourceManager.GetString("RemoveRoles", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to delete from 
        ///	fiv_Logins_Roles
        ///where 
        ///	lro_Username = @username and 
        ///	lro_Rolename = @rolename and 
        ///	lro_ApplicationName = @applicationName;.
        /// </summary>
        internal static string RemoveUsersFromRoles {
            get {
                return ResourceManager.GetString("RemoveUsersFromRoles", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to update fiv_Logins set
        ///	lgi_Password = @password,
        ///	lgi_PasswordQuestion = @question,
        ///	lgi_PasswordAnswer = @answer,
        ///	lgi_IsLockedOut = @isLockedOut,
        ///	lgi_LastPasswordChangeDate = @lastPasswordChangeDate
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string ResetPassword {
            get {
                return ResourceManager.GetString("ResetPassword", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select 
        ///	count(*)
        ///from 
        ///	fiv_Roles
        ///where 
        ///	rol_Rolename = @rolename and 
        ///	rol_ApplicationName = @applicationName;.
        /// </summary>
        internal static string RoleExists {
            get {
                return ResourceManager.GetString("RoleExists", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to update fiv_Logins set
        ///	lgi_IsLockedOut = 0,
        ///	lgi_LastLockedOutDate = @lastLockedOutDate
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string UnlockUser {
            get {
                return ResourceManager.GetString("UnlockUser", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to update fiv_Logins set
        ///	lgi_Email = @email,
        ///	lgi_Notes = @notes,
        ///	lgi_IsApproved = @isApproved
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string Update {
            get {
                return ResourceManager.GetString("Update", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to set nocount off
        ///update fiv_Logins set
        ///	lgi_FailedAttemptCount = @count
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string UpdateErrorPassword {
            get {
                return ResourceManager.GetString("UpdateErrorPassword", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to set nocount off
        ///update fiv_Logins set
        ///	lgi_FailedAnswerAttemptCount = @count
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string UpdateErrorPasswordAnswer {
            get {
                return ResourceManager.GetString("UpdateErrorPasswordAnswer", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to update fiv_Logins set
        ///	lgi_LastActivityDate = @lastActivityDate
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_Applicationname = @applicationName;.
        /// </summary>
        internal static string UpdateLastActivity {
            get {
                return ResourceManager.GetString("UpdateLastActivity", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to update fiv_Logins set
        ///	lgi_LastLoginDate = @lastLoginDate
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName;.
        /// </summary>
        internal static string UpdateLastLoginDate {
            get {
                return ResourceManager.GetString("UpdateLastLoginDate", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to select 
        ///	lgi_Password, 
        ///	lgi_IsApproved
        ///from 
        ///	fiv_Logins
        ///where 
        ///	lgi_Username = @username and 
        ///	lgi_ApplicationName = @applicationName and 
        ///	lgi_IsLockedOut = 0;.
        /// </summary>
        internal static string ValidateUser {
            get {
                return ResourceManager.GetString("ValidateUser", resourceCulture);
            }
        }
    }
}
