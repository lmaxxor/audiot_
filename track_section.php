<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
function track_section(string $section): void {
    if (!isset($_SESSION['visited_sections'])) {
        $_SESSION['visited_sections'] = [];
    }
    if (!in_array($section, $_SESSION['visited_sections'], true)) {
        $_SESSION['visited_sections'][] = $section;
    }
}
?>
