<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="project.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid bg-secondary">
        <div class="row">
            <div class="col-md-4 offset-md-4 py-6 px-5">
                <h1 class="display-5 text-center mb-4">Login</h1>
                <div>
                    <div class="row g-3">

                        <div class="col-12">
                            <div class="form-floating">
                                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                                <label for="form-floating-2">Email address</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="form-floating">
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                <label for="form-floating-1">Password</label>
                            </div>
                        </div>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        <div class="col-12">
                            <asp:HyperLink ID="HyperLink1" NavigateUrl="reset.aspx" CssClass="" runat="server">Forgot Password</asp:HyperLink>
                        </div>
                        <div class="col-12 mb-3">
                            <asp:Button CssClass="btn btn-primary w-100 py-3" ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" />
                        </div>
                        <div class="col-12 text-center">
                            <asp:HyperLink ID="HyperLink2" NavigateUrl="Signup.aspx" CssClass="text-center" runat="server">Don't have an account?</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
    function onLogIn(email) {
        localStorage.setItem("email", email);
    }
</script>
</asp:Content>