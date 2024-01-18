<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="project.signup" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid bg-secondary">
        <div class="row">
            <div class="col-md-4 offset-md-4 py-6 px-5">
                <h1 class="display-5 text-center mb-4">Sign up</h1>
                <div>
                    <asp:Label ID="lblErrorMsg" runat="server" class="text-center" Text=""></asp:Label>
                    <div>
                        <div class="row g-3">

                            <div class="col-12">
                                <div class="form-floating">
                                    <asp:TextBox ID="name" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form-floating-2">Full Name</label>
                                    <asp:RegularExpressionValidator ID="NameValidator" runat="server"
                                        ControlToValidate="name"
                                        ValidationExpression="[a-zA-Z ]+"
                                        ErrorMessage="Invalid name format. Only alphabets and space are allowed."
                                        Display="Dynamic"
                                        ForeColor="Red" />
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-floating">
                                    <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                                    <label for="form-floating-2">Email address</label>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter a Valid Email"
                                        ControlToValidate="email"
                                        Display="Dynamic"
                                        ForeColor="Red"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-floating">
                                    <asp:TextBox ID="number" runat="server" CssClass="form-control" MaxLength="10" onkeydown="return (!((event.keyCode>=65 && event.keyCode <= 95) || event.keyCode >= 106) && event.keyCode!=32);"></asp:TextBox>
                                    <label for="form-floating-1">Phone Number</label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="This Field is Required"
                                        ControlToValidate="number"
                                        Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-floating">
                                    <asp:TextBox ID="pass" runat="server" CssClass="form-control"></asp:TextBox>
                                    <label for="form-floating-1">Password</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-floating">
                                    <asp:TextBox ID="cpass" runat="server" CssClass="form-control"></asp:TextBox>
                                    <label for="form-floating-1">Confirm Password</label>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password & Confirm Password are not Same" ControlToCompare="pass" ControlToValidate="cpass" Display="Dynamic"
ForeColor="Red"></asp:CompareValidator>
                                </div>
                            </div>
                            <div class="col-12 mb-3">
                                <asp:Button ID="Button1" CssClass="btn btn-primary w-100 py-3" OnClick="Button1_Click" runat="server" Text="Sign Up" />

                            </div>
                            <div class="col-12 text-center">
                                <asp:HyperLink ID="HyperLink2" NavigateUrl="login.aspx" CssClass="text-center" runat="server">Already Have A Account</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
