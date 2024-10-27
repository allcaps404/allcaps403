@extends('layouts.admin.index') 
@section('title', 'Chat Interface')

@section('content')
<div class="container my-5">
    <div id="chat-box" class="card shadow-sm">
        <div class="card-body" style="max-height: 500px; overflow-y: auto;">
            <div id="chat-content"></div>
        </div>
        <div class="card-footer">
            <form id="chat-form" class="d-flex">
                <input type="text" id="user-input" class="form-control me-2" placeholder="Type your message here..." autocomplete="off" required>
                <button type="submit" class="btn btn-primary">Send</button>
            </form>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const chatForm = document.getElementById('chat-form');
        const userInput = document.getElementById('user-input');
        const chatContent = document.getElementById('chat-content');

        chatForm.addEventListener('submit', function(e) {
            e.preventDefault();
            const message = userInput.value.trim();
            if (message) {
                addMessageToChat('user-message', message);
                userInput.value = '';
                sendMessage(message);
            }
        });

        function addMessageToChat(className, message) {
            const messageDiv = document.createElement('div');
            messageDiv.classList.add('chat-message', className);
            messageDiv.textContent = message;
            chatContent.appendChild(messageDiv);
            chatContent.scrollTop = chatContent.scrollHeight;
        }

        async function sendMessage(message) {
            try {
                const response = await fetch('/chat', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                    },
                    body: JSON.stringify({ prompt: message })
                });
                const data = await response.text();
                addMessageToChat('bot-message', data);
            } catch (error) {
                addMessageToChat('bot-message', 'There was an error connecting to the chat service.');
            }
        }
    });
</script>
@endsection
