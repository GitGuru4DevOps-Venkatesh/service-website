<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $to_email = "digitaldreamscapes.network@gmail.com"; // Your email address
    $subject = "New subscription to Digital DreamScapes Network newsletter";
    $email = $_POST['email']; // Sender's email address
    
    // Email content
    $message = "New subscription request from: " . $email;

    // Send email
    $result = mail($to_email, $subject, $message);

    if ($result) {
        // Email sent successfully
        header('Location: thank_you_page.html'); // Replace with the URL of your thank you page
        exit();
    } else {
        // Error sending email
        echo "Failed to send email. Please try again later.";
    }
}
?>

