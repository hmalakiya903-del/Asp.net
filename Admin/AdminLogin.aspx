
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="WebApplication10.Admin.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f2f2f2;
        }

        .login-box {
            width: 350px;
            margin: 100px auto;
            padding: 30px;
            background-color: white;
            box-shadow: 0px 0px 10px #aaa;
        }

        h2 {
            text-align: center;
        }

        .input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background-color: #222;
            color: white;
            border: none;
        }

        .message {
            color: red;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="login-box">

            <h2>Admin Login</h2>

            <asp:TextBox ID="txtUsername" runat="server"
                CssClass="input"
                placeholder="Enter Username">
            </asp:TextBox>

            <asp:TextBox ID="txtPassword" runat="server"
                CssClass="input"
                TextMode="Password"
                placeholder="Enter Password">
            </asp:TextBox>

            <asp:Button ID="btnLogin" runat="server"
                Text="LOGIN"
                CssClass="btn"
                OnClick="btnLogin_Click" />

            <br />
            <br />

            <asp:Label ID="lblMessage" runat="server"
                CssClass="message">
            </asp:Label>

        </div>

    </form>

</body>
</html>

