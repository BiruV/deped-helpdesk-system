<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>
<div class="navbar-custom">
    <div class="d-flex align-items-center">
        <span class="me-4 small text-white">
            Logged in as: <b class="text-uppercase" style="letter-spacing: 0.5px;"><?php echo htmlspecialchars($_SESSION['fullname'] ?? 'User'); ?></b>
        </span>
        <a href="logout.php" class="btn btn-outline-light btn-sm rounded-pill px-4" style="font-size: 12px; font-weight: 700; border: 1.5px solid rgba(255,255,255,0.5); text-decoration: none;">
            LOGOUT
        </a>
    </div>
</div>