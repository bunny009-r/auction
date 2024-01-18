<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="buy.aspx.cs" Inherits="project.buy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <div class=" mb-5">
                    <div class="card border shadow">
                        <!-- Product image-->
                         <div class="card h-100">
                        <img class="card-img-top" src="img/ele.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Electronics</h5>
                                </div>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <asp:HyperLink CssClass="btn btn-outline-dark mt-auto" ID="HyperLink1" runat="server" NavigateUrl="~/types.aspx?type=ELECTRONICS">View Options</asp:HyperLink>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col mb-5">
                    <div class="card border shadow">
                    <div class="card h-100">
                        <!-- Product image-->
                        
                        <img class="card-img-top" src="img/car.png" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Vehicle</h5>

                            </div>
                        </div>
                            </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                               <asp:HyperLink CssClass="btn btn-outline-dark mt-auto" ID="HyperLink2" runat="server" NavigateUrl="~/types.aspx?type=VEHICLE">View Options</asp:HyperLink>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card border shadow">
                    <div class="card h-100">
                        
                        <!-- Product image-->
                        <img class="card-img-top" src="img/home.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Real Estate</h5>

                            </div>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                <asp:HyperLink CssClass="btn btn-outline-dark mt-auto" ID="HyperLink3" runat="server" NavigateUrl="~/types.aspx?type=REALESTATE">View Options</asp:HyperLink>
                                </div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                     <div class="card border shadow">
                    <div class="card h-100">
                        
                        <!-- Product image-->
                        <img class="card-img-top" src="img/book.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Books & Magazines</h5>
                                </div>

                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
<asp:HyperLink CssClass="btn btn-outline-dark mt-auto" ID="HyperLink6" runat="server" NavigateUrl="~/types.aspx?type=BOOK">View Options</asp:HyperLink>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card border shadow">
                    <div class="card h-100">
                        <!-- Product image-->
                       
                        <img class="card-img-top" src="img/furni.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Furniture</h5>
                            </div>
                        </div>
                           </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                            <asp:HyperLink CssClass="btn btn-outline-dark mt-auto" ID="HyperLink5" runat="server" NavigateUrl="~/types.aspx?type=FURNITURE">View Options</asp:HyperLink>    
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card border shadow">
                    <div class="card h-100">
                        <!-- Product image-->
                       
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Other</h5>
                                </div>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                               <asp:HyperLink CssClass="btn btn-outline-dark mt-auto" ID="HyperLink4" runat="server" NavigateUrl="~/types.aspx?type=OTHER">View Options</asp:HyperLink>

                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </section>
    <!-- Footer-->

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
</asp:Content>
