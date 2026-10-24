<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("passwordResetUserID") == null) {
        response.sendRedirect(
                request.getContextPath() + "/auth?action=forgotPasswordForm"
        );
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Reset Password | BarangBaek</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/resetpassword.css">
    </head>

    <body>

        <div class="reset-box">

            <h1>Create New Password</h1>

            <% if (request.getAttribute("error") != null) {%>
            <div class="error-message">
                <%= request.getAttribute("error")%>
            </div>
            <% }%>

            <form action="${pageContext.request.contextPath}/auth?action=resetPassword"
                  method="post">

                <div class="input-group">
                    <label for="password">NEW PASSWORD</label>

                    <input type="password"
                           id="password"
                           name="password"
                           minlength="8"
                           autocomplete="new-password"
                           required>

                    <div class="note">
                        Password must contain at least 8 characters.
                    </div>
                </div>

                <div class="input-group">
                    <label for="confirmPassword">CONFIRM NEW PASSWORD</label>

                    <input type="password"
                           id="confirmPassword"
                           name="confirmPassword"
                           minlength="8"
                           autocomplete="new-password"
                           required>
                </div>

                <button type="submit" class="reset-btn">
                    Reset Password
                </button>

            </form>

        </div>
    </body>
</html>