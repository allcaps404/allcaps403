<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}">
    <!-- Add any other CSS files required for your project -->
</head>
<body>
    <div class="container-scroller">
        <nav class="sidebar sidebar-offcanvas active" id="sidebar">
            <ul class="nav">
                <li class="nav-item active">
                    <a class="nav-link" href="{{ route('dashboard') }}">
                        <i class="icon-grid menu-icon"></i>
                        <span class="menu-title">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
<a class="nav-link collapsed" data-toggle="collapse" href="#user-management" aria-expanded="false" aria-controls="user-management">
        <i class="icon-layout menu-icon"></i>
        <span class="menu-title">User Management</span>
        <i class="menu-arrow"></i>
    </a>
    <div class="collapse" id="user-management">
        <ul class="nav flex-column sub-menu">
            <li class="nav-item"> <a class="nav-link" href="{{ route('report') }}">Reports</a></li>
        </ul>
    </div>
</li>
        <div class="main-panel">
            <div class="content-wrapper">
                <!-- Your main content goes here -->
            </div>
        </div>
    </div>
    <!-- Add any JS files required for your project -->
    <script src="{{ asset('js/app.js') }}"></script>
</body>
</html>
