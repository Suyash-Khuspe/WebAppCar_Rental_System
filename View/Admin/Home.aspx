<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebAppCRMS.View.Admin.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mybody" runat="server">
    <div class="container mt-5 ml-5">
        <div class="row">
            <div class="jumbotron bg-danger">
                <div class="container">
                    <h1 class="display-4">Car Rental Management System Admin Panel</h1>
                    <p class="lead">The Admin can Manage Cars, Customers, Rentals and Rents</p>
                </div>
            </div>
        </div>
        <asp:Image ID="Image1" runat="server" />
        <div class="row">
            <div class="col-lg-3 col-md-6"><div><asp:Image runat="server" Height="150px" Width="250px" ImageUrl="~/Assets/img/cars_collection/bolero.jpg" alt="bolero"/></div><div><h5 class="text-danger">Mahindra Bolero</h5></div></div>
            <div class="col-lg-3 col-md-6"><div><asp:Image runat="server" Height="150px" Width="250px" ImageUrl="~/Assets/img/cars_collection/brezza.jpg" alt="Vitara Brezza"/></div><div><h5 class="text-danger">Suzuki Vitara Brezza</h5></div></div>
            <div class="col-lg-3 col-md-6"><div><asp:Image runat="server" Height="150px" Width="200px" ImageUrl="~/Assets/img/cars_collection/cruiser.png" alt="Cruiser"/></div><div><h5 class="text-danger">Force Cruiser</h5></div></div>
            <div class="col-lg-3 col-md-6"><div><asp:Image runat="server" Height="150px" Width="250px" ImageUrl="~/Assets/img/cars_collection/dzire.jpg" alt="dzire"/></div><div><h5 class="text-danger">Suzuki Swift Dzire</h5></div></div>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-3 col-md-6"><div><asp:Image runat="server" Height="150px" Width="250px" ImageUrl="~/Assets/img/cars_collection/eeco.jpg" alt="eeco"/></div><div><h5 class="text-danger">Suzuki Eeco</h5></div></div>
            <div class="col-lg-3 col-md-6"><div><asp:Image runat="server" Height="150px" Width="250px" ImageUrl="~/Assets/img/cars_collection/ertiga.jpg" alt="ertiga"/></div><div><h5 class="text-danger">Suzuki Ertiga</h5></div></div>
            <div class="col-lg-3 col-md-6"><div><asp:Image runat="server" Height="150px" Width="250px" ImageUrl="~/Assets/img/cars_collection/innova.jpeg" alt="innova"/></div><div><h5 class="text-danger">Toyota Innova</h5></div></div>
            <div class="col-lg-3 col-md-6"><div><asp:Image runat="server" Height="150px" Width="200px" ImageUrl="~/Assets/img/cars_collection/omni.jpg" alt="omni"/></div><div><h5 class="text-danger">Maruti Suzuki Omni</h5></div></div>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-3 col-md-6"><div><asp:Image runat="server" Height="150px" Width="250px" ImageUrl="~/Assets/img/cars_collection/scorpio.jpg" alt="scorpio"/></div><div><h5 class="text-danger">Mahindra Scorpio</h5></div></div>
            <div class="col-lg-3 col-md-6"><div><asp:Image runat="server" Height="150px" Width="250px" ImageUrl="~/Assets/img/cars_collection/swift.jpg" alt="swift"/></div><div><h5 class="text-danger">Suzuki Swift</h5></div></div>
            <div class="col-lg-3 col-md-6"><div><asp:Image runat="server" Height="150px" Width="250px" ImageUrl="~/Assets/img/cars_collection/tiago.png" alt="tiago"/></div><div><h5 class="text-danger">Tata Tiago</h5></div></div>
            <div class="col-lg-3 col-md-6"><div><asp:Image runat="server" Height="150px" Width="200px" ImageUrl="~/Assets/img/cars_collection/zest.jpg" alt="zest"/></div><div><h5 class="text-danger">Tata Zest</h5></div></div>
        </div>
    </div>
</asp:Content>
