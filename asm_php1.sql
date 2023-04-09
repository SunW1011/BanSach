-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 08, 2023 lúc 03:36 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `asm_php1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Sách Giáo Dục', '2023-03-06 17:41:08', '2023-03-26 06:08:20'),
(2, 'Sách chính trị - pháp luật', '2023-03-06 17:41:08', '2023-03-26 06:27:21'),
(3, 'Sách thiếu nhi', '2023-03-06 17:41:08', '2023-03-26 06:39:21'),
(38, 'Sách truyện, tiểu thuyết', '2023-03-06 17:41:08', '2023-04-01 03:25:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address` varchar(200) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `fullname`, `phone_number`, `email`, `address`, `note`, `order_date`) VALUES
(143, 'Nguyễn Đăng Thành', '0387578520', 'bossryo68a@gmail.com', '68.65.120.213, viet nam', '', '2023-03-06 17:41:08'),
(144, 'DEMO', '03875723232', 'DEMO@gmail.com', 'DEMO', 'DEMO', '2023-03-06 17:41:08'),
(145, 'Võ Xuân Nhật', '+84969463459', 'NhatVoBH22230@gmail.com', '127 nguyễn Tư Giản, P.12, Q. Gò Vấp, Tp. Hồ Chí Minh', 'agvzdẹttr', '2023-03-06 17:41:08'),
(146, 'Võ Xuân Nhật', '+84348651011', 'NhatVoBH2001@gmail.com', '127 Nguyễn Tư Giản, P. 12, Q. Gò Vấp', '', '2023-03-06 17:41:08'),
(147, 'đấ', 'ádasdas', 'dasdas@gmail.com', 'dấdas', 'ádasdasdas', '2023-04-01 03:50:30'),
(148, 'Trung Nguyen', '0213456789', '123123@gmail.com', 'dấdsadsadwaddaw', 'fkslfjsflkj', '2023-04-01 05:02:51'),
(149, 'nguyen', '41231242', 'trungnguyen14569@gmail.com', 'dawddaw', 'giao nhanh len', '2023-04-02 11:03:31'),
(150, 'nguyen', '41231242', 'trungnguyen14569@gmail.com', '1213456', '3cuon', '2023-04-05 06:29:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `price` float NOT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `id_user`, `num`, `price`, `status`) VALUES
(149, 143, 2, 7, 3, 35000, 'Đã hủy'),
(150, 143, 4, 7, 1, 25000, 'Đã hủy'),
(151, 143, 12, 7, 1, 30000, 'Đã hủy'),
(152, 143, 14, 7, 1, 35000, 'Đã hủy'),
(153, 144, 12, 8, 11, 30000, 'Đã nhận hàng'),
(154, 145, 12, 59, 1, 30000, 'Đang chuẩn bị'),
(155, 146, 4, 59, 1, 25000, 'Đang chuẩn bị'),
(156, 147, 2, 7, 2, 7500, 'Đang chuẩn bị'),
(157, 148, 1, 7, 1, 10000, 'Đang chuẩn bị'),
(158, 148, 16, 7, 1, 90000, 'Đang chuẩn bị'),
(159, 149, 2, 60, 2, 7500, 'Đã nhận hàng'),
(160, 149, 8, 60, 3, 10000, 'Đã nhận hàng'),
(161, 150, 1, 59, 1, 10000, 'Đang giao'),
(162, 150, 2, 59, 1, 7500, 'Đang giao'),
(163, 150, 12, 59, 1, 180000, 'Đang giao');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `number` float NOT NULL,
  `thumbnail` varchar(500) NOT NULL,
  `content` longtext NOT NULL,
  `id_category` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `title`, `price`, `number`, `thumbnail`, `content`, `id_category`, `created_at`, `updated_at`) VALUES
