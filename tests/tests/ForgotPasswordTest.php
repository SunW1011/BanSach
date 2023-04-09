<?php
require_once './vendor/autoload.php';
use PHPUnit\Framework\TestCase;

class ForgotPasswordTest extends TestCase {
  public function testResetPasswordWithValidUsername() {
    $expectedUsername = 'test user';
    $expectedEmail = 'testuser@example.com';

    // Insert test user into database
    $sql = "INSERT INTO user (username, email, password) VALUES ('$expectedUsername', '$expectedEmail', 'password')";
    execute($sql);

    // Test case 1: Reset password with valid username
    $_POST['username'] = $expectedUsername;
    ob_start();
    include './forgot_password.php';
    $output = ob_get_clean();
    $this->assertStringContainsString('Yêu cầu đặt lại mật khẩu thành công!', $output);

    // Clean up the database
    $sql = "DELETE FROM user WHERE username = '$expectedUsername'";
    execute($sql);
  }

  public function testResetPasswordWithInvalidUsername() {
    // Test case 2: Reset password with invalid username
    $_POST['username'] = 'invalid_username';
    ob_start();
    include './forgot_password.php';
    $output = ob_get_clean();
    $this->assertStringContainsString('Tài khoản không tồn tại', $output);
  }

  public function testResetPasswordWithValidConfirmationCode() {
    // Insert test user into database
    $sql = "INSERT INTO user (username, email, password, confirmation_code) VALUES ('test user', 'testuser@example.com', 'password', '123456')";
    execute($sql);

    // Test case 3: Reset password with valid confirmation code
    $_POST['username'] = 'test user';
    $_POST['confirmation_code'] = '123456';
    $_POST['new_password'] = 'new_password';
    ob_start();
    include './reset_password.php';
    $output = ob_get_clean();
    $this->assertStringContainsString('Đặt lại mật khẩu thành công', $output);

    // Clean up the database
    $sql = "DELETE FROM user WHERE username = 'test user'";
    execute($sql);
  }

  public function testResetPasswordWithInvalidConfirmationCode() {
    // Insert test user into database
    $sql = "INSERT INTO user (username, email, password, confirmation_code) VALUES ('test user', 'testuser@example.com', 'password', '123456')";
    execute($sql);

    // Test case 4: Reset password with invalid confirmation code
    $_POST['username'] = 'test user';
    $_POST['confirmation_code'] = 'invalid_code';
    $_POST['new_password'] = 'new_password';
    ob_start();
    include './reset_password.php';
    $output = ob_get_clean();
    $this->assertStringContainsString('Mã xác nhận không hợp lệ', $output);

    // Clean up the database
    $sql = "DELETE FROM user WHERE username = 'test user'";
    execute($sql);
  }
}