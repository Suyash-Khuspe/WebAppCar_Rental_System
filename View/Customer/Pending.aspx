<%@ Page Title="" Language="C#" MasterPageFile="~/View/Customer/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="Pending.aspx.cs" Inherits="WebAppCRMS.View.Customer.Pending" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mybody" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col"></div>
            <div class="col">
                <h2>Your Pending Rentals</h2>
            </div>
            <div class="col"></div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="col-md-8">
                    <asp:GridView runat="server" ID="carlist" class="table table-hover" AutoGenerateColumns="False">
                        <AlternatingRowStyle ForeColor="White" BackColor="Blue" />
                        <Columns>
                            <asp:BoundField DataField="RentId" HeaderText="Rent Id" />
                            <asp:BoundField DataField="Car" HeaderText="Car Number" />
                            <asp:BoundField DataField="Customer" HeaderText="Customer" />
                            <asp:BoundField DataField="Rentdate" HeaderText="Rent Date" />
                            <asp:BoundField DataField="Returndate" HeaderText="Return Date" />
                            <asp:BoundField DataField="Fees" HeaderText="Fees" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
