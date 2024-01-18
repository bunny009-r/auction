<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="project.view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="super_container">
        <div class="single_product">
            <div class="container-fluid" style="background-color: #fff; padding: 11px;">
                <div class="row">
                    <div class="col-md-4 offset-md-2">
                        <asp:Image CssClass="img-fluid" ID="Image1" runat="server" />
                    </div>
                    <div class="col-md-4 p-3">
                        <h1>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </h1>
                        <p>
                            <span class="badge bg-secondary">
                                <asp:Label CssClass="text-dark" ID="Label4" runat="server" Text="Label"></asp:Label>
                            </span>
                        </p>
                        <p>
                            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                        </p>
                        <h3>Rs. 
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        </h3>
                        <div class="bid-form">
                            <label for="bidAmount">Enter Your Bid:</label>
                            <asp:TextBox ID="amount" placeholder="Enter bid amount" runat="server"></asp:TextBox>


                            <div class="col-12 mb-3">
                                <asp:Button ID="Button1" CssClass="btn btn-primary w-100 py-3" runat="server" Text="Add Bid" OnClick="Button1_Click" />
                                <!-- JavaScript for bid successful alert -->
                                <script>
                                    function showBidSuccessfulAlert() {
                                        alert("Bid successfully placed!");
                                    }
                            </script>

                                <!-- Check if bid was successful in code-behind and call JavaScript alert -->
                                <asp:Literal ID="litBidSuccessful" runat="server"></asp:Literal>

                            </div>

                            <div>
                                <h4>Time Left:
                                    <asp:Label ID="lblTimeLeft" runat="server" Text=""></asp:Label></h4>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script type="text/javascript">
        function updateTimer() {
            var targetTime = new Date("January 16, 2024 23:30:00");
            var now = new Date();
            var timeLeft = targetTime - now;

            if (timeLeft > 0) {
                var hours = Math.floor(timeLeft / 3600000);
                var minutes = Math.floor((timeLeft % 3600000) / 60000);
                var seconds = Math.floor((timeLeft % 60000) / 1000);

                hours = (hours < 10) ? "0" + hours : hours;
                minutes = (minutes < 10) ? "0" + minutes : minutes;
                seconds = (seconds < 10) ? "0" + seconds : seconds;

                document.getElementById('<%= lblTimeLeft.ClientID %>').innerHTML = hours + ":" + minutes + ":" + seconds;
            setTimeout(updateTimer, 1000);
        } else {
            document.getElementById('<%= lblTimeLeft.ClientID %>').innerHTML = "Expired";
            }
        }

        window.onload = function () {
            updateTimer();
        };
</script>
</asp:Content>
