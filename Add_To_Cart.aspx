<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_To_Cart.aspx.cs" Inherits="WebApplication10.Add_To_Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add To Cart</title>
    <style type="text/css">
        * {
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f4f7f6;
            margin: 0;
            padding: 40px 20px;
            color: #333;
        }

        .cart-container {
            max-width: 950px;
            margin: 0 auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .status-message {
            text-align: center;
            color: #e74c3c;
            font-weight: 500;
            margin-bottom: 15px;
        }

        /* GridView Styling */
        .cart-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            overflow: hidden;
            border-radius: 8px;
            border: 1px solid #e0e0e0;
        }

        .cart-grid th {
            background-color: #2c3e50;
            color: #ffffff;
            padding: 14px;
            text-align: center;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .cart-grid td {
            padding: 12px;
            text-align: center;
            vertical-align: middle;
            border-bottom: 1px solid #e0e0e0;
            font-size: 14px;
        }

        .cart-grid tr:nth-child(even) {
            background-color: #f9fbfd;
        }

        .cart-grid tr:hover {
            background-color: #f1f5f9;
        }

        /* Car Image */
        .car-image {
            width: 90px;
            height: 70px;
            object-fit: cover;
            border-radius: 6px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        /* Form Controls inside Grid */
        .days-dropdown {
            padding: 6px 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            outline: none;
            font-size: 14px;
        }

        /* Action Buttons / Links */
        .cart-grid a {
            color: #3498db;
            text-decoration: none;
            font-weight: 600;
            padding: 6px 12px;
            border-radius: 4px;
            transition: background 0.2s ease;
        }

        .cart-grid a:hover {
            background-color: #ebf5fb;
            color: #2980b9;
        }

        /* Grand Total Section */
        .grand-total-container {
            margin-top: 25px;
            text-align: right;
            padding-top: 15px;
            border-top: 2px dashed #e0e0e0;
        }

        .grand-total-label {
            font-size: 18px;
            font-weight: 700;
            color: #2c3e50;
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="cart-container">

            <h1>Add To Cart</h1>

            <div class="status-message">
                <asp:Label ID="Label5" runat="server"></asp:Label>
            </div>

            <asp:GridView
                ID="GridView1"
                CssClass="cart-grid"
                runat="server"
                AutoGenerateColumns="False"
                DataKeyNames="Id"
                OnRowCommand="GridView1_RowCommand"
                OnRowEditing="GridView1_RowEditing"
                OnRowUpdating="GridView1_RowUpdating" 
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">

                <Columns>

                    <asp:TemplateField HeaderText="Car ID">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Car Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("CarImage") %>' CssClass="car-image" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Car Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("CarName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Car Model">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("CarModel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Price Per Day">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("PricePerDay", "{0:C}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Days">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="days-dropdown">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField HeaderText="Edit" ShowEditButton="True" />

                </Columns>

            </asp:GridView>

            <div class="grand-total-container">
                <asp:Label ID="grand_total" runat="server" CssClass="grand-total-label"></asp:Label>
            </div>

        </div>

    </form>

</body>
</html>