<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Show_Cars.aspx.cs" Inherits="WebApplication10.Show_Cars" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show Cars</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f2f2f2;
        }

        .car {
            width: 300px;
            margin: 20px;
            padding: 20px;
            display: inline-block;
            vertical-align: top;
            background-color: white;
            box-shadow: 0px 0px 10px #aaa;
            text-align: left;
        }

        .car img {
            width: 280px;
            height: 200px;
            object-fit: cover;
        }

        .title {
            font-size: 22px;
            font-weight: bold;
        }

        .price {
            color: green;
            font-size: 20px;
            font-weight: bold;
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <center>

        <h1>AVAILABLE CARS</h1>

        <asp:DataList ID="DataList1" runat="server"
            RepeatColumns="3"
            RepeatDirection="Horizontal">

            <ItemTemplate>

                <div class="car">

                    <asp:Image ID="Image1"
                        runat="server"
                        ImageUrl='<%# Eval("CarImage") %>' />

                    <br />
                    <br />

                    <asp:Label ID="Label1"
                        runat="server"
                        CssClass="title"
                        Text='<%# Eval("CarName") %>'>
                    </asp:Label>

                    <br />
                    <br />

                    <b>Model:</b>

                    <asp:Label ID="Label2"
                        runat="server"
                        Text='<%# Eval("CarModel") %>'>
                    </asp:Label>

                    <br />

                    <b>Description:</b>

                    <asp:Label ID="Label3"
                        runat="server"
                        Text='<%# Eval("CarDescription") %>'>
                    </asp:Label>

                    <br />

                    <b>Fuel:</b>

                    <asp:Label ID="Label4"
                        runat="server"
                        Text='<%# Eval("FuelType") %>'>
                    </asp:Label>

                    <br />

                    <b>Transmission:</b>

                    <asp:Label ID="Label5"
                        runat="server"
                        Text='<%# Eval("Transmission") %>'>
                    </asp:Label>

                    <br />

                    <b>Seats:</b>

                    <asp:Label ID="Label6"
                        runat="server"
                        Text='<%# Eval("NumberOfSeats") %>'>
                    </asp:Label>

                    <br />
                    <br />

                    <asp:Label ID="Label7"
                        runat="server"
                        CssClass="price"
                        Text='<%# "₹ " + Eval("PricePerDay") + " / Day" %>'>
                    </asp:Label>

                    <br />
                    <br />

                    <asp:Button ID="btnBookCar"
                        runat="server"
                        Text="BOOK CAR"
                        CommandArgument='<%# Eval("Id") %>'
                        OnClick="btnBookCar_Click"
                        BackColor="#222222"
                        ForeColor="White"
                        BorderStyle="None"
                        Width="280px"
                        Height="40px" />

                </div>

            </ItemTemplate>

        </asp:DataList>

    </center>

</form>

</body>
</html>