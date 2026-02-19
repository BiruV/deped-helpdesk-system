<?php
session_start();
require 'db.php';

// Security Check
if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'User') {
    header("Location: login.php");
    exit;
}

// Logic for handling form submission goes here
// (e.g., if isset($_POST['submit_ticket']) { ... } )
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Request | DepEd ICT Helpdesk</title>
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
                    <h1 class="fw-bold text-dark mb-1">Submit a Support Request</h1>
                    <p class="text-muted">Please provide detailed information about the ICT issue you are experiencing.</p>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-10 col-xl-8">
                    <div class="card stat-card shadow-sm border-0 p-4">
                        <form action="create_ticket.php" method="POST">
                            
                            <div class="row g-4">
                                <div class="col-md-12">
                                    <label class="form-label fw-bold text-secondary small text-uppercase">Subject</label>
                                    <input type="text" name="subject" class="form-control form-control-lg bg-light border-0" placeholder="e.g. PC won't turn on, Network disconnected" required>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-secondary small text-uppercase">Category</label>
                                    <select name="categoryId" class="form-select form-select-lg bg-light border-0" required>
                                        <option value="" selected disabled>Select a Category...</option>
                                        <option value="1">Hardware Issue</option>
                                        <option value="2">Software / Applications</option>
                                        <option value="3">Network / Connectivity</option>
                                        <option value="4">Account Access</option>
                                    </select>
                                </div>

                                <div class="col-md-6">
                                    <label class="form-label fw-bold text-secondary small text-uppercase">Priority Level</label>
                                    <select name="priority" class="form-select form-select-lg bg-light border-0" required>
                                        <option value="Low">Low (Can wait a few days)</option>
                                        <option value="Medium" selected>Medium (Needs attention soon)</option>
                                        <option value="High">High (Urgent, blocking work)</option>
                                    </select>
                                </div>

                                <div class="col-12">
                                    <label class="form-label fw-bold text-secondary small text-uppercase">Detailed Description</label>
                                    <textarea name="description" class="form-control bg-light border-0" rows="6" placeholder="Please describe the issue in detail. The more info you provide, the faster our technicians can help..." required></textarea>
                                </div>

                                <div class="col-12 d-flex justify-content-end gap-3 mt-2">
                                    <a href="db_user.php" class="btn btn-light px-4 py-2 fw-bold text-secondary" style="border-radius: 10px;">Cancel</a>
                                    <button type="submit" name="submit_ticket" class="btn btn-deped shadow-sm">
                                        <i class="bi bi-send-fill me-2"></i>SUBMIT TICKET
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