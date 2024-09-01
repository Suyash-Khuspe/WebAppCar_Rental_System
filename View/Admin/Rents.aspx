<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Rents.aspx.cs" Inherits="WebAppCRMS.View.Admin.Rents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mybody" runat="server">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-5"></div>
                    <div class="col-5">
                        <h3 class="text-danger pl-4">Rented Cars</h3>
                        <asp:Image runat="server" ID="rented_car" Height="100px" Width="100px" ImageUrl="~/Assets/img/car_rented.PNG" />
                        <div class="col"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-9">
                        <asp:GridView runat="server" ID="Rentlist" class="table table-hover" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanged="Rentlist_SelectedIndexChanged">
                            <AlternatingRowStyle ForeColor="White" BackColor="#FF1313" />
                            <Columns>
                                <asp:BoundField DataField="RentId" HeaderText="Rent Id" />
                                <asp:BoundField DataField="Car" HeaderText="Car Number" />
                                <asp:BoundField DataField="Customer" HeaderText="Customer" />
                                <asp:BoundField DataField="Rentdate" HeaderText="Rent Date" />
                                <asp:BoundField DataField="Returndate" HeaderText="Return Date" />
                                <asp:BoundField DataField="Fees" HeaderText="Fees" />
                            </Columns>
                        </asp:GridView>
                        <div class="form-group">
                            <asp:Label ID="Delay" Class="form-group" Text="Delay" runat="server"></asp:Label>
                            <asp:TextBox class="form-control" PlaceHolder="Delay" ID="DelayTB" runat="server" />
                            <asp:Label ID="OnTime" Class="form-group" Text="Fine" runat="server"></asp:Label>
                            <asp:TextBox class="form-control" PlaceHolder="Fine" ID="FineTB" runat="server" />
                        </div>
                        <div class="form-group d-grid">
                            <asp:Label ID="msginfo" runat="server"></asp:Label>
                            <br />
                            <asp:Button ID="btnrtn" runat="server" class="btn btn-danger btn-block" Text="RETURN" OnClick="btnrtn_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <table class="table">
                </table>
            </div>
        </div>
    </div>
</asp:Content>
