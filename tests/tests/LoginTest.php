<?php
require_once './vendor/autoload.php';
use PHPUnit\Framework\TestCase;

class LoginTest extends TestCase {
  public function testLogin() {
    $expectedUsername = 'admin123';
    $expectedPassword = '123456';

    // Test case 1: Test with correct admin username and password
    $_POST['username'] = $expectedUsername;
    $_POST['password'] = $expectedPassword;
    ob_start();
    include '../../BanSach/login/login.php';
    $output = ob_get_clean();
    $this->assertStringContainsString('Đăng nhập Admin thành công!', $output);

    // Test case 2: Test with correct user username and password
    $expectedPassword = password_hash($expectedPassword, PASSWORD_DEFAULT); // hash the password
    $sql = "INSERT INTO user (username, password) VALUES ('$expectedUsername', '$expectedPassword')";
    execute($sql);
    $_POST['username'] = $expectedUsername;
    $_POST['password'] = '123456';
    ob_start();
    include './login.php';
    $output = ob_get_clean();
    $this->assertStringContainsString('Đăng nhập thành công!', $output);

    // Clean up the database
    $sql = "DELETE FROM user WHERE username = '$expectedUsername'";
    execute($sql);

    // Test case 3: Test with incorrect username and password
    $_POST['username'] = 'invalid';
    $_POST['password'] = 'invalid';
    ob_start();
    include './login.php';
    $output = ob_get_clean();
    $this->assertStringContainsString('Tài khoản và mật khẩu không chính xác !', $output);
  }
}
