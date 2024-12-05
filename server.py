from flask import Flask, request, jsonify
from flask_cors import CORS  # Import CORS for cross-origin requests

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# Root route to confirm server is running
@app.route('/')
def home():
    return "Flask server is running!"

# Endpoint to capture user details
@app.route('/capture-details', methods=['POST'])
def capture_details():
    username = request.json.get('username')  # Get the username from the request
    user_agent = request.json.get('userAgent')  # Get the User-Agent from the request
    ip_address = request.remote_addr  # Get the IP address of the client

    # Save the captured details to a file
    with open('user_details.txt', 'a') as f:
        f.write(f"IP Address: {ip_address}\n")
        f.write(f"Username: {username}\n")  # Write the username instead of hostname
        f.write(f"User Agent: {user_agent}\n")
        f.write("-" * 30 + "\n")

    print(f"Details Recorded: IP={ip_address}, Username={username}, User-Agent={user_agent}")
    return jsonify({"message": "Details Captured Successfully"})

if __name__ == '__main__':
    # Run the Flask app on all available IP addresses at port 5000
    app.run(host='0.0.0.0', port=5000)
