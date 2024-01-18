<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="project.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid bg-secondary px-0">
    <div class="row g-0">
        <div class="col-lg-6 py-6 px-5">
            <h1 class="display-5 mb-4">Contact For Any Queries</h1>
            <div>
                <div class="row g-3">
                    <div class="col-6">
                        <div class="form-floating">
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                            
                            <label for="form-floating-1">Full Name</label>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-floating">
                           <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                            <label for="form-floating-2">Email address</label>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-floating">
                            <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                            <label for="form-floating-3">Subject</label>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-floating">
                            <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
                            <label for="form-floating-4">Message</label>
                          </div>
                    </div>
                    <div class="col-12">
                        <asp:Button ID="Button1" CssClass="btn btn-primary w-100 py-3" runat="server" OnClick="Button1_Click" Text="Submit" />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6" style="min-height: 400px;">
            <div class="position-relative h-100">
                <iframe class="position-relative w-100 h-100"
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3664.5181390202088!2d85.40999937454866!3d23.29695230603478!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39f4de75579289b7%3A0xdbe13add0e92815c!2sJharkhand%20Rai%20University!5e0!3m2!1sen!2sin!4v1704393574687!5m2!1sen!2sin"
                    frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            </div>
        </div>
    </div>
</div>
</asp:Content>
