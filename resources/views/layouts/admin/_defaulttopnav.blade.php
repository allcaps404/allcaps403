<nav class="navbar navbar-expand-lg col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
  <!-- <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
    <a class="navbar-brand brand-logo me-5" href="#">
      <img src="{{ asset('images/banner.png') }}" class="me-2" alt="logo" style="width: 180px; height: auto;">
    </a>
    <a class="navbar-brand brand-logo-mini" href="#">
      <img src="{{ asset('images/mylogo.png') }}" alt="logo" style="width: 50px; height: auto;">
    </a>
  </div> -->
    <div class="navbar-collapse collapse navbar-menu-wrapper d-flex align-items-center justify-content-between">
    <div class="d-none d-md-block flex-grow-1 text-center">
      <marquee behavior="scroll" direction="left" class="mx-3">
        Real-Time IoT Monitoring and Automation of Irrigation and Fogger System for Vegetable Seedlings
      </marquee>
    </div>

    <ul class="navbar-nav navbar-nav-right">
      @include('components.notifications')

      <li class="nav-item nav-profile dropdown">
        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
          <img src="{{ asset('images/mylogo.png') }}" alt="profile" class="nav-profile-img"/>
          <span class="profile-name">{{ Auth::user()->name }}</span>
        </a>
        <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
          <a class="dropdown-item" href="{{ route('users.edit', auth()->user()) }}">
            <i class="ti-user text-primary"></i> Profile
          </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="{{ route('logout') }}">
            <i class="ti-power-off text-primary"></i> Logout
          </a>
        </div>
      </li>
    </ul>
  </div>
</nav>
