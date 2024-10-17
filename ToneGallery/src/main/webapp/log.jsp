<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="css/log.css">
    <title>Tone Gallery</title>
</head>

<body>

    <div class="container" id="container">
        <div class="form-container sign-up">
            <form action="register" method="post">
                <h1>Create Account</h1>
                <div class="social-icons">
                </div>
                <input type="text" placeholder="Name" name = "name">
                <input type="email" placeholder="Email" name = "email">
                <input type="password" placeholder="Password" name = "password" maxlength="10">
                <button>Sign Up</button>
            </form>
        </div>
        <div class="form-container sign-in">
            <form action="login" method="post">
                <h1>Sign In</h1>
                <div class="social-icons">                    
                </div>
                <input type="email" placeholder="Email" name="email">
                <input type="password" placeholder="Password" name="password" maxlength="10">
                <a href="#">Forget Your Password?</a>
                <button>Sign In</button>
            </form>
        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1>Welcome Back!</h1>
                    <p>Enter your personal details to use all of site features</p>
                    <button class="hidden" id="login">Sign In</button>
                </div>
                <div class="toggle-panel toggle-right">
                    <h1>Welcome to Tone Gallery</h1>
                    <p>Register with your personal details to use all of site features</p>
                    <button class="hidden" id="register">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
    
<script>
document.addEventListener("DOMContentLoaded", () => {
    const registerForm = document.querySelector(".sign-up form");
    const loginForm = document.querySelector(".sign-in form");

    registerForm.addEventListener("submit", function (e) {
        const name = this.name.value.trim();
        const email = this.email.value.trim();
        const password = this.password.value.trim();

        if (name === "") {
            alert("Name is required");
            e.preventDefault();
            return false;
        }

        if (!validateEmail(email)) {
            alert("Invalid email format");
            e.preventDefault();
            return false;
        }

        if (password.length < 6) {
            alert("Password must be at least 6 characters");
            e.preventDefault();
            return false;
        }
    });

    loginForm.addEventListener("submit", function (e) {
        const email = this.email.value.trim();
        const password = this.password.value.trim();

        if (!validateEmail(email)) {
            alert("Invalid email format");
            e.preventDefault();
            return false;
        }

        if (password === "") {
            alert("Password is required");
            e.preventDefault();
            return false;
        }
    });

    function validateEmail(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(String(email).toLowerCase());
    }
});

</script>
    

    <script src="js/script.js"></script>
    <% if(request.getAttribute("error") != null) { %>
        <p style="color: red;"><%= request.getAttribute("error") %></p>
    <% } %>
</body>

</html>