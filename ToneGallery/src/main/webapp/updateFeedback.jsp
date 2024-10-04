<%@ page import="java.sql.*, com.products.DBConnection" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String feedback = "";
    int rating = 0;

    try {
        conn = DBConnection.getConnection();
        String sql = "SELECT * FROM feedbacks WHERE id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        rs = stmt.executeQuery();
        if (rs.next()) {
            feedback = rs.getString("feedback");
            rating = rs.getInt("rating");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Update Feedback | Tone Gallery</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .feedback-card {
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            background-color: #007bff;
            color: #fff;
            transition: background-color 0.3s;
        }
        .btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

    <div class="container py-5">
        <div class="card feedback-card p-4">
            <h2 class="text-center mb-4">Update Your Feedback</h2>
            <form action="FeedbackServlet?action=update" method="post" class="mt-4">

                <input type="hidden" name="id" value="<%= id %>">
                <div class="mb-3">
                    <label for="feedback" class="form-label">Your Feedback</label>
                    <textarea name="feedback" id="feedback" class="form-control" rows="5" required><%= feedback %></textarea>
                </div>
                <div class="mb-3">
                    <label for="rating" class="form-label">Your Rating</label>
                    <select name="rating" id="rating" class="form-select" required>
                        <option value="5" <%= (rating == 5) ? "selected" : "" %>>5 Stars</option>
                        <option value="4" <%= (rating == 4) ? "selected" : "" %>>4 Stars</option>
                        <option value="3" <%= (rating == 3) ? "selected" : "" %>>3 Stars</option>
                        <option value="2" <%= (rating == 2) ? "selected" : "" %>>2 Stars</option>
                        <option value="1" <%= (rating == 1) ? "selected" : "" %>>1 Star</option>
                    </select>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-secondary">Update Feedback</button>
                </div>
            </form>
        </div>
    </div>

    <script src="js/bootstrap.bundle.min.js"></script>
</body>

</html>
