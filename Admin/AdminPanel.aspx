<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="WebApplication10.Admin.AdminPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f2f2f2;
            margin: 0;
        }

        .header {
            background-color: #222;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            width: 90%;
            margin: 40px auto;
            background-color: white;
            padding: 25px;
            box-shadow: 0px 0px 10px #aaa;
        }

        h2 {
            text-align: center;
        }

        .grid {
            width: 100%;
            margin-top: 20px;
        }

        .button {
            padding: 10px 20px;
            margin: 5px;
            background-color: #222;
            color: white;
            border: none;
            cursor: pointer;
        }

        .button:hover {
            background-color: #444;
        }

        .logout {
            float: right;
            background-color: red;
            color: white;
            padding: 8px 15px;
            text-decoration: none;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="header">

        <h1>Admin Panel</h1>

        <asp:Button ID="btnWebsite" runat="server"
            Text="VIEW MY WEBSITE"
            OnClick="btnWebsite_Click" />

    </div>

    <div class="container">

        <h2>Admin Menu</h2>

        <div style="text-align:center;">

            <asp:Button ID="btnAddCompany" runat="server"
                Text="ADD COMPANY"
                CssClass="button"
                OnClick="btnAddCompany_Click" />

            <asp:Button ID="btnAddCarProduct" runat="server"
                Text="ADD CAR PRODUCT"
                CssClass="button"
                OnClick="btnAddCarProduct_Click" />

        </div>

        <br />

        <h2>Registered Users</h2>

        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="True"
            CssClass="grid">
        </asp:GridView>

        <br />

        <asp:Button ID="btnLogout" runat="server"
            Text="Logout"
            OnClick="btnLogout_Click" />

    </div>

</form>

</body>
</html>