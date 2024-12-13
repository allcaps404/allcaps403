<title>@yield('title')</title>
<nav class="sidebar sidebar-offcanvas active" id="sidebar">
    <ul class="nav">
        <li class="nav-item {{ request()->routeIs('admin.dashboard') ? 'active' : '' }}">
            <a class="nav-link" href="{{ route('admin.dashboard') }}">
                <i class="icon-grid menu-icon"></i>
                <span class="menu-title">Dashboard</span>
            </a>
        </li>

        @if(Auth::user() && Auth::user()->role === 'admin')
        <li class="nav-item {{ request()->routeIs('users.index') ? 'active' : '' }}">
            <a class="nav-link" href="{{ route('users.index') }}">
                <i class="fas fa-users menu-icon"></i>
                <span class="menu-title">Users</span>
            </a>
        </li>
        @endif

        <li class="nav-item {{ request()->routeIs('log') ? 'active' : '' }}">
            <a class="nav-link" href="{{ route('log') }}">
                <i class="fas fa-file-alt menu-icon"></i>
                <span class="menu-title">Logs</span>
            </a>
        </li>

        <li class="nav-item {{ request()->routeIs('admin.setting.index') ? 'active' : '' }}">
            <a class="nav-link collapsed" href="{{ route('settings.index') }}">
                <i class="fa fa-wrench menu-icon"></i>
                <span class="menu-title">Settings</span>
            </a>
        </li>                
    </ul>   
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
</nav>
