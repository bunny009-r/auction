<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="reset.aspx.cs" Inherits="project.reset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid bg-secondary">
     <div class="row">
         <div class="col-md-4 offset-md-4 py-6 px-5">
             <h1 class="display-5 text-center mb-4">Reset Password</h1>
             <div>
                 <div class="row g-3">
                     
                     <div class="col-12">
                         <div class="form-floating">
                             <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                             <label for="form-floating-2">Email address</label>
                         </div>
                     </div>
                     
                     <div class="col-12 mb-3">
                         <asp:Button ID="Button1" CssClass="btn btn-primary w-100 py-3" runat="server" Text="Submit" />
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>

</asp:Content>
