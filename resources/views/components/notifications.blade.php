<head>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        .notification-dropdown {
            position: relative;
        }

        .nav-link.count-indicator {
            position: relative;
            font-size: 1.5rem;
            transition: transform 0.3s ease;
        }

        /* Hover effect on bell */
        .nav-link.count-indicator:hover {
            transform: scale(1.1);
        }

        .count {
            position: absolute;
            top: 5px;
            right: 5px;
            background-color: white;
            color: black;
            font-size: 14px;
            font-weight: bold;
            width: 22px;
            height: 22px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            animation: bounce 0.5s ease-in-out infinite alternate;
        }

        /* Bounce animation for count */
        @keyframes bounce {
            0% {
                transform: scale(1);
            }
            100% {
                transform: scale(1.3);
            }
        }

        /* Dropdown Menu */
        .dropdown-menu.notification-menu {
            width: 350px;
            max-height: 500px;
            overflow-y: auto;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            background: #f8f9fa;
        }

        .dropdown-menu.notification-menu .dropdown-header {
            font-weight: bold;
            font-size: 1.2rem;
            color: #343a40;
            margin-bottom: 10px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }

        /* Notification Item Styling */
        .notification-item {
            display: flex;
            align-items: center;
            background-color: #fff;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 12px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
            cursor: pointer;
        }

        .notification-item:hover {
            background-color: #f1f1f1;
            transform: translateY(-2px);
        }

        .notification-item:last-child {
            margin-bottom: 0;
        }

        .icon-container {
            flex-shrink: 0;
            margin-right: 15px;
        }

        .icon-container i {
            font-size: 1.6rem;
            color: #007bff;
        }

        .message-container {
            flex-grow: 1;
        }

        .message-container span {
            font-weight: bold;
            color: #343a40;
        }

        .message-container .text-muted {
            font-size: 0.85rem;
            color: #6c757d;
        }

        .no-notifications {
            text-align: center;
            font-size: 0.9rem;
            color: #6c757d;
            margin-top: 20px;
        }

        .notification-item.read {
            background-color: #e9ecef;
        }

        @media (max-width: 768px) {
            .dropdown-menu.notification-menu {
                width: 100%;
                max-height: 400px;
            }

            .count {
                font-size: 12px;
                width: 18px;
                height: 18px;
            }

            .notification-item {
                padding: 10px;
            }

            .notification-item .icon-container {
                margin-right: 10px;
            }
        }
    </style>
</head>

<li class="nav-item dropdown notification-dropdown">
    <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
        <i class="icon-bell mx-0"></i>
        @if(Auth::user()->unreadNotifications->count() > 0)
            <span class="count">{{ Auth::user()->unreadNotifications->count() }}</span>
        @endif
    </a>
    <div class="dropdown-menu notification-menu dropdown-menu-right navbar-dropdown" aria-labelledby="notificationDropdown">
        <div class="d-flex justify-content-between align-items-center">
            <p class="dropdown-header mb-0">Notifications</p>
            <!-- "Remove All" Button placed next to the label -->
            @if(Auth::user()->unreadNotifications->count() > 0)
                <button id="remove-all-btn" class="btn btn-danger btn-sm">Remove All</button>
            @endif
        </div>
        
        <div id="notifications">
            @if(Auth::user()->unreadNotifications->isEmpty())
                <p class="no-notifications">No new notifications</p>
            @else
                <ul class="list-unstyled" id="notification-list">
                    @foreach (Auth::user()->unreadNotifications as $notification)
                        <li class="notification-item" data-id="{{ $notification->id }}">
                            <div class="icon-container">
                                <i class="icon-bell text-primary"></i>
                            </div>
                            <div class="message-container">
                                <span>{{ $notification->data['message'] }}</span>
                                <small class="text-muted">{{ $notification->created_at->diffForHumans() }}</small>
                                <small class="text-muted">
                                    {{ $notification->created_at->format('Y-m-d H:i:s') }}
                                </small>
                            </div>
                            <button class="delete-btn btn btn-danger btn-sm" style="display: none; margin-left: auto;">Remove</button>
                        </li>
                    @endforeach
                </ul>
            @endif
        </div>
    </div>
</li>

<script>
    document.querySelectorAll('.notification-item').forEach(item => {
        item.addEventListener('mouseenter', () => {
            const deleteBtn = item.querySelector('.delete-btn');
            deleteBtn.style.display = 'inline-block';
        });

        item.addEventListener('mouseleave', () => {
            const deleteBtn = item.querySelector('.delete-btn');
            deleteBtn.style.display = 'none';
        });

        item.querySelector('.delete-btn').addEventListener('click', function(event) {
            event.stopPropagation(); 

            const notificationId = item.dataset.id;

            fetch(`/notifications/${notificationId}/delete`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                }
            })
            .then(response => response.json())
            .then(data => {
                item.remove(); 
                
                const countElement = document.querySelector('.count');
                if (countElement) {
                    let currentCount = parseInt(countElement.textContent);
                    if (currentCount > 0) {
                        countElement.textContent = currentCount - 1;
                    }
                }

                if (document.querySelectorAll('.notification-item').length === 0) {
                    const countElement = document.querySelector('.count');
                    if (countElement) {
                        countElement.style.display = 'none'; 
                    }
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });
    });

    document.getElementById('remove-all-btn').addEventListener('click', function () {
        fetch('/notifications/delete-all', {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                document.getElementById('notification-list').innerHTML = '';
                const countElement = document.querySelector('.count');
                if (countElement) {
                    countElement.style.display = 'none';
                }
                document.getElementById('notifications').innerHTML = '<p class="no-notifications">No new notifications</p>';
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });
</script>
