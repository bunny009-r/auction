<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="book.aspx.cs" Inherits="project.book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
    <div class="container">
        <div class="category" onclick="showDetailsModal('schoolBookModal')">
            <img src="school-book.jpg" alt="School Book">
            <h2>School Book</h2>
        </div>

        <div class="category" onclick="showDetailsModal('cPlusPlusModal')">
            <img src="c-plus-plus.jpg" alt="C++">
            <h2>C++</h2>
        </div>

        <div class="category" onclick="showDetailsModal('javaModal')">
            <img src="java.jpg" alt="Java">
            <h2>Java</h2>
        </div>

        <div class="category" onclick="showDetailsModal('pythonModal')">
            <img src="python.jpg" alt="Python">
            <h2>Python</h2>
        </div>
    </div>

    <!-- School Book Modal -->
    <div id="schoolBookModal" class="modal">
        <span class="close-btn" onclick="closeDetailsModal('schoolBookModal')">&times;</span>
        <label for="schoolBookSubject">Enter Subject:</label>
        <input type="text" id="schoolBookSubject" name="schoolBookSubject" required>

        <label for="schoolBookClass">Enter Class:</label>
        <input type="text" id="schoolBookClass" name="schoolBookClass" required>

        <label for="schoolBookYear">Year Of Purchase:</label>
        <input type="date" id="schoolBookYear" name="schoolBookYear" required>

        <label for="schoolBookPriceBand">Price Band:</label>
        <input type="text" id="schoolBookPriceBand" name="schoolBookPriceBand" required>

        <button onclick="submitDetails('schoolBookModal')">Submit</button>
    </div>

    <!-- C++ Modal -->
    <div id="cPlusPlusModal" class="modal">
        <span class="close-btn" onclick="closeDetailsModal('cPlusPlusModal')">&times;</span>
        <label for="cPlusPlusAuthor">Author:</label>
        <input type="text" id="cPlusPlusAuthor" name="cPlusPlusAuthor" required>

        <label for="cPlusPlusEdition">Edition:</label>
        <input type="text" id="cPlusPlusEdition" name="cPlusPlusEdition" required>

        <label for="cPlusPlusYear">Year Of Purchase:</label>
        <input type="date" id="cPlusPlusYear" name="cPlusPlusYear" required>

        <label for="cPlusPlusPriceBand">Price Band:</label>
        <input type="text" id="cPlusPlusPriceBand" name="cPlusPlusPriceBand" required>

        <button onclick="submitDetails('cPlusPlusModal')">Submit</button>
    </div>

    <!-- Java Modal -->
    <div id="javaModal" class="modal">
        <span class="close-btn" onclick="closeDetailsModal('javaModal')">&times;</span>
        <label for="javaAuthor">Author:</label>
        <input type="text" id="javaAuthor" name="javaAuthor" required>

        <label for="javaEdition">Edition:</label>
        <input type="text" id="javaEdition" name="javaEdition" required>

        <label for="javaYear">Year Of Purchase:</label>
        <input type="date" id="javaYear" name="javaYear" required>

        <label for="javaPriceBand">Price Band:</label>
        <input type="text" id="javaPriceBand" name="javaPriceBand" required>

        <button onclick="submitDetails('javaModal')">Submit</button>
    </div>

    <!-- Python Modal -->
    <div id="pythonModal" class="modal">
        <span class="close-btn" onclick="closeDetailsModal('pythonModal')">&times;</span>
        <label for="pythonAuthor">Author:</label>
        <input type="text" id="pythonAuthor" name="pythonAuthor" required>

        <label for="pythonEdition">Edition:</label>
        <input type="text" id="pythonEdition" name="pythonEdition" required>

        <label for="pythonYear">Year Of Purchase:</label>
        <input type="date" id="pythonYear" name="pythonYear" required>

        <label for="pythonPriceBand">Price Band:</label>
        <input type="text" id="pythonPriceBand" name="pythonPriceBand" required>

        <button onclick="submitDetails('pythonModal')">Submit</button>
    </div>

    <script>
        function showDetailsModal(modalId) {
            document.getElementById(modalId).style.display = 'block';
        }

        function closeDetailsModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        function validateForm(modalId) {
            var requiredFields = document.getElementById(modalId).querySelectorAll('[required]');
            var isValid = true;

            requiredFields.forEach(function (field) {
                if (!field.value.trim()) {
                    isValid = false;
                    var errorMessage = field.nextElementSibling;
                    if (errorMessage && errorMessage.classList.contains('error-message')) {
                        errorMessage.textContent = 'This field is required.';
                    }
                }
            });

            return isValid;
        }

        function submitDetails(modalId) {
            var isFormValid = validateForm(modalId);

            if (isFormValid) {
                // Add logic to handle the submitted details for each category
                alert('Details submitted successfully!');
                closeDetailsModal(modalId);
            } else {
                alert('Please fill out all the required fields.');
            }
        }
    </script>
</body>
</asp:Content>
