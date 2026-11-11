<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication10.Login" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Login</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f2f2f2;
        }

        .login-box {
            width: 350px;
            margin: 100px auto;
            background: white;
            padding: 30px;
            box-shadow: 0px 0px 10px #aaa;
        }

        .login-box h2 {
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
            background-color: #333;
            color: white;
            border: none;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <div class="login-box">

            <h2>Login</h2>

            <asp:TextBox ID="txtEmail" runat="server"
                CssClass="input"
                placeholder="Enter Email"></asp:TextBox>

            <asp:TextBox ID="txtPassword" runat="server"
                CssClass="input"
                TextMode="Password"
                placeholder="Enter Password"></asp:TextBox>

            <asp:Button ID="btnLogin" runat="server"
                Text="LOGIN"
                CssClass="btn"
                OnClick="btnLogin_Click" />

            <br /><br />

            <asp:Label ID="lblMessage" runat="server"></asp:Label>

        </div>

    </form>
</body>
</html>