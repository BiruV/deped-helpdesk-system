<?php
session_start();
require 'db.php';

// Security Check
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'User') {
    header("Location: login.php");
    exit;
}

// Backend logic for submitting the account request will go here
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Account | DepEd ICT Helpdesk</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="main-wrapper">
    <?php include 'sidebar_user.php'; ?>

    <div class="main-content">
        <?php include 'header.php'; ?>

        <div class="dashboard-container">
            
            <div class="row mb-4">
                <div class="col-12">
                    <h1 class="fw-bold text-dark mb-1">Account Creation Request</h1>
                    <p class="text-muted">Request official system access credentials for Region V personnel.</p>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-10 col-xl-8">
                    <div class="card stat-card shadow-sm border-0 p-4">
                        <form action="request_account.php" method="POST">
                            
                            <div class="row g-4">
                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-secondary small text-uppercase">Employee Full Name</label>
                                    <input type="text" name="emp_name" class="form-control form-control-lg bg-light border-0" placeholder="e.g. Juan Dela Cruz" required>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-secondary small text-uppercase">Designation / Position</label>
                                    <input type="text" name="designation" class="form-control form-control-lg bg-light border-0" placeholder="e.g. Teacher III, Admin Officer" required>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-secondary small text-uppercase">School / Division Office</label>
                                    <input type="text" name="office" class="form-control form-control-lg bg-light border-0" placeholder="e.g. Daraga National High School" required>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-secondary small text-uppercase">Type of Account Needed</label>
                                    <select name="account_type" class="form-select form-select-lg bg-light border-0" required>
                                        <option value="" selected disabled>Select Account Type...</option>
                                        <option value="DepEd Email">DepEd Microsoft 365 Email</option>
                                        <option value="Google Workspace">DepEd Google Workspace</option>
                                        <option value="LIS">Learner Information System (LIS)</option>
                                        <option value="EHRIS">EHRIS Portal</option>
                                    </select>
                                </div>

                                <div class="col-12">
                                    <label class="form-label fw-bold text-secondary small text-uppercase">Reason for Request</label>
                                    <textarea name="reason" class="form-control bg-light border-0" rows="4" placeholder="Briefly explain why this account is needed for your role..." required></textarea>
                                </div>

                                <div class="col-12 d-flex justify-content-end gap-3 mt-2">
                                    <a href="db_user.php" class="btn btn-light px-4 py-2 fw-bold text-secondary" style="border-radius: 10px;">Cancel</a>
                                    <button type="submit" name="submit_account_request" class="btn btn-deped shadow-sm">
                                        <i class="bi bi-shield-check me-2"></i>SUBMIT REQUEST
                                    </button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>