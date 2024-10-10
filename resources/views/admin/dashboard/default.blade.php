@extends('layouts.admin.index')

@section('content')
<div class="content-wrapper">
    <div class="row">
        <div class="col-md-12 grid-margin">
            <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                    <h3 class="font-weight-bold">Overview Screen</h3>
                    <div class="card">
                        <!-- <div class="card-body">
                            <p>Welcome to your attendance monitoring dashboard.</p>
                        </div> -->
                    </div>
                </div>
               
            </div>
        </div>
    </div>

    <div class="row">
    <!-- Students Section -->
    <div class="col-md-4">
        <div class="card bg-primary text-white mb-4">
            <div class="card-body text-center">
                <h4 class="card-title"></h4>
                <div class="row">
                    <div class="col-md-6">
                    </div>
                    <div class="col-md-6">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Faculty Section -->
    <div class="col-md-4">
        <div class="card bg-primary text-white mb-4">
            <div class="card-body text-center">
                <h4 class="card-title"></h4>
                <div class="row">
                    <div class="col-md-6">
                    </div>
                    <div class="col-md-6">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Staff Section -->
    <div class="col-md-4">
        <div class="card bg-primary text-white mb-4">
            <div class="card-body text-center">
                <h4 class="card-title"></h4>
                <div class="row">
                    <div class="col-md-6">
                    </div>
                    <div class="col-md-6">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

      <div class="row mt-4">
        <!-- Attendance Logs Section -->
        <!-- <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="card-title">Attendance Logs</h4>
                        <div class="input-group w-25">
                            <input type="text" class="form-control" placeholder="Search...">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="icon-magnifier"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID Number</th>
                                    <th>Name</th>
                                    <th>Role</th>
                                    <th>Location or Room</th>
                                    <th>Time In</th>
                                    <th>Time Out</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>John Doe</td>
                                    <td>Student</td>
                                    <td>Room 101</td>
                                    <td>08:00 AM</td>
                                    <td>04:00 PM</td>
                                </tr>
                                <!-- Add more rows dynamically with actual data -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div> -->
    </div>

    <!-- Additional Sections or Cards -->
    <div class="row">
        <div class="col-md-6">
            <!-- Add any additional sections or cards here -->
        </div>
    </div>
</div>
@endsection
 