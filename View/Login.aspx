<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebAppCRMS.View.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="../Assets/library/css/bootstrap.min.css" />
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-5">
                <div class="row mt-5">
                    <div class="col"></div>
                    <div class="col">
                        <h3 class="text-warning">PLEASE LOGIN</h3>
                        <asp:Image runat="server" ID="imglogo" AlternateText="logo" ImageUrl="~/Assets/img/login.PNG" Height="150px" Width="300px" />
                    </div>
                    <div class="col"></div>
                </div>
                <form runat="server">
                    <div class="form-group">
                        <label for="InputforUserName" class="text-warning">UserName</label>
                        <asp:TextBox ID="UserNameTb" class="form-control" Placeholder="UserName" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="UnameRF" runat="server" ErrorMessage="*" ControlToValidate="UserNameTb"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="InputforPassword" class="text-warning">Password</label>
                        <asp:TextBox ID="PassTb" class="form-control" Placeholder="Password" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="PassRF" runat="server" ErrorMessage="*" ControlToValidate="PassTb"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:RadioButton class="form-input" Text="Customer" ID="CustRadio" runat="server" GroupName="Role" />
                        <asp:RadioButton class="form-input" Text="Admin" ID="AdminRadio" runat="server" GroupName="Role" />
                    </div>
                    <br />
                    <asp:Label runat="server" ID="lblmess"></asp:Label>
                    <div class="form-group d-grid">
                        <asp:Label ID="msginfo" runat="server"></asp:Label>
                        <asp:Button ID="btnlogin" runat="server" class="btn btn-warning btn-block" Text="LOGIN" OnClick="btnlogin_Click" />
                    </div>
                </form>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>
</body>
</html>
