<?php
require_once('../database/dbhelper.php');

?>
<!DOCTYPE html>
<html>

<head>
    <title>Quản Lý Người Dùng</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>

<style>
    table, td, th {
  border: 1px solid black;
}

table {
  border-collapse: collapse;
  width: 50%;
}
    </style>

<body>
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" href="../index.php">Thống kê</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="../user/">Quản lý người dùng</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../category/">Quản lý danh mục</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../product/">Quản lý sản phẩm</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="../dashboard.php">Quản lý giỏ hàng</a>
        </li>
    </ul>
    <div class="container">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h2 class="text-center">Quản lý Người Dùng</h2>
            </div>
            <div class="panel-body"></div>
            <a href="add.php">
                <button class=" btn btn-success" style="margin-bottom:20px">Thêm người dùng</button>
            </a>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <td width="70px">STT</td>
                        <td>Tên Người Dùng</td>
                        <td width="50%"> Họ tên </td>
                        <td>Password</td>
                        
                        <td>Phone</td>
                        <td>Email</td>
                        
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // Lấy danh sách người dùng
                    $sql = "SELECT * FROM `user`";
                    $userList = executeResult($sql);
                    $index = 1;
                    foreach ($userList as $item) {
                        echo '  <tr>
                    <td>' . ($index++) . '</td>
                    <td>' . $item['username'] . '</td>
                    <td>' . $item['hoten'] . '</td>
                    <td>' . $item['password'] . '</td>
                    <td>' . $item['phone'] . '</td>
                    <td>' . $item['email'] . '</td>
                    <td>
                        <a href="add.php?id=' . $item['id_user'] . '">
                            <button class=" btn btn-warning">Sửa</button> 
                        </a> 
                    </td>
                    <td>            
                    <button class="btn btn-danger" onclick="deleteCategory('.$item['id_user'].')">Xoá</button>
                    </td>
                </tr>';
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
    </div>
    <script type="text/javascript">
		function deleteUser(id_user) {
			var option = confirm('Bạn có chắc chắn muốn xoá người dùng này không?')
			if(!option) {
				return;
			}
			console.log(id_user)
			$.post('ajax.php', {
				'id': id_user,
				'action': 'delete'
			}, function(data) {
				location.reload()
			})
		}
	</script>
    
</body>


</html>