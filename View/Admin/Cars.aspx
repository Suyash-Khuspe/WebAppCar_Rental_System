<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Cars.aspx.cs" Inherits="WebAppCRMS.View.Admin.Cars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mybody" runat="server">
    <form>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="row">
                        <div class="row">
                            <div class="col"><h3 class="text-danger pl-4">Manage Cars</h3></div>
                            <div class="col">
                                <asp:Image runat="server" ImageUrl="~/Assets/img/logo_a.png" ID="car_a" Height="100px" Width="300px" />
                            </div>
                            <div class="col"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="mb-3">
                                <label for="LNoTB" class="form-label">License Number</label>
                                <asp:TextBox CssClass="form-control" ID="LNoTB" Placeholder="Enter License Number" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label for="BrandTB" class="form-label">Brand</label>
                                <asp:TextBox CssClass="form-control" ID="BrandTB" Placeholder="Enter Car Brand" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label for="ModelTB" class="form-label">Model</label>
                                <asp:TextBox CssClass="form-control" ID="ModelTB" Placeholder="Enter Car Model" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label for="PriceTB" class="form-label">Price</label>
                                <asp:TextBox CssClass="form-control" ID="PriceTB" Placeholder="Enter Car Price" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label for="ColorTB" class="form-label">Color</label>
                                <asp:TextBox CssClass="form-control" ID="ColorTB" Placeholder="Enter Car Color" runat="server"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label for="AvailableDD" class="form-label">Available</label>
                                <asp:DropDownList runat="server" ID="DropDownList1" class="form-control">
                                    <asp:ListItem>Available</asp:ListItem>
                                    <asp:ListItem>Booked</asp:ListItem>
                                </asp:DropDownList>
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
                    <h1>Cars List</h1>
                   <asp:GridView runat="server" ID="carlist" class="table table-hover" AutoGenerateColumns="False" AutoGenerateSelectButton="True" OnSelectedIndexChanged="carlist_SelectedIndexChanged">
                       <AlternatingRowStyle BackColor="#FF1313" ForeColor="White" />
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
            </div>
        </div>
    </form>
</asp:Content>
