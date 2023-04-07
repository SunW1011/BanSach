<?php
include "connect.php";


use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

  $email = $_POST['email'];
  $query = 'SELECT * FROM `user` WHERE `email` = "'.$email.'"';
  $data = mysqli_query($conn, $query);
  $result = array();
  while ($row = mysqli_fetch_assoc($data)) {
      $result[] = ($row);
      # code...
  }

    if(empty($result)){
        $arr = [
            'success' => false,
            'message' => "Mail không chính xác",
            'result' => $result
        ];
    }else{
        //send mail
        $email=($result[0]["email"]);
        $pass=($result[0]["pass"]);

        $link="<a href='http://localhost/bandoan/reset_pass.php?key=".$email."&reset=".$pass."'>Click To Reset password</a>";
        //require_once('phpmail/PHPMailerAutoload.php');
        $mail = new PHPMailer();
        $mail->CharSet = "utf-8";
        $mail->IsSMTP();
        // enable SMTP authentication
        $mail->SMTPAuth = true;                  
        // GMAIL username
        $mail->Username = "nhatvobh2001@gmail.com";
        // GMAIL password
        $mail->Password = "ojzcegbqsqwkbufg"; //pass cua mail
        $mail->SMTPSecure = "ssl";  
        // sets GMAIL as the SMTP server
        $mail->Host = "smtp.gmail.com";
        // set the SMTP port for the GMAIL server
        $mail->Port = "465";
        $mail->From = "nhatvobh2001@gmail.com"; //mail nguoi nhan
        $mail->FromName='Books Shop Online';
        $mail->AddAddress($email, 'reciever_name');
        $mail->Subject  =  'Reset Password';
        $mail->IsHTML(true);
        $mail->Body    = $link;
        if($mail->Send())
        {
          $arr = [
            'success' => true,
            'message' => "Mail đã gửi về tài khoản! Vui lòng kiểm tra!",
            'result' => $result
          ];
        }
        else
        {
          $arr = [
            'success' => false,
            'message' => "Gửi mail không thành công",
            'result' => $mail->ErrorInfo
          ];
        }
    }
    print_r(json_encode($arr));



?>