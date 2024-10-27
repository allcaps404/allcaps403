<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top d-flex flex-row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-3" href="#">
            <img src="{{ asset('images/slsulogo.png') }}" alt="logo" style="width: 150px; height: auto;" />
        </a>
        <a class="navbar-brand brand-logo-mini" href="#">
            <img src="{{ asset('images/logo.png') }}" alt="logo" style="width: 50px; height: auto;" />
        </a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <marquee behavior="scroll" direction="left" class="mx-3">Real-Time IoT Monitoring and Automation of Irrigation and Fogger System for Vegetable Seedlings</marquee>

        <!-- Notification Icon -->
        <ul class="navbar-nav mr-3">
            <li class="nav-item dropdown">
                <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
                    <i class="icon-bell"></i>
                    <span class="count bg-danger"></span>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="notificationDropdown">
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
                            <p class="font-weight-light small-text mb-0 text-muted">Just now</p>
                        </div>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item preview-item">
                        <p class="mb-0 font-weight-medium float-left">See all notifications</p>
                        <span class="badge badge-pill badge-primary float-right">View all</span>
                    </a>
                </div>
            </li>
        </ul>
        <!-- End of Notification Icon -->

        <!-- User Profile Dropdown -->
        <ul class="navbar-nav navbar-nav-right">
            <li class="nav-item dropdown nav-profile">
                <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                    <img src="{{ asset('images/logo.png') }}" alt="profile" class="nav-profile-img" style="width: 30px; height: 30px;">
                    <span class="profile-name">Admin</span>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="profileDropdown">
                    <a class="dropdown-item" href="#">
                        <i class="ti-user text-primary"></i>
                        Profile
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
    </div>
</nav>
