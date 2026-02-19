<?php
session_start();
require 'db.php';

if (!isset($_SESSION['user_id']) || $_SESSION['role'] !== 'User') {
    header("Location: login.php");
    exit;
}

$userId = $_SESSION['user_id'];

// Fetch Statistics
$statStmt = $pdo->prepare("SELECT 
    SUM(CASE WHEN status = 'Pending' THEN 1 ELSE 0 END) as p,
    SUM(CASE WHEN status = 'Processing' THEN 1 ELSE 0 END) as pr,
    SUM(CASE WHEN status IN ('Resolved', 'Closed') THEN 1 ELSE 0 END) as r
    FROM ticket WHERE userId = ?");
$statStmt->execute([$userId]);
$stats = $statStmt->fetch();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | DepEd ICT Helpdesk</title>
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
            
            <div class="row align-items-center mb-5">
                <div class="col-md-8">
                    <h1 class="fw-bold text-dark mb-1">User Dashboard</h1>
                    <p class="text-muted">Manage and monitor your ICT support requests.</p>
                </div>
                <div class="col-md-4 text-end">
                    <a href="create_ticket.php" class="btn-deped shadow-sm">
                        <i class="bi bi-plus-lg me-2"></i>SUBMIT NEW TICKET
                    </a>
                </div>
            </div>

            <div class="row g-4 mb-5">
                <div class="col-md-4">
                    <div class="stat-card border-warning">
                        <div class="d-flex justify-content-between">
                            <h6 class="text-muted fw-bold small">PENDING</h6>
                            <i class="bi bi-hourglass-split text-warning fs-4"></i>
                        </div>
                        <h1 class="display-3 fw-bold mt-2"><?php echo $stats['p'] ?? 0; ?></h1>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="stat-card border-info">
                        <div class="d-flex justify-content-between">
                            <h6 class="text-muted fw-bold small">PROCESSING</h6>
                            <i class="bi bi-gear-fill text-info fs-4"></i>
                        </div>
                        <h1 class="display-3 fw-bold mt-2"><?php echo $stats['pr'] ?? 0; ?></h1>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="stat-card border-success">
                        <div class="d-flex justify-content-between">
                            <h6 class="text-muted fw-bold small">RESOLVED</h6>
                            <i class="bi bi-check-circle-fill text-success fs-4"></i>
                        </div>
                        <h1 class="display-3 fw-bold mt-2"><?php echo $stats['r'] ?? 0; ?></h1>
                    </div>
                </div>
            </div>

            <div class="card stat-card shadow-sm border-0 p-0 overflow-hidden">
                <div class="card-header bg-white py-3 px-4 border-0">
                    <h5 class="mb-0 fw-bold text-dark"><i class="bi bi-clock-history me-2 text-success"></i>Ticket History</h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="bg-light small text-uppercase fw-bold">
                                <tr>
                                    <th class="ps-4 py-3">Reference</th>
                                    <th>Subject</th>
                                    <th>Status</th>
                                    <th class="text-end pe-4">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td colspan="4" class="text-center py-5 text-muted">
                                        No tickets found in your history.
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div> 
    </div> 
</div> 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>