<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource" %>
<%@ page import="com.products.DBConnection" %> 

<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    int totalProducts = 0;
    double totalEarnings = 0.0;
    try {
        conn = DBConnection.getConnection();
        String sql = "SELECT * FROM products";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();
        // Calculate the total number of products
        String countSql = "SELECT COUNT(*) AS total FROM products";
        PreparedStatement countStmt = conn.prepareStatement(countSql);
        ResultSet countRs = countStmt.executeQuery();
        if (countRs.next()) {
            totalProducts = countRs.getInt("total");
        }
        
        String earningsSql = "SELECT SUM(total) AS totalEarnings FROM payment"; 
        PreparedStatement earningsStmt = conn.prepareStatement(earningsSql);
        ResultSet earningsRs = earningsStmt.executeQuery();
        if (earningsRs.next()) {
            totalEarnings = earningsRs.getDouble("totalEarnings");
        }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tone Gallery | Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <style>
      @import url(https://unpkg.com/@webpixels/css@1.1.5/dist/index.css);

      /* Bootstrap Icons */
      @import url("https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.4.0/font/bootstrap-icons.min.css");
    </style>
    <!-- Dashboard -->
    <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
      <!-- Vertical Navbar -->
      <nav
        class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg"
        id="navbarVertical"
      >
        <div class="container-fluid">
          <!-- Toggler -->
          <button
            class="navbar-toggler ms-n2"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#sidebarCollapse"
            aria-controls="sidebarCollapse"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <!-- Brand -->
          <a class="navbar-brand py-lg-2 mb-lg-5 px-lg-6 me-0" href="#">
            <img
              src="img/logopng2.png"
              alt="..."
            />
          </a>
          <!-- User menu (mobile) -->
          <div class="navbar-user d-lg-none">
            <!-- Dropdown -->
            <div class="dropdown">
              <!-- Toggle -->
              <a
                href="#"
                id="sidebarAvatar"
                role="button"
                data-bs-toggle="dropdown"
                aria-haspopup="true"
                aria-expanded="false"
              >
                
              </a>
              <!-- Menu -->
              <div
                class="dropdown-menu dropdown-menu-end"
                aria-labelledby="sidebarAvatar"
              >
                
              </div>
            </div>
          </div>
          <!-- Collapse -->
          <div class="collapse navbar-collapse" id="sidebarCollapse">
            <!-- Navigation -->
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <i class="bi bi-house"></i> Dashboard
                </a>
              </li>
              
              
              
            </ul>
            <!-- Divider -->
            <hr class="navbar-divider my-5 opacity-20" />
            <!-- Navigation -->
            
            <!-- Push content down -->
            <div class="mt-auto"></div>
            <!-- User (md) -->
            <ul class="navbar-nav">
             
              <li class="nav-item">
                <a class="nav-link" href="logout">
                  <i class="bi bi-box-arrow-left"></i> Logout
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>

   <div class="h-screen flex-grow-1 overflow-y-lg-auto">
        <!-- Header -->
        <header class="bg-surface-primary border-bottom pt-6">
          <div class="container-fluid">
            <div class="mb-npx">
              <div class="row align-items-center">
                <div class="col-sm-6 col-12 mb-4 mb-sm-0">
                  <!-- Title -->
                  <h1 class="h2 mb-0 ls-tight">Admin Dashboard</h1>
                </div>
                <!-- Actions -->
                <div class="col-sm-6 col-12 text-sm-end">
                  <div class="mx-n1">
                    
                    <a href="#" class="btn d-inline-flex btn-sm btn-success mx-1" data-bs-toggle="modal" data-bs-target="#createProductModal">
      <span class="pe-3">
        <i class="bi bi-plus"></i>
      </span>
      <span>Add New</span>
    </a>
                  </div>
                </div>
              </div>
              
              <!-- Create Product Modal -->
    <div class="modal fade" id="createProductModal" tabindex="-1" aria-labelledby="createProductModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="createProductModalLabel">Create New Product</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <!-- Update the form enctype to handle file uploads -->
   <form action="ProductServlet" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
    <div class="modal-body">
        <div class="mb-3">
            <label for="productName" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="productName" name="name" required>
        </div>
        <div class="mb-3">
            <label for="productCategory" class="form-label">Category</label>
            <input type="text" class="form-control" id="productCategory" name="category" required>
        </div>
        <div class="mb-3">
            <label for="productPrice" class="form-label">Price</label>
            <input type="number" class="form-control" id="productPrice" name="price" required min="0" step="0.01">
        </div>
        <div class="mb-3">
            <label for="productImage" class="form-label">Product Image</label>
            <input type="file" class="form-control" id="productImage" name="image" accept="image/*" required>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Create Product</button>
    </div>
	</form>

        </div>
      </div>
    </div>
              
 <script>
function validateForm() {
    const priceInput = document.getElementById('productPrice');
    const imageInput = document.getElementById('productImage');
    
    // Validate price
    if (parseFloat(priceInput.value) <= 0) {
        alert("Price must be greater than 0.");
        return false;
    }

    // Validate image size (for example, max 2MB)
    if (imageInput.files[0] && imageInput.files[0].size > 2 * 1024 * 1024) {
        alert("Image size must be less than 2MB.");
        return false;
    }

    return true; // Valid form
}
</script>   
              
              
              <!-- Nav -->
              <ul class="nav nav-tabs mt-4 overflow-x border-0">
                <li class="nav-item">
                  <a href="#" class="nav-link active">Products</a>
                </li>
                
              </ul>
            </div>
          </div>
        </header>
        <!-- Main -->
        <main class="py-6 bg-surface-secondary">
          <div class="container-fluid">
            <!-- Card stats -->
            <div class="row g-6 mb-6">
              <div class="col-xl-3 col-sm-6 col-12">
                <div class="card shadow border-0">
                  <div class="card-body">
                    <div class="row">
                      <div class="col">
                        <span class="h6 font-semibold text-muted text-sm d-block mb-2">Total Earning</span>
                    <span class="h3 font-bold mb-0">LKR <%= String.format("%.2f", totalEarnings) %></span> <!-- Display total earnings -->
                      </div>
                      <div class="col-auto">
                        <div
                          class="icon icon-shape bg-tertiary text-white text-lg rounded-circle"
                        >
                          <i class="bi bi-credit-card"></i>
                        </div>
                      </div>
                    </div>
                    <div class="mt-2 mb-0 text-sm">
                                             
                      </span>
                      
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xl-3 col-sm-6 col-12">
                <div class="card shadow border-0">
                  <div class="card-body">
                    <div class="row">
                      <div class="col">
                        <span
                          class="h6 font-semibold text-muted text-sm d-block mb-2"
                          >Total Products</span
                        >
                        <span class="h3 font-bold mb-0"><%= totalProducts %></span>
                      </div>
                      <div class="col-auto">
                        <div
                          class="icon icon-shape bg-primary text-white text-lg rounded-circle"
                        >
                          <i class="bi bi-cart"></i>
                        </div>
                      </div>
                    </div>
                    <div class="mt-2 mb-0 text-sm">
                      
                    </div>
                  </div>
                </div>
              </div>
              
              
              </div>
            </div>
                    <div class="card shadow border-0 mb-7">
                        <div class="card-header">
                            <h5 class="mb-0">Products</h5>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover table-nowrap">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">Image</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Category</th>
                                        <th scope="col">Price</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        while (rs.next()) {
                                            String name = rs.getString("name");
                                            String category = rs.getString("category");
                                            double price = rs.getDouble("price");
                                            String imagePath = rs.getString("image_path"); 
                                    %>
                                    <tr>
                                        <td>
                                            <img alt="Product Image" src="<%= request.getContextPath() + "/" + imagePath %>" class="avatar avatar-sm" />
                                        </td>
                                        <td><a class="text-heading font-semibold" href="#"><%= name %></a></td>
                                        <td><%= category %></td>
                                        <td>LKR <%= price %></td>
                                        <td class="text-end">
                                            <a href="ViewProductServlet?name=<%= name %>" class="btn btn-sm btn-neutral">View</a>
                                            <!-- Edit button -->
    <a href="#" class="btn btn-sm btn-neutral" 
       data-bs-toggle="modal" 
       data-bs-target="#editProductModal" 
       onclick="populateEditForm('<%= name %>', '<%= category %>', <%= price %>, '<%= imagePath %>')">
       <i class="bi bi-pencil"></i>
    </a>
                                            <a href="DeleteProductServlet?name=<%= name %>" onclick="return confirm('Are you sure you want to delete this product?');"class="btn btn-sm btn-square btn-neutral text-danger-hover">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Create Product Modal -->
    <div class="modal fade" id="createProductModal" tabindex="-1" aria-labelledby="createProductModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="createProductModalLabel">Create New Product</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="ProductServlet" method="post" enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="productName" class="form-label">Product Name</label>
                            <input type="text" class="form-control" id="productName" name="name" required>
                        </div>
                        <div class="mb-3">
                            <label for="productCategory" class="form-label">Category</label>
                            <input type="text" class="form-control" id="productCategory" name="category" required>
                        </div>
                        <div class="mb-3">
                            <label for="productPrice" class="form-label">Price</label>
                            <input type="number" class="form-control" id="productPrice" name="price" required>
                        </div>
                        <div class="mb-3">
                            <label for="productImage" class="form-label">Product Image</label>
                            <input type="file" class="form-control" id="productImage" name="image" accept="image/*" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Create Product</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!-- Edit Product Modal -->
<div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="UpdateProductServlet" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <input type="hidden" id="editProductName" name="name" required>
                    <div class="mb-3">
                        <label for="editProductCategory" class="form-label">Category</label>
                        <input type="text" class="form-control" id="editProductCategory" name="category" required>
                    </div>
                    <div class="mb-3">
                        <label for="editProductPrice" class="form-label">Price</label>
                        <input type="number" class="form-control" id="editProductPrice" name="price" required>
                    </div>
                    <div class="mb-3">
                        <label for="editProductImage" class="form-label">Product Image</label>
                        <input type="file" class="form-control" id="editProductImage" name="image" accept="image/*">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Update Product</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
function populateEditForm(name, category, price, imagePath) {
    document.getElementById('editProductName').value = name;
    document.getElementById('editProductCategory').value = category;
    document.getElementById('editProductPrice').value = price;
    
}
</script>


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    
</body>
</html>

<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
    }
%>
