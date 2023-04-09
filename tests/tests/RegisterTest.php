<?php
require_once './vendor/autoload.php';
use PHPUnit\Framework\TestCase;

class RegisterTest extends TestCase {
  public function testRegister() {
    $expectedUsername = 'user123';
    $expectedPassword = '123456';
    $expectedFullName = 'User 123';

    // Test case 1: Test with correct registration information
    $_POST['username'] = $expectedUsername;
    $_POST['password'] = $expectedPassword;
    $_POST['full_name'] = $expectedFullName;
    ob_start();
    include './register.php';
    $output = ob_get_clean();
    $this->assertStringContainsString('Đăng ký thành công!', $output);

    // Clean up the database
    $sql = "DELETE FROM user WHERE username = '$expectedUsername'";
    execute($sql);

    // Test case 2: Test with existing username
    $sql = "INSERT INTO user (username, password, full_name) VALUES ('$expectedUsername', 'password', 'User')";
    execute($sql);
    $_POST['username'] = $expectedUsername;
    $_POST['password'] = $expectedPassword;
    $_POST['full_name'] = $expectedFullName;
    ob_start();
    include './register.php';
    $output = ob_get_clean();
    $this->assertStringContainsString('Tên đăng nhập đã tồn tại!', $output);

    // Clean up the database
    $sql = "DELETE FROM user WHERE username = '$expectedUsername'";

    // Test case 3: Test with weak password
    $_POST['username'] = 'newuser';
    $_POST['password'] = 'weak';
    $_POST['full_name'] = $expectedFullName;
    ob_start();
    include './register.php';
    $output = ob_get_clean();
    $this->assertStringContainsString('Mật khẩu phải có ít nhất 6 ký tự và chứa ít nhất 1 chữ cái và 1 số!', $output);

    // Test case 4: Test with missing registration information
    $_POST['username'] = '';
    $_POST['password'] = '';
    $_POST['full_name'] = '';
    ob_start();
    include './register.php';
    $output = ob_get_clean();
    $this->assertStringContainsString('Vui lòng nhập đầy đủ thông tin!', $output);
  }
}
