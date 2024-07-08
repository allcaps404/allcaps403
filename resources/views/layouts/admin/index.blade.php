
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="{{asset('mytemplate/vendors/feather/feather.css')}}">
  <link rel="stylesheet" href="{{asset('mytemplate/vendors/ti-icons/css/themify-icons.css')}}">
  <link rel="stylesheet" href="{{asset('mytemplate/vendors/css/vendor.bundle.base.css')}}">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="{{asset('mytemplate/vendors/datatables.net-bs4/dataTables.bootstrap4.css')}}">
  <link rel="stylesheet" href="{{asset('mytemplate/vendors/ti-icons/css/themify-icons.css')}}">
  <link rel="stylesheet" type="text/css" href="{{asset('mytemplate/js/select.dataTables.min.css')}}">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="{{asset('mytemplate/css/vertical-layout-light/style.css')}}">
  <!-- endinject -->
  <link rel="shortcut icon" href="{{asset('images/logo.png')}}" />
  <!-- Add this line to the <head> section of your HTML -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" />

</head>
 <style>
        .card-title i {
            color: white; /* Set the color to white */
            margin-right: 8px; /* Optional: Add margin for spacing */
        }
    </style>

<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    @include('layouts.admin._defaulttopnav')
    
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
      <div class="theme-setting-wrapper">
        <div id="settings-trigger"><i class="ti-settings"></i></div>
        <div id="theme-settings" class="settings-panel">
          <i class="settings-close ti-close"></i>
          <p class="settings-heading"></p>
          <div class="sidebar-bg-options selected" id="sidebar-light-theme"><div class="img-ss rounded-circle bg-light border mr-3"></div></div>
          <div class="sidebar-bg-options" id="sidebar-dark-theme"><div class="img-ss rounded-circle bg-dark border mr-3"></div></div>
          <p class="settings-heading mt-2"></p>
          <div class="color-tiles mx-0 px-4">
            <div class="tiles success"></div>
            <div class="tiles warning"></div>
            <div class="tiles danger"></div>
            <div class="tiles info"></div>
            <div class="tiles dark"></div>
            <div class="tiles default"></div>
          </div>
        </div>
      </div>
      
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      @include('layouts.admin._defaultsidenav')
      <!-- partial -->
      <div class="main-panel">
        @yield('content')
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="{{asset('mytemplate/vendors/js/vendor.bundle.base.js')}}"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="{{asset('mytemplate/vendors/chart.js/Chart.min.js')}}"></script>
  <!-- <script src="{{asset('mytemplate/vendors/datatables.net/jquery.dataTables.js')}}"></script> -->
  <!-- <script src="{{asset('mytemplate/vendors/datatables.net-bs4/dataTables.bootstrap4.js')}}"></script> -->
  <!-- <script src="{{asset('mytemplate/js/dataTables.select.min.js')}}"></script> -->

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="{{asset('mytemplate/js/off-canvas.js')}}"></script>
  <script src="{{asset('mytemplate/js/hoverable-collapse.js')}}"></script>
  <script src="{{asset('mytemplate/js/template.js')}}"></script>
  <script src="{{asset('mytemplate/js/settings.js')}}"></script>
  <script src="{{asset('mytemplate/js/todolist.js')}}"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="{{asset('mytemplate/js/dashboard.js')}}"></script>
  <script src="{{asset('mytemplate/js/Chart.roundedBarCharts.js')}}"></script>
  <!-- End custom js for this page-->
</body>

</html>

