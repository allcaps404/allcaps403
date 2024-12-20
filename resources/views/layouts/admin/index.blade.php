<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="csrf-token" content="{{ csrf_token() }}">
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
  <link rel="shortcut icon" href="{{asset('images/mylogo.png')}}" />
  <!-- Add this line to the <head> section of your HTML -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-k6RqeWeci5ZR/Lv4MR0sA0FfDOMT3z1b6SxXW/s6I0qVn5cR/Hgx3nEPhLIFvka" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
  <!-- SweetAlert2 CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
</head>

 <style>
    /* Styles for the bottom warning bar */
    #arduino-warning {
      display: none; /* Hidden by default */
      position: fixed;
      bottom: 0;
      left: 0;
      right: 0;
      background-color: #c0392b; /* A red-like color */
      color: #fff;
      text-align: center;
      padding: 10px;
      font-weight: bold;
      z-index: 9999;
      font-family: sans-serif;
    }
    #arduino-warning i {
      margin-right: 5px;
    }

    /* You can also add a subtle animation, for instance: */
    @keyframes slideUp {
      from {
        transform: translateY(100%);
      }
      to {
        transform: translateY(0);
      }
    }

    #arduino-warning.show {
      display: block;
      animation: slideUp 0.3s ease-out;
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

  <div id="arduino-warning">
    <i class="fas fa-exclamation-triangle"></i> Arduino is Not Responding!
  </div>

  <!-- plugins:js -->
  <script src="{{asset('mytemplate/vendors/js/vendor.bundle.base.js')}}"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="{{asset('mytemplate/vendors/chart.js/Chart.min.js')}}"></script>
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
  <script src="{{ asset('assets/js/jquery-3.6.0.min.js') }}"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js .js"></script>
  <!-- SweetAlert2 JS -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>

  <script>
        let isAlertShown = false;
        let isArduinoOffline = false;

        setInterval(() => {
            fetch('{{ route('check.arduino.response') }}')
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Arduino not responding');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log('Arduino Status:', data.message);

                    if (isArduinoOffline) {
                        document.getElementById('arduino-warning').classList.remove('show');
                        isArduinoOffline = false;
                        isAlertShown = false;
                    }
                })
                .catch(error => {
                    console.log('Error:', error);

                    if (!isAlertShown) {
                        const warningBar = document.getElementById('arduino-warning');
                        warningBar.classList.add('show');
                        isAlertShown = true;
                    }

                    isArduinoOffline = true;
                });
        }, 10000);
      </script>
</body>
</html>