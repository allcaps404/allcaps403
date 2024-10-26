<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}">
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const navLinks = document.querySelectorAll('.nav-link');
            const activeLink = sessionStorage.getItem('activeLink');

            if (activeLink) {
                navLinks.forEach(link => {
                    if (link.getAttribute('href') === activeLink) {
                        link.classList.add('active');
                    }
                });
            }

            navLinks.forEach(link => {
                link.addEventListener('click', function() {
                    navLinks.forEach(item => item.classList.remove('active'));
                    this.classList.add('active');
                    sessionStorage.setItem('activeLink', this.getAttribute('href'));
                });
            });
        });
    </script>
</head>
<body>
    <div class="container-scroller">
        <nav class="sidebar sidebar-offcanvas active" id="sidebar">
            <ul class="nav">
                <li class="nav-item {{ request()->routeIs('admin.dashboard') ? 'active' : '' }}">
                    <a class="nav-link" href="{{ route('admin.dashboard') }}">
                        <i class="icon-grid menu-icon"></i>
                        <span class="menu-title">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item {{ request()->routeIs('users.index') ? 'active' : '' }}">
                    <a class="nav-link" href="{{ route('users.index') }}">
                        <i class="fas fa-users menu-icon"></i>
                        <span class="menu-title">Users</span>
                    </a>
                </li>
                <li class="nav-item {{ request()->routeIs('report') ? 'active' : '' }}">
                    <a class="nav-link" href="{{ route('report') }}">
                        <i class="fas fa-file-alt menu-icon"></i>
                        <span class="menu-title">Logs</span>
                    </a>
                </li>
                <li class="nav-item {{ request()->routeIs('respond') ? 'active' : '' }}">
                    <a class="nav-link" href="{{ route('chats.respond.post') }}">
                        <i class="bi bi-clipboard-data menu-icon"></i>
                        <span class="menu-title">Reports</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" data-toggle="collapse" href="#settings" aria-expanded="false" aria-controls="settings">
                        <i class="icon-layout menu-icon"></i>
                        <span class="menu-title">Settings</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="settings">
                        <ul class="nav flex-column sub-menu" style="list-style-type: none;">
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="fas fa-tint menu-icon"></i>
                                    <span class="menu-title">Water Pump</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <i class="fas fa-spray-can menu-icon"></i>
                                    <span class="menu-title">Fogger</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>

        <div class="main-panel">
            <div class="content-wrapper">
                <!-- Your main content goes here -->
            </div>
        </div>
    </div>
    <script src="{{ asset('js/app.js') }}"></script>
</body>
</html>