(1, 'Sách Lịch Sử lớp 11', 10000, 20, 'uploads/lich su 11.jpg', '<p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; line-height: 44px; padding: 0px;\"><span style=\"color: rgb(0, 0, 0);\">Sách lịch sử lớp 11</span><br></p>', 1, '2023-03-06 17:41:08', '2023-03-26 06:21:51'),
(2, 'Sách âm nhạc và mỹ thuật 9', 7500, 50, 'uploads/am nhac & mi thuat 9.jpg', '<font color=\"#000000\">Sách âm nhạc và mỹ thuật lớp 9</font><br>', 1, '2023-03-06 17:41:08', '2023-03-26 06:02:53'),
(4, 'Chuyện ma ám ở trang viên', 54000, 30, 'uploads/chuyen ma am o trang vien bly.jpg', '<p class=\"rtejustify\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-family: Roboto; font-size: 14px; color: rgb(51, 51, 51); letter-spacing: 0.5px;\"><em>“Tôi nhớ rằng mọi chuyện bắt đầu với một loạt thăng trầm trong cảm xúc, một chút bấp bênh của hồi hộp lo sợ...”</em></p><p class=\"rtejustify\" style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; font-family: Roboto; font-size: 14px; color: rgb(51, 51, 51); letter-spacing: 0.5px;\">Một cô gái trẻ nhận được công việc đầu tiên trong đời là làm gia sư cho hai đứa trẻ xinh đẹp, trong sáng và lặng lẽ đến dị thường tại toà dinh thự Bly cô độc, bị bủa vây trong cái ác rình rập.<br>Những bóng người ẩn hiện từ toà tháp tối tăm và ô cửa sổ bụi bặm, các bóng ma xấu xa lặng lẽ tiến đến ngày một gần. Với nỗi kinh hoàng lớn dần, cô gia sư bất lực nhận ra những sinh vật tàn ác đó nhắm đến bọn trẻ, rắp tâm xâm chiếm cơ thể, tâm trí và cả linh hồn các em…<br>Nhưng không ai ngoài cô nhìn thấy những bóng ma ấy. Phải chăng những ám ảnh kia được gợi lên từ chính trí tưởng tượng của cô gia sư, hay sự thật còn chứa đựng nhiều hơn thế?</p>', 38, '2023-03-06 17:41:08', '2023-03-26 07:37:11'),
(5, 'Sách chính trị luận', 170000, 10, 'uploads/chinh-tri-luan-outline-28-2-2018-01.jpg', '<span style=\"color: rgb(12, 12, 12); font-family: Roboto, Montserrat, Arial, sans-serif; font-size: 14px;\">Chính trị luận Đây là cuốn sách đầu tiên của Aristotle được xuất bản ở Việt Nam, nhưng sức ảnh hưởng từ những tư tưởng, luận điểm cũng như những di bút thông thái khác của ông đã trở thành nền tảng chế ngự tư tưởng Châu Âu suốt hơn 2000 năm qua. “Chính trị luận” của Aristotle là một tác phẩm nổi tiếng nhất nói về các khái niệm mà từ đó các quốc gia và chính phủ định hình. Mặc dù chỉ thảo luận về nhà nước và các định chế thời Hy Lạp cổ đại nhưng tác phẩm này của ông đã đặt nền tảng cho khoa học chính trị hiện đại.</span><br>', 2, '2023-03-06 17:41:08', '2023-03-26 07:53:29'),
(8, 'Sách Đại Số 10', 10000, 100, 'uploads/dai so 10.jpg', '<p><span style=\"color: rgb(0, 0, 0); font-family: \" times=\"\" new=\"\" roman\";=\"\" font-size:=\"\" 20px;=\"\" font-weight:=\"\" 700;=\"\" text-align:=\"\" center;\"=\"\">Sách đại số lớp 10</span><br></p>', 1, '2023-03-06 17:41:08', '2023-04-01 03:41:53'),
(9, 'Sách Hình học 10', 15000, 60, 'uploads/hinh hoc 10.jpg', '<p>Sách hình học lớp 10<br></p>', 1, '2023-03-06 17:41:08', '2023-04-01 03:55:54'),
(10, 'Lá Thu', 50000, 44, 'uploads/la thu.jpg', '<p class=\"MsoNormal\" style=\"margin-bottom: 11.25pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#3D3D3D;mso-font-kerning:0pt;\r\nmso-ligatures:none\">Lam thân cô thế cô chống chọi với gã chồng vô trách nhiệm\r\ncùng ả nhân tình đầy mưu kế. Ả nhân tình mười tám tuổi đã tham vọng cướp chồng\r\nngười, muốn đẩy mẹ con Lam tay trắng ra đường. Vì con, vì mình Lam không thể\r\nkhông đứng ra chống đở.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-bottom: 11.25pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#3D3D3D;mso-font-kerning:0pt;\r\nmso-ligatures:none\">Nếu như chỉ mình ả nhân tình có thể Lam sẽ không mệt mỏi,\r\nnhưng cô ta còn có sự chống lưng của lão chồng vô tâm vô trách nhiệm của lam,\r\ncùng người nhà chồng cô. Họ như muốn dồn mẹ con Lam vào ngõ cụt. Cướp đất, cướp\r\nnhà, nay còn muốn cướp cả con và cháu của Lam. Làm sao cô có thể để yên được cơ\r\nchứ.<o:p></o:p></span></p><p>\r\n\r\n\r\n\r\n<span style=\"font-size:12.0pt;line-height:107%;font-family:&quot;Times New Roman&quot;,serif;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#3D3D3D;mso-font-kerning:0pt;\r\nmso-ligatures:none;mso-ansi-language:EN-US;mso-fareast-language:EN-US;\r\nmso-bidi-language:AR-SA\">Nhưng tại sao con trai Lam lại đứng về phía ả nhân\r\ntình trơ trẻn độc ác kia chống lại cô? Nỗi đau này chồng nỗi đau khác họ đây là\r\nmuốn cô rơi vào tận cùng nỗi tuyệt vọng hay sao? Ai đó hãy kéo Lam ra khỏi vũng\r\nbùn nhầy nhụa này có được không?</span><br></p>', 38, '2023-03-06 17:41:08', '2023-04-01 03:21:59'),
(12, 'Trăng Lên', 180000, 30, 'uploads/trang len.jpg', '<p><span style=\"font-size:12.0pt;line-height:107%;\r\nfont-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;\r\ncolor:#3D3D3D;mso-font-kerning:0pt;mso-ligatures:none;mso-ansi-language:EN-US;\r\nmso-fareast-language:EN-US;mso-bidi-language:AR-SA\">Trăng Lên - Tiểu Thuyết\r\nViết Về Cuộc Chiến Tranh Vệ Quốc Vĩ Đại Của Dân Tộc là một ví dụ về sự trở lại\r\ncủa đề tài truyền thống trên văn đàn. Cuốn tiểu thuyết được đặt trong bối cảnh\r\nmột vùng quê chịu sự chia cắt bởi hai cuộc chiến. Sau cuộc kháng chiến chống\r\nPháp thành công, giành lại hòa bình, vùng quê ấy lại âm thầm chịu đựng đau\r\nthương bởi sự chia cắt giữa đôi bờ Nam - Bắc.</span><br></p>', 38, '2023-03-06 17:41:08', '2023-04-01 04:51:04'),
(13, 'Lý Luận Về Tôn Giáo Và Chính Sách Tôn Giáo Ở Việt Nam', 100000, 35, 'uploads/7fb29ec9a5b279ec20a3.jpg', '<p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Trong quá trình vận động\r\ncách mạng và quản lý, điều hành đất nước, Đảng và Nhà nước luôn quan tâm đến\r\ntôn giáo và có chính sách phù hợp đối với tôn giáo trong từng thời kỳ cách mạng,\r\ntrên căn bản tôn trọng và bảo đảm quyền tự do tín ngưỡng, tôn giáo của nhân\r\ndân. Việt Nam là một quốc gia đa dạng về loại hình tín ngưỡng, tôn giáo và nhiều\r\nngười theo tín ngưỡng, tôn giáo. Nếu tính cả tín ngưỡng và tôn giáo, Việt Nam\r\ncó đến trên 90% dân số có tín ngưỡng và tôn giáo, trong đó có 24 triệu tín đồ\r\ncác tôn giáo, chiếm 27% dân số. Trong quá trình vận động cách mạng và quản lý,\r\nđiều hành đất nước, Đảng và Nhà nước luôn quan tâm đến tôn giáo và có chính\r\nsách phù hợp đối với tôn giáo trong từng thời kỳ cách mạng, trên căn bản tôn trọng\r\nvà bảo đảm quyền tự do tín ngưỡng, tôn giáo của nhân dân.<o:p></o:p></span></p>', 2, '2023-03-06 17:41:08', '2023-04-01 04:22:31'),
(14, 'Tinh Thần Pháp Luật', 140000, 50, 'uploads/5153e409d7720b2c5263.jpg', '<p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Bàn về tinh thần pháp luật\r\nlà tuyệt tác triết học của Montesquieu, là một trong những tác phẩm vĩ đại\r\ntrong lịch sử triết học chính trị và trong lịch sử luật học. Mục đích cuốn\r\nsách, như chính tác giả đã nêu, là: Trình bày những nguyên nhân quyết định nền\r\npháp lý cho mỗi quốc gia; trình bày sự phù hợp cần thiết giữa luật lệ và chế độ\r\ncai trị của một nước; trình bày những quan hệ giữa các luật lệ với nhau. Ông đã\r\nphải mất gần 20 năm cho tác phẩm này.Bàn về tinh thần pháp luật của Montesquieu\r\ncùng với Bàn về Khế ước xã hội của Rousseau được coi là bộ đôi tác phẩm “xây dựng\r\nlý thuyết về xã hội công dân và nhà nước pháp quyền, dẫn tới cuộc Đại cách mạng\r\nPháp 1789”.<o:p></o:p></span></p>', 2, '2023-03-06 17:41:08', '2023-04-01 04:08:34'),
(16, 'Thỏ Bảy Màu Và Những Người Nghĩ Nó Là Bạn', 90000, 30, 'uploads/9786043561272_1_1.jpg', '<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;line-height:107%;font-family:\r\n&quot;Times New Roman&quot;,serif\">Cuốn sách là những mẩu chuyện nhỏ được ghi lại bằng\r\ntranh xoay quanh Thỏ Bảy Màu và những người nghĩ nó là bạn. Những mẩu chuyện được\r\ntruyền tải rất “teen” đậm chất hài hước, châm biếm qua sự sáng tạo không kém phần\r\n“mặn mà” của tác giả càng trở nên độc đáo và thu hút. Nếu một ngày bạn lỡ cảm\r\nthấy buồn thì hãy đọc cuốn sách này để biết thế nào là cười sảng nha!<o:p></o:p></span></p>', 3, '2023-03-06 17:41:08', '2023-04-01 04:01:17'),
(17, 'Pháp Luật Đại Cương', 45000, 20, 'uploads/c9418219b1626d3c3473.jpg', '<p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Nhằm góp phần phục vụ\r\ncông tác đào tạo, bồi dưỡng những kiến thức cơ bản về nhà nước và pháp luật cho\r\nhọc sinh, sinh viên; cung cấp thêm tài liệu nghiên cứu, tham khảo cho giảng\r\nviên các trường đại học, cao đẳng, trung học chuyên nghiệp, Nhà xuất bản Chính\r\ntrị quốc gia – Sự thật xuất bản cuốn sách PHÁP LUẬT ĐẠI CƯƠNG do Tiến sĩ, Luật\r\nsư Lê Minh Toàn chủ biên.<o:p></o:p></span></p>', 2, '2023-03-06 17:41:08', '2023-04-01 04:15:28'),
(18, 'Sách Ngữ Văn 10', 12000, 60, 'uploads/ngu van 10.jpg', '<p><font color=\"#000000\">Sách Ngữ Văn lớp 10</font><br></p><p><br></p>', 1, '2023-03-06 17:41:08', '2023-04-01 04:14:19'),
(19, 'Sách Ngữ Văn 11', 15000, 46, 'uploads/ngu van 11.jpg', '<p>Sách Ngữ Văn lớp 11<br></p>', 1, '2023-03-06 17:41:08', '2023-04-01 04:36:20'),
(20, 'Sách Ngữ Văn 12', 15000, 44, 'uploads/ngu van 12.jpg', '<p><span style=\"color: rgb(83, 56, 44); font-family: \" open=\"\" sans\",=\"\" sans-serif;=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" justify;\"=\"\">Sách Ngữ Văn lớp 12</span><br></p>', 1, '2023-03-06 17:41:08', '2023-04-01 04:04:21'),
(21, 'Trời sinh một cặp', 80000, 25, 'uploads/troi sinh 1 cap.jpg', '<p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">“Bức thư gửi tới quý cô\r\nNgưu Ma Vương<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Xin chào, cô nhóc!<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Bức thư này anh vốn định\r\nchờ tới năm tám mươi tuổi rồi mới viết cho em, lúc ấy em ngồi tựa người trên\r\nchiếc ghế bập bênh, nheo mắt lại tắm nắng, bảo anh đọc thư cho em nghe. Sau đó\r\nanh sẽ đeo kính lão lên, mở thư ra, hắng giọng một cái, bắt đầu đọc… “Bức thư gửi\r\ntới quý cô Ngưu Ma Vương”. Em nói xem, liệu lúc đó em có nhảy bật dậy khỏi chiếc\r\nghế bập bênh mà đánh anh một trận không nhỉ?<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Anh thật mong chúng ta có\r\nthể luôn vui đùa, trêu chọc nhau một mạch cho tới năm bảy, tám mươi tuổi. Anh sẽ\r\ntức giận, em sẽ hờn dỗi, anh sẽ kể những câu chuyện cười cũ kĩ đến nỗi đám cún\r\ncũng chẳng nghe lọt tai, còn em thì luôn rất phối hợp với anh mà cười vang ha hả.\r\nAnh cảm thấy trên thế giới này chỉ có một mình anh chịu đựng được những phen chọc\r\ncười ngớ ngẩn của em mà thôi. Còn nữa, xem những câu chuyện mà em viết về việc\r\n“anh ức hiếp em” trong cuốn sách này, anh bất giác cảm thấy lúc đó mình phát\r\nhuy còn chưa được tốt lắm…<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Nói ra thì đúng là kỳ lạ,\r\ntrước đây chí hướng của anh rất lớn lao, nhưng sau mười năm ở bên cạnh em, anh\r\nbỗng cảm thấy, nếu cả đời có thể chung sống với em thì cũng đã là một niềm vinh\r\nhạnh to lớn tột cùng.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Em không biết làm cơm,\r\nnhưng mỗi buổi tối anh phải tăng ca, em luôn ở nhà chờ anh với một nồi cháo\r\nnóng hổi.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Em không biết đan áo len,\r\nnhưng mỗi dịp trước khi đông về, em luôn đan sẵn một chiếc khăn quàng cổ siêu xấu,\r\nmang lại cho anh một gánh nặng ngọt ngào.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Em không giỏi trang điểm,\r\nnhưng em luôn rèn luyện kỹ năng chuốt mascara và đánh má hồng trên mặt anh…<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Anh nghĩ suốt cuộc đời\r\nnày em sẽ còn chê bai anh về đôi tất thối, thêm một quả trứng luộc vào trong hộp\r\ncơm của anh, trách anh về việc không thích leo núi, dậy sớm trước anh mười phút\r\nđể làm bữa sáng cho anh. Còn nữa, đó là suốt cuộc đời này em sẽ luôn ở bên cạnh\r\nanh.<o:p></o:p></span></p><p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Nếu năm chúng ta tám mươi\r\ntuổi thật sự có một ngày như thế, một ngày mà em không còn gặm nổi ngô, không\r\nthể nghe rõ những lời thì thầm của anh, cũng không thể chạy như bay về phía anh\r\nrồi nhào vào lòng anh nữa, em đừng sợ, vì em mãi mãi là cô nhóc trong lòng anh.<o:p></o:p></span></p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Thật đấy, anh chưa bao giờ\r\nlà một gã thông minh, dũng cảm và có thiên phú hơn người, nhưng kể từ khi có\r\nem, anh cảm thấy mình dường như đã có cả thế giới.<o:p></o:p></span></p>', 38, '2023-03-06 17:41:08', '2023-04-01 04:07:54'),
(26, 'Pháp luật cho mọi gia đình', 60000, 100, 'uploads/88ba36e0059bd9c5808a.jpg', '<p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Nhà nước ta là Nhà nước\r\npháp quyền xã hội chủ nghĩa của nhân dân, do nhân dân, vì nhân dân. Một trong\r\nnhững yêu cầu quan trọng của Nhà nước pháp quyền nói chung, cũng như Nhà nước\r\npháp quyền xã hội chủ nghĩa nói riêng là quản lý đất nước và xã hội bằng pháp\r\nluật. Pháp luật là nền tảng của Nhà nước pháp quyền, là công cụ quản lý nhà nước.\r\nPháp luật thể chế hóa chủ trương, đường lối của Đảng để bảo đảm quyền tự do,\r\ndân chủ của nhân dân, bảo đảm công bằng, tiến bộ xã hội, bảo vệ chế độ, bảo vệ\r\nchính quyền nhân dân. Thực hiện Đề án trang bị sách dành cho cơ sở xã, phường,\r\nthị trấn năm 2012, Nhà xuất bản Chính trị quốc gia - Sự thật phối hợp với Nhà\r\nxuất bản Văn hóa dân tộc xuất bản cuốn sách Pháp luật cho mọi gia đình, do PGS.\r\nTS. Trần Minh Hưởng biên soạn. Nội dung cuốn sách gồm 86 câu hỏi - trả lời về\r\ncác quan hệ pháp luật phát sinh trong cuộc sống hằng ngày của mỗi cá nhân, mỗi\r\ngia đình với cộng đồng.<o:p></o:p></span></p>', 2, '2023-03-06 17:41:08', '2023-04-01 04:34:24'),
(28, 'Dog Man', 250000, 50, 'uploads/9781338741032.jpg', '<p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Dog Man là bộ truyện\r\ntranh hót hòn họt của tác giả cùng bộ truyện Captain Underpants Dav Pikey (\r\nsiêu nhân quần chip). Đây là bộ sách bán chạy SỐ 1 tại New York. Với câu văn ngắn\r\ngọn, bày trí hài hoà, bắt mắt, từ vựng dễ hiểu – chủ yếu sử dụng trong văn nói\r\nthường ngày, đặc biệt là sách bìa cứng giúp các bạn nhỏ giữ được bộ sách mới\r\nlâu hơn.<o:p></o:p></span></p>', 3, '2023-03-06 17:41:08', '2023-04-01 04:49:56'),
(29, 'Pinocchio', 180000, 65, 'uploads/9780141331645.jpg', '<p class=\"MsoNormal\" style=\"margin-left:.5in\"><span style=\"font-size:12.0pt;\r\nline-height:107%;font-family:&quot;Times New Roman&quot;,serif\">Chắc hẳn ai cũng đã từng\r\nnói dối đúng không nào? Khi đó bạn có sợ người khác biết? Nếu cứ mỗi lần nói dối\r\nlà chiếc mũi của bạn lại dài ra thì bạn sẽ xử lý như thế nào? Pinocchio là câu\r\nchuyện mang tính nhân văn, kể về cậu bé người gỗ tên Pinocchio. Câu chuyện phù\r\nhợp và không chỉ dành riêng cho những đứa trẻ mà còn cho người lớn. Câu chuyện\r\nnhắc nhở mọi người sâu sắc về tính thật thà. Hãy sống đúng với bản thân mình, đừng\r\nnói dối ai. Hãy thay đổi bản thân mình và từ đó bỏ việc hay nói dối người khác.\r\nLuôn luôn cố gắng nói sự thật dù điều đó có tồi tệ đến đâu. Nếu một lần nói dối,\r\nhai lần nói dối thì cả đời sẽ nói dối. Nếu chúng ta cứ mãi như vậy thì một khi\r\nbị phát hiện mọi chuyện sẽ trở nên vô cùng phức tạp.<o:p></o:p></span></p>', 3, '2023-03-06 17:41:08', '2023-04-01 04:46:58'),
(30, 'Yêu anh hơn cả tử thần', 62000, 100, 'uploads/yeu anh hon ca tu than.jpg', '<p class=\"MsoNormal\"><span style=\"font-size:12.0pt;line-height:107%;font-family:\r\n&quot;Times New Roman&quot;,serif\">Mễ Bối vốn là Đào Hoa Tiên Nữ trên thiên giới, nàng so\r\nvới các thần tiên khác còn được trọng vọng hơn vài phần vì là vị hôn thê sớm đã\r\ncó ước hẹn với Cửu Hoàng Tử của Ngọc Đế. Nhiều năm trước, dịp mùng bảy tháng Bảy,\r\nlúc hóa thân làm chim khách bắc cầu qua sông Ngân Hà để Ngưu Lang – Chức Nữ gặp\r\nnhau, Mễ Bối vì mải ngắm nhìn đôi tình nhân gặp nhau quyến luyến đến rơi lệ nên\r\nvỗ cánh loạn nhịp, lảo đảo rơi xuống trần. Nàng bị gẫy cánh, máu chảy lênh\r\nláng, suýt chút nữa bị một con chó nhe răng xơi tái, may mà được cậu bé Mạc\r\nNgôn Hy cứu sống. Kể từ đó trong lòng Mễ Bối luôn cảm thấy biết ơn đối với Mạc\r\nNgôn Hy.<o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"font-size:12.0pt;line-height:107%;font-family:\r\n&quot;Times New Roman&quot;,serif\">Sau này vì vi phạm luật Thiên đình, Mễ Bối bị phạt xuống\r\ntrần, nhưng vì nàng có hôn ước với Cửu Hoàng Tử nên chỉ bị phạt “lịch kiếp”\r\ntrong hai mươi ngày, tương đương với hai mươi năm trần gian. Đồng thời, để ngăn\r\nnàng tiết lộ chuyện Thiên đình, Ngọc Đế đã biến Mế Bối thành người câm, cho trải\r\nqua những khổ ải trần gian.<o:p></o:p></span></p><p>\r\n\r\n\r\n\r\n</p><p class=\"MsoNormal\"><span style=\"font-size:12.0pt;line-height:107%;font-family:\r\n&quot;Times New Roman&quot;,serif\">Trong khi Cửu Hoàng Tử lưu luyến thì Mễ Bối lại coi\r\nhai mươi ngày xuống trần là cơ hội để nàng báo đáp ân nghĩa với ân nhân Mạc\r\nNgôn Hy.<o:p></o:p></span></p>', 38, '2023-03-06 17:41:08', '2023-04-01 05:22:01'),
(31, 'Tôi thấy hoa vàng trên cỏ xanh', 100000, 90, 'uploads/toi thay hoa vang tren co xanh.jpg', '<p class=\"MsoNormal\" style=\"margin-bottom: 11.25pt; line-height: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"><span style=\"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;\r\nmso-fareast-font-family:&quot;Times New Roman&quot;;color:#3D3D3D;mso-font-kerning:0pt;\r\nmso-ligatures:none\">Nội dung truyện nói vè tuổi thơ nghèo khó của hai anh em\r\nThiều và Tường ở một làng quê Việt thân thuộc và nên thơ. Là nơi đã chứng kiến\r\nnhững rung động đầu đời của cả hai, tình cảm gia đình, tình anh em yêu thương\r\nchân thành, cũng như những đố kỵ, ghen tuông và những nỗi đau trong veo trong\r\nquá trình trưởng thành.<br>\r\n<br>\r\nVới những ký ức đã từng qua, chuyện về con cóc Cậu trời, chuyện ma, chuyện công\r\nchúa và hoàng tử, bên cạnh chuyện đói ăn, cháy nhà, lụt lội, tác giả muốn tưởng\r\nnhớ về tuổi thơ lắm ngọt ngào lẫn day dứt mà mỗi người đều đã từng trải qua\r\nkhiến cho người đọc lại càng thấm đẫm tình yêu thương tuổi thơ của mình hơn.<o:p></o:p></span></p>', 38, '2023-03-06 17:41:08', '2023-04-01 04:49:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `hoten` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(28) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id_user`, `hoten`, `username`, `password`, `phone`, `email`) VALUES
(7, 'Võ Xuân Nhật', 'admin', 'admin', '+84387578520', 'bossryo68@gmail.com'),
(8, 'Võ Xuân Nhật', 'test', 'test', '0387578520', 'bossryo6811@gmail.com'),
(59, 'Võ Xuân Nhật', 'admin123', '123456', '0969463459', 'NhatVoBH22230@gmail.com'),
(60, 'nguyen', 'nguyen123', '123', '41231242', 'trungnguyen14569@gmail.com'),
(64, 'Võ Xuân Nhật', 'admin2', '$2y$10$QvvDGqOUkEv4o9IjHMXXK.CTtmJuELQwq2Sf1Q.qsRWDZg.mVS4Ee', '+84348651011', 'NhatVoBH2001@gmail.com');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
