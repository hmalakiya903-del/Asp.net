<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Car_Products.aspx.cs" Inherits="WebApplication10.Admin.Add_Car_Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Car Products</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f4f7f6;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            background: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 650px;
        }

        h1 {
            font-size: 24px;
            color: #2c3e50;
            margin-bottom: 20px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .nav-links {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        .nav-links a {
            text-decoration: none;
            color: #3498db;
            font-size: 14px;
            font-weight: 600;
            transition: color 0.2s ease;
        }

        .nav-links a:hover {
            color: #1d6fa5;
            text-decoration: underline;
        }

        .form-table {
            width: 100%;
            border-collapse: collapse;
        }

        .form-table td {
            padding: 10px 0;
            vertical-align: middle;
        }

        .form-table td:first-child {
            width: 32%;
            font-weight: 600;
            color: #4a5568;
            padding-right: 15px;
        }

        input[type="text"], 
        select, 
        textarea, 
        input[type="file"] {
            width: 100%;
            padding: 9px 12px;
            border: 1px solid #cbd5e0;
            border-radius: 6px;
            font-size: 14px;
            outline: none;
            background-color: #ffffff;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }

        input[type="text"]:focus, 
        select:focus, 
        textarea:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        }

        textarea {
            resize: vertical;
            min-height: 75px;
        }

        input[type="file"] {
            background-color: #f8fafc;
            cursor: pointer;
        }

        .btn-submit {
            width: 100%;
            background-color: #2ecc71;
            color: #ffffff;
            border: none;
            padding: 12px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.2s ease;
        }

        .btn-submit:hover {
            background-color: #27ae60;
        }

        .status-label {
            display: block;
            margin-top: 15px;
            text-align: center;
            font-weight: 600;
            color: #e74c3c;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>ADD CAR PRODUCTS</h1>

            <div class="nav-links">
                <asp:HyperLink ID="Rent_Your_Car" runat="server" NavigateUrl="/Rent_Your_Car.aspx">
                    Show All Products
                </asp:HyperLink>
                <asp:HyperLink ID="Show_Company" runat="server" NavigateUrl="/Show_Company.aspx">
                    Show All Companies
                </asp:HyperLink>
                <asp:HyperLink ID="AdminPanel" runat="server" NavigateUrl="/Admin/AdminPanel.aspx">
                    Back to Admin
                </asp:HyperLink>
            </div>

            <table class="form-table">
                <tr>
                    <td>Company Name:</td>
                    <td>
                        <asp:DropDownList ID="drpcid" runat="server">
                            <asp:ListItem>--Select Company--</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>Car Name:</td>
                    <td>
                        <asp:TextBox ID="pnm" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Car Model:</td>
                    <td>
                        <asp:TextBox ID="pmdl" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Car Description:</td>
                    <td>
                        <asp:TextBox ID="pdecs" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Price Per Day:</td>
                    <td>
                        <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Fuel Type:</td>
                    <td>
                        <asp:DropDownList ID="drpFuel" runat="server">
                            <asp:ListItem Value="">--Select Fuel--</asp:ListItem>
                            <asp:ListItem>Petrol</asp:ListItem>
                            <asp:ListItem>Diesel</asp:ListItem>
                            <asp:ListItem>CNG</asp:ListItem>
                            <asp:ListItem>Electric</asp:ListItem>
                            <asp:ListItem>Hybrid</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>Transmission:</td>
                    <td>
                        <asp:DropDownList ID="drpTransmission" runat="server">
                            <asp:ListItem Value="">--Select Transmission--</asp:ListItem>
                            <asp:ListItem>Manual</asp:ListItem>
                            <asp:ListItem>Automatic</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>Number Of Seats:</td>
                    <td>
                        <asp:TextBox ID="txtSeats" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Car Image:</td>
                    <td>
                        <asp:FileUpload ID="fimg" runat="server" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <asp:Button ID="Button1" runat="server"
                            CssClass="btn-submit"
                            Text="Save Car"
                            OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>

            <asp:Label ID="Label1" runat="server" CssClass="status-label"></asp:Label>
        </div>
    </form>
</body>
</html>