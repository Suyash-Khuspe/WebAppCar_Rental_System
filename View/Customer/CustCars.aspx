<%@ Page Title="" Language="C#" MasterPageFile="~/View/Customer/CustomerMaster.Master" AutoEventWireup="true" CodeBehind="CustCars.aspx.cs" Inherits="WebAppCRMS.View.Customer.CustCars" %>

<asp:Content ID="Content2" ContentPlaceHolderID="mybody" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-10"></div>
            <div class="col-md-2">
               <asp:Label runat="server" Text="xxxxx" ID="lblcname"></asp:Label>
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4 ml-5">
                <asp:Image runat="server" ImageUrl="~/Assets/img/cars_collection/available.jpg" Height="200px" Width="250px" />
            </div>
            <div class="col-md-4"></div>
        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col">

                <div class="row">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <h1 class="text-primary">Available Cars</h1>
                    </div>
                </div>
                <div class="col-md-8">
                    <asp:GridView runat="server" ID="carlist" class="table table-hover" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanged="carlist_SelectedIndexChanged">
                        <AlternatingRowStyle ForeColor="White" BackColor="Blue" />
                        <Columns>
                            <asp:BoundField DataField="CPlateNum" HeaderText="License Number" />
                            <asp:BoundField DataField="Brand" HeaderText="Car Brand" />
                            <asp:BoundField DataField="Model" HeaderText="Car Model" />
                            <asp:BoundField DataField="Price" HeaderText="Car Price" />
                            <asp:BoundField DataField="Color" HeaderText="Car Color" />
                            <asp:BoundField DataField="CStatus" HeaderText="Car Status" />
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="row">
                    <div class="col-4">
                        <div class="form-group">
                            <asp:TextBox ID="DateTb" class="form-control" TextMode="Date" Placeholder="Date" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="DateRF" runat="server" ErrorMessage="*" ControlToValidate="DateTb"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="form-group d-grid">
                            <asp:Label ID="lblinfo" class="text-primary" runat="server"></asp:Label>
                            <asp:Button ID="btnbook" runat="server" class="btn btn-primary btn-block" Text="BOOK" OnClick="btnbook_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
