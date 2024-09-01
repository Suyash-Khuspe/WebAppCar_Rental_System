<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="WebAppCRMS.View.Admin.Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mybody" runat="server">
    <form>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="row">
                        <div class="row">
                            <div class="col">
                                <h3 class="text-danger pl-4">Manage Customers</h3>
                            </div>
                            <div class="col">
                                <asp:Image runat="server" ImageUrrl="" ID="car_a" Height="200px" Width="200px" ImageUrl="~/Assets/img/customer_logo.jpg" />
                            </div>
                            <div class="col"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="CustNameTb" class="form-label">Customer Name</label>
                                <asp:TextBox CssClass="form-control" ID="CustNameTb" Placeholder="Enter Customer Name" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label for="AddTb" class="form-label">Customer Address</label>
                                <asp:TextBox CssClass="form-control" ID="AddTb" Placeholder="Enter Customer Address" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label for="PhoneTb" class="form-label">Customer Phone Number</label>
                                <asp:TextBox CssClass="form-control" ID="PhoneTb" Placeholder="Enter Phone Number" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label for="PassTb" class="form-label">Customer Password</label>
                                <asp:TextBox CssClass="form-control" ID="PassTb" Placeholder="Enter Customer Password" runat="server"></asp:TextBox>
                            </div>
                            <asp:Label ID="errormsg" runat="server"></asp:Label>
                            <br />
                            <asp:Button ID="Btnadd" Text="ADD" class="btn btn-success" runat="server" OnClick="Btnadd_Click"></asp:Button>
                            <asp:Button ID="Btnedit" Text="EDIT" class="btn btn-primary" runat="server" OnClick="Btnedit_Click"></asp:Button>
                            <asp:Button ID="Btndelete" Text="DELETE" class="btn btn-danger" runat="server" OnClick="Btndelete_Click"></asp:Button>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <h1>Customers List</h1>
                    <asp:GridView runat="server" ID="custlist" class="table table-hover" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanged="carlist_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="#FF1313" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="Custid" HeaderText="Customer Id" />
                            <asp:BoundField DataField="CustName" HeaderText="Customer Name" />
                            <asp:BoundField DataField="CustAdd" HeaderText="Customer Address" />
                            <asp:BoundField DataField="CustPhone" HeaderText="Customer Phone" />
                            <asp:BoundField DataField="CustPassword" HeaderText="Customer Password"/>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
