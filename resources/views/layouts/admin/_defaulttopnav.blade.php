<nav class="navbar col-lg-15 col-15 p-0 fixed-top d-flex flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-10" href="">
            <img src="{{ asset('images/bitslog.png') }}" class="mr-8" alt="logo" style="width: 150px; height: auto;"/>
        </a>
        <a class="navbar-brand brand-logo-mini" href="">
            <img src="{{ asset('images/logo.png') }}" alt="logo" style="width: 300px; height: 50px;"/>
        </a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
    <span class="icon-menu"></span>
    </button>
        
        <!-- Notification Icon -->
        <!-- <ul class="navbar-nav mr-lg-2">
            <li class="nav-item dropdown">
                <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
                    <i class="icon-bell"></i>
                    <span class="count bg-danger">3</span> 
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="notificationDropdown">
                    <h6 class="p-3 mb-0">Notifications</h6>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item preview-item">
                        <div class="preview-thumbnail">
                            <div class="preview-icon bg-success">
                                <i class="ti-info-alt mx-0"></i>
                            </div>
                        </div>
                        <div class="preview-item-content">
                            <h6 class="preview-subject font-weight-normal">Notification 1</h6>
                            <p class="font-weight-light small-text mb-0 text-muted">
                                Just now
                            </p>
                        </div>
                    </a>
                 
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item preview-item">
                        <p class="mb-0 font-weight-medium float-left">See all notifications</p>
                        <span class="badge badge-pill badge-primary float-right">View all</span>
                    </a>
                </div>
            </li>
        </ul> -->
        <!-- End of Notification Icon -->

        <!-- User Profile Dropdown -->
        <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item nav-profile dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                    <img src="{{ asset('images/logo.png') }}" alt="profile" class="nav-profile-img">
                    <span class="profile-name">Admin</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                    <a class="dropdown-item" href="#">
                        <i class="ti-user text-primary"></i>
                        Profile
                    </a>
                    <a class="dropdown-item" href="#">
                        <i class="ti-settings text-primary"></i>
                        Settings
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="{{ route('logout') }}">
                        <i class="ti-power-off text-primary"></i>
                        Logout
                    </a>
                </div>
            </li>
        </ul>
        <!-- End of User Profile Dropdown -->

        <!-- Toggle Button for Mobile -->
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="icon-menu"></span>
        </button>
        <!-- End of Toggle Button -->
    </div>
</nav>
