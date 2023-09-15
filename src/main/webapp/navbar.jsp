<!-- CSS and Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<%
    String username = (String) session.getAttribute("username");
    System.out.println(username);
%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a href="#" class="navbar-brand">
            <h3 style="color: green;">SHOPLEX&copy;</h3>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main-nav" aria-controls="main-nav"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="main-nav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="SAMSon"></a>
                </li>
                <% if (username != null) { %>
                    <li class="nav-item">
                        <a href="/ShoplexEcommerce/index.jsp" class="nav-link" target="blank">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="/ShoplexEcommerce/jsps/orderForm.jsp" class="nav-link">
                            <i class="bi bi-cart"></i> Cart
                            <span class="badge badge-danger ml-1">${cart_list.size()}</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/ShoplexEcommerce/logout" class="nav-link">Log Out</a>
                    </li>
                    <li class="nav-item">
                        <form class="form-inline my-2 my-lg-0" action="search.jsp" method="GET">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Search" aria-label="Search" name="searchitems">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-warning" type="submit"><i class="bi bi-search"></i> Search</button>
                                </div>
                            </div>
                        </form>
                    </li>
                <% } else { %>
                    <li class="nav-item">
                        <a href="index.jsp" class="nav-link" target="blank">Home</a>
                    </li>
                    <li class="nav-item">
                        <a href="/ShoplexEcommerce/jsps/signin.jsp" class="nav-link" target="blank">
                            <i class="bi bi-person"></i> Account
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/ShoplexEcommerce/jsps/orderForm.jsp" class="nav-link">
                            <i class="bi bi-cart"></i> Cart
                            <span class="badge badge-danger ml-1">${cart_list.size()}</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <form class="form-inline my-2 my-lg-0" action="search.jsp" method="GET">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Search" aria-label="Search" name="searchitems">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-warning" type="submit"><i class="bi bi-search"></i> Search</button>
                                </div>
                            </div>
                        </form>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
