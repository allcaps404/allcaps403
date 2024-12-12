  <!-- <link rel="stylesheet" href="{{asset('mytemplate/vendors/feather/feather.css')}}"> -->
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <title>Admin</title>
  <!-- plugins:css -->
  <!-- <link rel="stylesheet" href="{{asset('mytemplate/vendors/feather/feather.css')}}"> -->
  <link rel="stylesheet" href="{{asset('mytemplate/vendors/ti-icons/css/themify-icons.css')}}">
  <!-- <link rel="stylesheet" href="{{asset('mytemplate/vendors/css/vendor.bundle.base.css')}}"> -->
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- <link rel="stylesheet" href="{{asset('mytemplate/vendors/datatables.net-bs4/dataTables.bootstrap4.css')}}"> -->
  <link rel="stylesheet" href="{{asset('mytemplate/vendors/ti-icons/css/themify-icons.css')}}">
  <!-- <link rel="stylesheet" type="text/css" href="{{asset('mytemplate/js/select.dataTables.min.css')}}"> -->
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
  .card-title i {
    color: white;
    margin-right: 8px;
  }

  <!-- <style>
    /* Custom style for SweetAlert2 popup to make it responsive */
    .swal-popup {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .swal-title {
        font-size: 24px; /* Adjust title size */
    }

    .swal-content {
        font-size: 16px; /* Adjust content (message) size */
    }

    /* Ensure image scales properly in smaller viewports */
    .swal-popup img {
        width: 200px !important;  /* Adjust this value to make the image larger */
        height: 200px !important; /* Adjust this value to make the image larger */
        object-fit: contain; /* Maintain aspect ratio */
    }

    /* Responsive styling */
    @media (max-width: 600px) {
        .swal-popup {
            width: 80% !important;
        }
        .swal-title {
            font-size: 20px;
        }
        .swal-content {
            font-size: 14px;
        }
        .swal-popup img {
            width: 80%;
            max-width: 100px;
        }
    }

    @media (max-width: 400px) {
        .swal-popup {
            width: 95% !important;
        }
        .swal-title {
            font-size: 18px;
        }
        .swal-content {
            font-size: 12px;
        }
        .swal-popup img {
            width: 90%;
            max-width: 80px;
        }
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

  <script type="text/javascript">
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
                    Swal.fire({
                        icon: 'success',
                        title: 'Yay! The Arduino is Back!',
                        text: 'Your Arduino is back online, no more worries!',
                        imageUrl: '{{ asset("images/tikarol.png") }}', 
                        imageWidth: 50,
                        imageHeight: 50,
                        imageAlt: 'Tikarol',
                        confirmButtonText: 'Okay!',
                        customClass: {
                            popup: 'swal-popup animated bounceInUp',  
                            title: 'swal-title',
                            content: 'swal-content'
                        }
                    });
                    isArduinoOffline = false; 
                    isAlertShown = false;
                }
            })
            .catch(error => {
                if (!isAlertShown) {  
                    Swal.fire({
                        icon: 'error',
                        title: 'Uh-oh! The Arduino is Offline!',
                        text: 'Your Arduino is not responding! Please check it out!',
                        imageUrl: '{{ asset("images/tikarol.png") }}', 
                        imageWidth: 50,
                        imageHeight: 50,
                        imageAlt: 'Tikarol',
                        confirmButtonText: 'Got it!',
                        customClass: {
                            popup: 'swal-popup animated shake',  
                            title: 'swal-title',
                            content: 'swal-content'
                        }
                    }).then(() => {
                        isAlertShown = false;
                    });
                    isAlertShown = true;  
                }

                isArduinoOffline = true;
            });
    }, 90000);
  </script>
</body>

</html>