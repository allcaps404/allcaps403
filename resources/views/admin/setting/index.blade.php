@extends('layouts.admin.index')

@section('content')
<div class="content-wrapper">
    <div class="row mb-4">
        <div class="col-12">
            <h3 class="font-weight-bold mb-3">Settings</h3>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            @if(session('success'))
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    {{ session('success') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            @endif
            @if(session('error'))
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    {{ session('error') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            @endif

            <div class="table-responsive shadow-sm">
                <table class="table table-hover table-bordered text-center align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>Device</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if(isset($settings))
                            @foreach($settings as $setting)
                            <tr>
                                <td>{{$setting->device}}</td>
                                <td>
                                    <span class="badge bg-{{ $setting->status ? 'success' : 'danger' }}">
                                        {{ $setting->status ? 'On' : 'Off' }}
                                    </span>
                                </td>
                                <td>
                                    <button data-id="{{$setting->id}}" data-status="{{ $setting->status }}" class="status_update btn btn-outline-{{ $setting->status?'danger' : 'success' }} btn-sm">
                                        {{ $setting->status? 'Turn Off' : 'Turn On' }}
                                    </button>
                                </td>
                            </tr>
                            @endforeach
                        @endif
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
    $('.status_update').on('click', function(e){
        e.preventDefault();
        
        var id = $(this).attr('data-id'); 
        var currentStatus = $(this).attr('data-status'); 
        var newStatus = currentStatus == 1 ? 0 : 1; 

        $.ajax({
            method: 'GET',
            url: '/settings/update/' + id, 
            success: function(response) {
                location.reload();
            },
            error: function(xhr, status, error) {
                alert('An error occurred in Laravel: ' + error);
            }
        });
    });
</script>
@endsection
