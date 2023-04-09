<?php
require_once(__DIR__ . '/../database/config.php');
require_once(__DIR__ . '/../database/dbhelper.php');
use PHPUnit\Framework\TestCase;

class LoginTest extends TestCase
{
    public function testLoginSuccess()
    {
        $con = mysqli_connect(HOST, USERNAME, PASSWORD, DATABASE);
        $username = 'admin123';
        $password = '123456';
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);
        $sql = "INSERT INTO user (username, password) VALUES ('$username', '$hashed_password')";
        mysqli_query($con, $sql);
        ob_start();
        $_POST["username"] = $username;
        $_POST["password"] = $password;
        include __DIR__ . '../../login/login.php';
        $output = ob_get_clean();
        $this->assertStringContainsString('Đăng nhập Admin thành công!', $output);
        $this->assertArrayHasKey('username', $_COOKIE);
        $this->assertArrayHasKey('password', $_COOKIE);
        $this->assertEquals($username, $_COOKIE['username']);
        $this->assertEquals($password, $_COOKIE['password']);
    }

    public function testLoginFailure()
    {
        $con = mysqli_connect(HOST, USERNAME, PASSWORD, DATABASE);
        $username = 'user123';
        $password = '123456';
        $hashed_password = password_hash($password, PASSWORD_DEFAULT);
        $sql = "INSERT INTO user (username, password) VALUES ('$username', '$hashed_password')";
        mysqli_query($con, $sql);
        ob_start();
        $_POST["username"] = $username;
        $_POST["password"] = 'wrongpassword';
        include __DIR__ . '../../login/login.php';
        $output = ob_get_clean();
        $this->assertStringContainsString('Tài khoản và mật khẩu không chính xác !', $output);
        $this->assertArrayNotHasKey('username', $_COOKIE);
        $this->assertArrayNotHasKey('password', $_COOKIE);
    }
}