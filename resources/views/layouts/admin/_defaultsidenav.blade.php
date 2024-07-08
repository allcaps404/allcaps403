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
            <li class="nav-item"> <a class="nav-link" href="{{ route('students') }}">Students</a></li>
            <li class="nav-item"> <a class="nav-link" href="{{ route('faculty') }}">Faculty</a></li>
            <li class="nav-item"> <a class="nav-link" href="{{ route('staff') }}">Staff</a></li>
            <li class="nav-item"> <a class="nav-link" href="{{ route('add-user') }}">Add New User</a></li>
            <!-- Example: Edit and Delete links should use appropriate routes with user ID -->
            <li class="nav-item"> <a class="nav-link" href="{{ route('edit-user', ['id' => 1]) }}">Edit User</a></li>
            <li class="nav-item"> <a class="nav-link" href="{{ route('delete-user', ['id' => 1]) }}">Delete User</a></li>
        </ul>
    </div>
</li>

                <li class="nav-item">
                    <a class="nav-link collapsed" data-toggle="collapse" href="#attendance-management" aria-expanded="false" aria-controls="attendance-management">
                        <i class="icon-clock menu-icon"></i>
                        <span class="menu-title">Attendance Management</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="attendance-management">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#">View Attendance Logs</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">Edit Attendance Logs</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">Export Logs</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" data-toggle="collapse" href="#authentication-methods" aria-expanded="false" aria-controls="authentication-methods">
                        <i class="icon-lock menu-icon"></i>
                        <span class="menu-title">Authentication Methods</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="authentication-methods">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#">Facial Recognition</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">Fingerprint</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">RFID</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">Configure Authentication</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" data-toggle="collapse" href="#notifications" aria-expanded="false" aria-controls="notifications">
                        <i class="icon-bell menu-icon"></i>
                        <span class="menu-title">Notifications</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="notifications">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#">SMS Notifications</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">Email Notifications</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">Notification Settings</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" data-toggle="collapse" href="#reports" aria-expanded="false" aria-controls="reports">
                        <i class="icon-chart menu-icon"></i>
                        <span class="menu-title">Reports</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="reports">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#">Generate Reports</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">Attendance Summary</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">Detailed Reports</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" data-toggle="collapse" href="#settings" aria-expanded="false" aria-controls="settings">
                        <i class="icon-settings menu-icon"></i>
                        <span class="menu-title">Settings</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="settings">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#">System Settings</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">User Permissions</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">Authentication Settings</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">Notification Settings</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" data-toggle="collapse" href="#help-support" aria-expanded="false" aria-controls="help-support">
                        <i class="icon-help menu-icon"></i>
                        <span class="menu-title">Help & Support</span>
                        <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse" id="help-support">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="#">User Guide</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">FAQ</a></li>
                            <li class="nav-item"> <a class="nav-link" href="#">Contact Support</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Logout</a>
                </li>
            </ul>
        </nav>
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
