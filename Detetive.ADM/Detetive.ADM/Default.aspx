<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Detetive.ADM.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cadastro de Usuário Administrador</title>
    <link rel="Stylesheet" type="text/css" href="Styles/login.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
        <div id="page" align="center">
            <div style="height: 200px;">
                <br />
            </div>
            <table class="btable">
                <tr>
                    <td class="blc">
                        <div class="header">
                            <asp:Label ID="lblTitle" runat="server">Bem-vindo ao módulo de administração do Detetive! </asp:Label></div>
                        <div class="blkc">
                            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" AnswerLabelText="Resposta:"
                                AnswerRequiredErrorMessage="É obrigatório digitar uma resposta." CompleteSuccessText="Sua conta foi criada com sucesso."
                                ConfirmPasswordCompareErrorMessage="A senha e a confirmação de senha precisam ser iguais."
                                ConfirmPasswordLabelText="Senha (confirmação):" ConfirmPasswordRequiredErrorMessage="A senha de confirmação é obrigatória."
                                CreateUserButtonText="Criar Usuário" DuplicateEmailErrorMessage="O endereço de email digitado já existe. Por favor digite um email diferente."
                                DuplicateUserNameErrorMessage="Por favor defina outro nome de usuário." EmailRegularExpressionErrorMessage="Por favor digite outro endereço de e-mail."
                                EmailRequiredErrorMessage="O e-mail é obrigatório." InvalidAnswerErrorMessage="Por favor digite outra resposta de segurança."
                                InvalidEmailErrorMessage="Por favor digite um endereço de email válido." InvalidPasswordErrorMessage="Sua senha deve ter no mínimo: {0}. Número de caracteres não-alfanuméricos obrigatórios: {1}."
                                InvalidQuestionErrorMessage="Por favor digite outra pergunta de segurança." OnCreatedUser="CreateUserWizard1_CreatedUser"
                                PasswordLabelText="Senha:" PasswordRegularExpressionErrorMessage="Por favor digite outra senha."
                                PasswordRequiredErrorMessage="A senha é obrigatória." QuestionLabelText="Pergunta de Segurança:"
                                QuestionRequiredErrorMessage="A pergunta de segurança é obrigatória." UnknownErrorMessage="Não foi possível criar seu usuário. Por favor tente novamente."
                                UserNameLabelText="Usuário:" UserNameRequiredErrorMessage="O usuário é obrigatório."
                                Width="100%">
                                <WizardSteps>
                                    <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" Title="Por favor crie a conta de administrador do sistema.">
                                        <ContentTemplate>
                                            <table border="0" class="propertiesTable">
                                                <tr class="row0">
                                                    <td align="center" colspan="3">
                                                        <asp:Label ID="lblStep0Title" CssClass="label" runat="server" Text="Por favor crie a conta de administrador do sistema."></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr class="row1">
                                                    <td align="right">
                                                        <asp:Label ID="UserNameLabel" CssClass="label" runat="server" AssociatedControlID="UserName">Usuário:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                            ErrorMessage="O usuário é obrigatório." ToolTip="O usuário é obrigatório." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="UserName" runat="server" Width="400px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="row0">
                                                    <td align="right">
                                                        <asp:Label ID="PasswordLabel" CssClass="label" runat="server" AssociatedControlID="Password">Senha:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                            ErrorMessage="A senha é obrigatória." ToolTip="A senha é obrigatória." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="400px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="row1">
                                                    <td align="right">
                                                        <asp:Label ID="ConfirmPasswordLabel" CssClass="label" runat="server" AssociatedControlID="ConfirmPassword">Senha (confirmação):</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                                            ErrorMessage="A senha de confirmação é obrigatória." ToolTip="A senha de confirmação é obrigatória."
                                                            ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" Width="400px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="row0">
                                                    <td align="right">
                                                        <asp:Label ID="EmailLabel" CssClass="label" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                                            ErrorMessage="O e-mail é obrigatório." ToolTip="O e-mail é obrigatório." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Email" runat="server" Width="400px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="row1">
                                                    <td align="right">
                                                        <asp:Label ID="QuestionLabel" CssClass="label" runat="server" AssociatedControlID="Question">Pergunta de Segurança:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                                            ErrorMessage="A pergunta de segurança é obrigatória." ToolTip="A pergunta de segurança é obrigatória."
                                                            ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Question" runat="server" Width="400px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr class="row0">
                                                    <td align="right">
                                                        <asp:Label ID="AnswerLabel" CssClass="label" runat="server" AssociatedControlID="Answer">Resposta:</asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                                            ErrorMessage="É obrigatório digitar uma resposta." ToolTip="É obrigatório digitar uma resposta."
                                                            ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="Answer" runat="server" Width="400px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="3">
                                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                                            ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="A senha e a confirmação de senha precisam ser iguais."
                                                            ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="3" style="color: red">
                                                        <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:CreateUserWizardStep>
                                    <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" Title="Pronto!">
                                        <ContentTemplate>
                                            <table border="0">
                                                <tr>
                                                    <td align="center" colspan="2">
                                                        Pronto!
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Sua conta foi criada com sucesso.
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" colspan="2">
                                                        <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue"
                                                            Text="Continue" ValidationGroup="CreateUserWizard1" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </asp:CompleteWizardStep>
                                </WizardSteps>
                            </asp:CreateUserWizard>
                        </div>
                        <br />
                        <asp:HyperLink ID="lnkLogin" CssClass="label" runat="server" NavigateUrl="Main.aspx">[ Ir para a Interface Administrativa ]</asp:HyperLink>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    </form>
</body>
</html>
