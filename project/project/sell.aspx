<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="sell.aspx.cs" Inherits="project.sell" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid bg-secondary">
    <div class="row">
        <div class="col-md-4 offset-md-4 py-6 px-5">
            <h1 class="display-5 text-center mb-4">Enter details</h1>
            <div>
                <div class="row g-3">
                    <div class="col-12">
                        <div class="form-floating">
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                            <label for="form-floating-2"> Product Name</label>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-floating">
                            <asp:DropDownList ID="DropDownList1" CssClass="form-select" runat="server">
                                <asp:ListItem>ELECTRONICS</asp:ListItem>
                                <asp:ListItem>VEHICLE</asp:ListItem>
                                <asp:ListItem Value="REALESTATE">REAL ESTATE</asp:ListItem>
                                <asp:ListItem>BOOK</asp:ListItem>
                                <asp:ListItem>FURNITURE</asp:ListItem>
                                <asp:ListItem>OTHER</asp:ListItem>
                            </asp:DropDownList>
                            <label for="form-floating-2">Type</label>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-floating">
                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                            <label for="form-floating-2">Image</label>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-floating">
                            <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                            <label for="form-floating-2">Amount</label>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-floating">
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                            <label for="form-floating-1">Description</label>
                        </div>
                    </div>
                    <div class="col-12 mb-3">
                        <asp:Button ID="Button1" CssClass="btn btn-primary w-100 py-3" runat="server" Text="Submit" OnClick="Button1_Click" />

                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
