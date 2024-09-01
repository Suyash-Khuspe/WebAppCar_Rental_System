<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Returns.aspx.cs" Inherits="WebAppCRMS.View.Admin.Returns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mybody" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5"></div>
            <div class="col-md-3">
                <asp:Image runat="server" ID="imgreturn" AlternateText="logo" ImageUrl="~/Assets/img/return_car.PNG" Height="150px" />
                <h1 class="text-danger">Returned Cars</h1>
            </div>
            <div class="col-md-3"></div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:GridView runat="server" ID="Returnlist" class="table table-hover" AutoGenerateColumns="False" AutoGenerateSelectButton="True">
                    <AlternatingRowStyle ForeColor="White" BackColor="#FF1313" />
                    <Columns>
                        <asp:BoundField DataField="Rentid" HeaderText="Rent Id" />
                        <asp:BoundField DataField="Car" HeaderText="Car Number" />
                        <asp:BoundField DataField="Customer" HeaderText="Customer" />
                        <asp:BoundField DataField="RDate" HeaderText="Return Date" />
                        <asp:BoundField DataField="CDelay" HeaderText="Delay" />
                        <asp:BoundField DataField="Fine" HeaderText="Fine" />
                    </Columns>
                </asp:GridView>
            </div> 
        </div>

    </div>
</asp:Content>
