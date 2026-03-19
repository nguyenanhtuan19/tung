-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 14, 2025 lúc 12:40 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `news-project`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(191) NOT NULL,
  `url` varchar(191) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `image`, `url`, `created_at`, `updated_at`) VALUES
(8, 'public/banner-image/2022-10-24-23-19-09.jpeg', 'http://localhost/OnlineNewsSite/', '2022-10-24 14:19:09', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(14, 'Công nghệ', '2022-10-24 09:26:37', '2025-02-20 23:57:22'),
(15, ' Kinh tế', '2022-10-24 09:36:05', '2025-02-20 23:57:52'),
(16, 'Thể thao', '2022-10-24 09:49:39', '2025-02-20 23:58:01'),
(17, 'Khoa học', '2022-10-24 10:00:18', '2025-02-20 23:58:06'),
(20, 'Chính trị', '2025-02-20 23:58:16', NULL),
(21, 'Thời sự', '2025-02-20 23:58:23', NULL),
(22, 'Đời sống', '2025-02-20 23:58:34', NULL),
(23, 'Sức khỏe', '2025-02-20 23:58:40', NULL),
(24, 'Giáo dục', '2025-02-21 00:11:04', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `post_id` int(11) NOT NULL,
  `status` enum('unseen','seen','approved') NOT NULL DEFAULT 'approved',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `comment`, `post_id`, `status`, `created_at`, `updated_at`) VALUES
(25, 2, 'wow', 22, 'approved', '2025-02-28 09:07:52', NULL),
(27, 2, 'Hay thế', 22, 'approved', '2025-02-28 09:16:53', '2025-02-28 09:24:43'),
(28, 14, 'Giá mà có tiền mua', 10, 'approved', '2025-02-28 09:21:54', NULL),
(29, 14, 'T chạy từ nhà ra đầu ngõ đứt hơi', 21, 'approved', '2025-02-28 10:21:33', NULL),
(30, 3, 'Tiền đâu mua tr', 11, 'approved', '2025-03-02 19:09:30', NULL),
(31, 14, 'Quá tuyệt vời', 26, 'approved', '2025-03-12 06:39:02', NULL),
(32, 14, ':0', 13, 'approved', '2025-03-12 06:44:30', NULL),
(33, 14, 'Giá mà có việc nhẹ lương cao', 11, 'approved', '2025-03-12 07:24:27', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Đang đổ dữ liệu cho bảng `media`
--

INSERT INTO `media` (`id`, `title`, `content`, `image_path`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Gọng kìm Nga-Mỹ : Ukraine buộc phải ký hòa bình?', 'Càng cố gắng, Ukraine càng bị siết chặt bởi gọng kìm từ Nga và Mỹ. Trong khi Mỹ tung đòn dừng viện trợ quân sự và tình báo, Nga không dừng đà tiến công trên mặt trận. Đòn “song cước” này liệu có phải đúng quy trình nằm thỏa thuận ngầm trước đó giữa Washington và Moskva buộc Kiev nghiêm túc đi đến hòa bình. Ukraine có thể chống đỡ được bao lâu nữa, khi mất đi đôi mắt tình báo phương Tây?', 'https://www.youtube.com/watch?v=D3IyJal-k70', 1, '2025-03-08 12:41:39', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(300) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `url`, `parent_id`, `created_at`, `updated_at`) VALUES
(9, 'most visited', '#', NULL, '2019-07-17 12:05:11', '2022-10-24 11:33:11'),
(12, 'about us ', 'http://localhost/OnlineNewsSite/', NULL, '2022-10-24 14:38:39', NULL),
(13, 'Home', 'http://localhost/OnlineNewsSite/', NULL, '2022-10-24 14:39:03', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `summary` text NOT NULL,
  `body` text NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `status` enum('disable','enable') NOT NULL DEFAULT 'disable',
  `selected` tinyint(5) NOT NULL DEFAULT 1,
  `breaking_news` tinyint(5) NOT NULL DEFAULT 1,
  `published_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `summary`, `body`, `view`, `user_id`, `cat_id`, `image`, `status`, `selected`, `breaking_news`, `published_at`, `created_at`, `updated_at`) VALUES
(10, 'Trải nghiệm sức mạnh \'thông minh\' trên Redmi Note 14 Pro', 'Smartphone tầm trung thường bị coi là kém chất lượng với camera tệ hay độ bền kém, nhưng mọi thứ thực sự thay đổi với Redmi Note 14 Pro. Đặc biệt, chiếc máy này đã trang bị nhiều tính năng AI (trí tuệ nhân tạo).', 'Với mức giá khoảng 9,49 triệu đồng, Redmi Note 14 Pro gần như nắm chắc vị trí ưu tiên trong phân khúc tầm trung nhờ nhiều điểm đáng chú ý.\r\n\r\nMàn hình và thiết kế\r\nMột trong những điểm mạnh chính của Redmi Note 14 Pro là màn hình. Với độ sáng tối đa lên đến 3.000 nit, điện thoại vượt trội hơn cả iPhone 16 chỉ có độ sáng tối đa 2.000 nit. Màn hình 6,67 inch độ phân giải 2.712 x 1.220 cho mật độ điểm ảnh ấn tượng mang lại khả năng hiển thị tốt, sống động và mượt mà, đặc biệt khi xem video.\r\n\r\nMặt sau của Redmi Note 14 Pro mang đến trải nghiệm hấp dẫn với ba tùy chọn màu sắc gồm Đen, Tím hoặc Xanh lá. Chất liệu mặt sau bằng da thuần chay không chỉ mềm mại mà còn tạo cảm giác thoải mái khi cầm nắm. Phần camera được thiết kế cân xứng tạo nên sự hài hòa cho tổng thể sản phẩm.\r\n\r\nĐộ bền pin ấn tượng\r\nRedmi Note 14 Pro được trang bị pin 5.110 mAh cho thời gian sử dụng khoảng 20 giờ trên mạng xã hội hoặc 15 giờ xem video. Trong quá trình sử dụng hằng ngày, thiết bị có thể hoạt động liên tục khoảng 1,5 ngày mà không cần sạc, con số ấn tượng cho một chiếc điện thoại tầm trung và đặc biệt nổi trội so với nhiều model iPhone hiện đại của Apple.\r\n\r\nKhông chỉ có vậy, Redmi Note 14 Pro còn hỗ trợ sạc nhanh 45W và có khả năng học thói quen sạc của người dùng để điều chỉnh điện áp, từ đó bảo vệ sức khỏe của pin. Tuy nhiên, lưu ý rằng thiết bị không đi kèm với sạc từ tính.\r\n\r\nCamera 200 MP mạnh mẽ\r\nChất lượng camera là một trong những yếu tố quan trọng mà người dùng thường cân nhắc khi chọn điện thoại. Họ sẵn sàng chi hàng chục triệu đồng cho một sản phẩm chủ yếu để tập trung vào khả năng chụp ảnh do nghĩ rằng sản phẩm dưới 10 triệu đồng sẽ không có chất lượng camera cao cấp. Nhưng mọi thứ đã khác với Redmi Note 14 Pro, sản phẩm cung cấp những bức ảnh chất lượng khá tốt, đặc biệt với camera chính 200 MP.\r\n\r\nVới cảm biến 200 MP, người dùng có thể sử dụng Chế độ 200 MP để chụp ảnh với chất lượng tốt ở độ phân giải đầy đủ. Tuy nhiên, người dùng cũng có thể lựa chọn chế độ ghép điểm ảnh để chụp những bức hình độ phân giải thấp hơn ở kích thước điểm ảnh lớn hơn, hữu ích trong các môi trường ánh sáng yếu.', 149, 1, 14, 'public/post-image/2025-02-21-01-47-12.jpeg', 'disable', 1, 1, '2025-02-24 15:03:20', '2025-02-24 15:03:20', '2025-02-24 15:03:20'),
(11, 'iPhone mới \'hút\' người dùng nâng cấp thiết bị nhanh hơn', 'Một nghiên cứu gần đây của Consumer Intelligence Research Partners (CIRP) cho thấy người dùng iPhone đang có xu hướng nâng cấp thiết bị nhanh hơn.', 'Trong quý 4/2024, 36% người mua iPhone đã sở hữu thiết bị trước đó trong 2 năm hoặc ít hơn, tăng từ 31% trong cùng kỳ năm 2023. Điều này cho thấy chu kỳ nâng cấp đang ngày càng ngắn lại khi nhiều người dùng chọn nâng cấp sớm hơn và ít người giữ iPhone trong 3 năm hoặc lâu hơn.\r\n\r\nCIRP chủ yếu nghiên cứu thị trường Mỹ, điều này có nghĩa những xu hướng này có thể không áp dụng mạnh mẽ ở các khu vực khác, nơi giá bán và tùy chọn nâng cấp có thể khác nhau. Một số yếu tố thúc đẩy sự thay đổi này bao gồm các giao dịch đổi máy và các tùy chọn tài chính hấp dẫn, đặc biệt từ các nhà mạng Mỹ. Nhiều khách hàng cảm thấy dễ dàng hơn khi mua iPhone mới sau mỗi 2 năm thay vì giữ lại một mẫu cũ.\r\n\r\nApple đang tận dụng lòng trung thành của người dùng iPhone\r\nKhi mà doanh số iPhone chậm lại, Apple đang tập trung vào việc duy trì lòng trung thành của khách hàng. Nhiều người chọn nâng cấp sớm là những người dùng trung thành của Apple, mong muốn sở hữu công nghệ mới nhất. Ngược lại, những người chờ đợi lâu hơn có thể đang tìm kiếm một tính năng mới quan trọng hoặc một chương trình khuyến mãi đặc biệt.\r\n\r\nLiên quan đến các tính năng trí tuệ nhân tạo (AI) mới của Apple, hệ thống AI này yêu cầu ít nhất một chiếc iPhone 15 Pro, trong khi các thiết bị cũ hơn không hỗ trợ các tính năng này. Tuy nhiên, vẫn chưa rõ liệu AI có ảnh hưởng lớn đến quyết định mua hàng hay không, đặc biệt trong bối cảnh chúng chưa thể hiện được nhiều.\r\n\r\nTrong khi người dùng trung thành iPhone sẵn sàng nâng cấp sản phẩm mới, Apple đang đối mặt với thách thức khi nhiều người giữ iPhone của họ trong nhiều năm do thiết bị vẫn hoạt động tốt. Để khuyến khích nâng cấp, công ty tập trung vào cải tiến camera, thời lượng pin và các tính năng AI nhằm làm cho các mẫu máy mới trở nên hấp dẫn hơn.\r\n\r\nNếu xu hướng nâng cấp nhanh hơn tiếp tục, chiến lược của Apple có thể đang phát huy tác dụng, biến iPhone mới thành thiết bị \"phải có\". Tuy nhiên, liệu xu hướng này có duy trì hay không vẫn là một dấu hỏi lớn.', 56, 1, 14, 'public/post-image/2025-02-21-01-48-48.jpeg', 'disable', 2, 1, '2025-02-24 15:03:18', '2025-02-24 15:03:18', '2025-02-24 15:03:18'),
(13, 'Bộ Tài chính lên tiếng về đề xuất đánh thuế lãi tiết kiệm', 'Trong xây dựng luật Thuế thu nhập cá nhân (thay thế), Bộ Tài chính đề nghị tiếp tục giữ nguyên quy định về miễn thuế thu nhập cá nhân đối với lãi tiền gửi tiết kiệm như hiện hành.', 'Hôm nay 20.2, Bộ Tài chính cho biết, tại hồ sơ đề nghị xây dựng dự án luật Thuế thu nhập cá nhân (thay thế) đã gửi xin ý kiến các bộ, ngành, địa phương và người dân, Bộ Tài chính đã đề nghị tiếp tục giữ nguyên quy định về miễn thuế thu nhập cá nhân (TNCN) đối với lãi tiền gửi tiết kiệm như quy định hiện hành.\r\nĐối với lãi tiền gửi tiết kiệm, luật Thuế TNCN hiện hành quy định miễn thuế đối với thu nhập từ lãi tiền gửi tại tổ chức tín dụng, lãi từ hợp đồng bảo hiểm nhân thọ, lãi trái phiếu Chính phủ, tiền lương hưu...\r\n\r\nQuy định về miễn thuế TNCN đối với thu nhập từ lãi tiền gửi tại các tổ chức tín dụng nhằm khuyến khích cá nhân không có nhu cầu đầu tư trực tiếp vào sản xuất, kinh doanh gửi tiền tiết kiệm qua ngân hàng - kênh huy động vốn quan trọng cho nền kinh tế. Đây cũng là chính sách phúc lợi đối với các đối tượng không có khả năng lao động (người về hưu, người tàn tật...) có nguồn tiền nhàn rỗi gửi vào ngân hàng để nhận lãi.\r\n\r\nTrước đó, tại dự thảo tờ trình đề nghị xây dựng dự án luật Thuế thu nhập cá nhân (thay thế) mới nhất gửi Chính phủ, Bộ Tài chính đề xuất cần rà soát bổ sung quy định về thu nhập chịu thuế theo hướng bổ sung nhóm thu nhập khác (đồng thời giao Chính phủ quy định chi tiết cho phù hợp với tình hình thực tế), hoặc quy định cụ thể các khoản thu nhập khác là thu nhập chịu thuế.\r\n\r\nBộ này dẫn ví dụ các khoản thu nhập chịu thuế ở Thái Lan, Trung Quốc, Hàn Quốc. Trong đó, có điểm chung là cả 3 quốc gia đều đánh thuế TNCN với khoản thu nhập từ tiền lãi gửi ngân hàng. Dù Bộ Tài chính chưa chính thức đề xuất cụ thể đưa lãi suất tiết kiệm vào khoản thu đánh thuế TNCN, nhưng việc đặt ra vấn đề như trên cũng thu hút sự chú ý của đông đảo dư luận.\r\n\r\nNhiều chuyên gia kinh tế khi trao đổi với Thanh Niên có chung nhận định, về lý thuyết, đưa lãi tiết kiệm vào đối tượng chịu thuế TNCN cũng khá bình thường. Tuy nhiên, chính sách này chưa thực sự phù hợp với Việt Nam, có thể gây nhiều hệ lụy không tốt cho nền kinh tế. Trong khoảng 5 năm tới, Việt Nam chưa nên bàn tới chuyện đánh thuế.\r\n\r\nSửa đổi tổng thể 7 nhóm chính sách, giảm nghĩa vụ thuế\r\nBộ Tài chính thông tin, ngày 12.2, Bộ Tư pháp đã tổ chức họp thẩm định hồ sơ đề nghị xây dựng luật Thuế TNCN (thay thế). Sau khi có ý kiến thẩm định bằng văn bản của Bộ Tư pháp, Bộ Tài chính sẽ hoàn thiện hồ sơ đề nghị xây dựng dự án luật Thuế TNCN (thay thế) để trình Chính phủ xem xét quyết định trước khi báo cáo Ủy ban Thường vụ Quốc hội và Quốc hội.\r\nHồ sơ đề nghị xây dựng dự án luật Thuế TNCN (thay thế) dự kiến sẽ báo cáo Chính phủ để báo cáo Quốc hội đề xuất sửa đổi tổng thể các quy định liên quan đến chính sách thuế TNCN hiện hành với 7 nhóm chính sách. Nhiều nội dung sau khi được cấp có thẩm quyền thông qua sẽ góp phần giảm nghĩa vụ thuế cho người nộp thuế.\r\n\r\nCụ thể như: điều chỉnh tăng mức giảm trừ gia cảnh đối với người nộp thuế phù hợp với sự thay đổi về mức sống, chỉ số giá và các chỉ số kinh tế vĩ mô trong giai đoạn vừa qua và dự báo cho giai đoạn tới đây.\r\n\r\nSửa đổi, bổ sung về các khoản đóng góp từ thiện, nhân đạo được giảm trừ cũng như các khoản giảm trừ đặc thù khác khi xác định thu nhập tính thuế để thể chế hóa các chủ trương của Đảng và Nhà nước trong việc thúc đẩy sự phát triển các lĩnh vực như y tế, giáo dục.\r\n\r\nĐiều chỉnh các mức thuế suất cũng như khoảng cách thu nhập trong các bậc thuế của biểu thuế lũy tiến từng phần; bổ sung các quy định về miễn, giảm thuế nhằm thực hiện chủ trương, định hướng của Đảng và Nhà nước đối với một số lĩnh vực ưu tiên, thu hút nguồn nhân lực chất lượng cao cho phát triển kinh tế - xã hội…', 35, 1, 15, 'public/post-image/2025-02-21-01-50-39.jpeg', 'disable', 1, 2, '2025-02-24 15:04:00', '2025-02-24 15:04:00', '2025-02-24 15:04:00'),
(21, 'Một người có thể chạy liên tục tối đa bao xa', 'Nhiều người chạy 1 km đã thấy vất vả, nhưng có người có thể chạy liền 10 km. Vậy quãng đường dài nhất một người có thể chạy liên tục là bao nhiêu?', 'Trong thế giới của những cuộc thi chạy \"siêu marathon\", quãng đường vượt xa 42 km là điều không hiếm gặp. Nhưng câu hỏi đặt ra là: Con người có thể chạy liên tục bao xa trước khi phải dừng lại?\r\n\r\nĐể trả lời, trước tiên cần xác định khái niệm \"dừng lại\". Vận động viên Dean Karnazes hiện giữ kỷ lục không chính thức về quãng đường chạy không ngủ lâu nhất, với 563 km trong 3,5 ngày vào năm 2005. Năm 2023, Harvey Lewis đã lập kỷ lục trong một cuộc đua đường trường khép kín, chạy 724 km trong 4,5 ngày.\r\n\r\nTrong loại hình thi đấu này, các vận động viên chạy hết một vòng 6,7 km mỗi giờ cho đến khi chỉ còn lại một người trụ được. Lewis đã chạy 108 vòng như vậy, chỉ có vài phút cuối mỗi giờ để nghỉ ngơi trước khi tiếp tục.\r\n\r\nVì các vận động viên thường nghỉ ngắn để đi bộ, buộc giày, đi vệ sinh hoặc ngủ, không có kỷ lục chính thức nào về thời gian chạy dài nhất không dừng lại.\r\n\r\nNhà vật lý học Jenny Hoffman từ Đại học Harvard, cũng là một vận động viên chạy bộ đường trường, cho biết \"việc đi tiểu sẽ là yếu tố hạn chế\". Bà hiện giữ kỷ lục thế giới của nữ vận động viên đi bộ xuyên Mỹ nhanh nhất với 47 ngày, 12 giờ và 35 phút.\r\n\r\nNhà sinh lý học Guillaume Millet từ Đại học Jean Monnet, Pháp, cho biết ngoài thời gian nghỉ ngắn vì nhu cầu sinh học, con người có một số đặc điểm cho phép thực hiện tốt môn chạy sức bền. Cơ mông lớn, khả năng dự trữ năng lượng đàn hồi và dây chằng cổ chân khỏe là những yếu tố hỗ trợ.\r\n\r\nCon người cũng thích nghi tốt với việc chạy dưới trời nóng nhờ khả năng điều chỉnh nhiệt độ cơ thể qua việc đổ mồ hôi. Ông Millet cho biết, ngay cả khi nhiệt độ bên ngoài cao, chúng ta vẫn duy trì nhiệt độ cơ thể tương đối thấp, một lợi thế lớn so với hầu hết các loài động vật.\r\n\r\nTuy nhiên, con người chưa bao giờ tiến hóa đặc biệt để chạy những khoảng cách xa như vậy. Nhà sinh vật học tiến hóa Daniel Lieberman từ Đại học Harvard cho biết: \"Trong phần lớn thời gian tồn tại, con người đã phải làm việc rất vất vả để sống sót\".\r\n\r\n\"Nếu bạn chạy đúng cách và không bị thương, nạp năng lượng hợp lý, cơ thể có thể làm được những điều đáng kinh ngạc, nhưng đó không phải là điều chúng ta tiến hóa để làm. Đó là sự thích nghi bình thường đến mức cực đoan\".\r\n\r\nCác yếu tố thể chất như chấn thương, mỏi cơ hoặc thiếu ngủ có thể buộc người chạy phải dừng lại, nhưng sức bền tinh thần cũng đóng vai trò quan trọng. Để tiếp tục di chuyển nhiều ngày, người chạy bộ siêu dài phải vượt qua cơn đau và sự kiệt sức.\r\n\r\nTheo Lieberman, con người đã phát triển khả năng phi thường để khiến bản thân làm những điều phi thường. \"Bạn buộc phải muốn làm điều đó. Vì vậy, điều quan trọng nhất hạn chế sức chịu đựng của con người chính là tinh thần\".\r\n\r\nNhững người đẩy bản thân đến mức bất thường cần được đào tạo chuyên sâu để tránh chấn thương. Trước khi chạy xuyên lục địa, bà Hoffman đã luyện tập chạy 322 km mỗi tuần để đảm bảo thể lực và sức mạnh xương.\r\n\r\nSố người tham gia các cuộc thi siêu marathon tăng nhanh qua từng năm, với tỷ lệ tăng 1.676% từ năm 1996 đến 2020. Khi môn thể thao này ngày càng phổ biến, những vận động viên mới sẽ thách thức và có thể phá vỡ kỷ lục cũ, đẩy khả năng của con người lên cao hơn.', 19, 1, 17, 'public/post-image/2025-02-21-02-04-34.jpeg', 'disable', 2, 1, '2025-02-21 08:04:34', '2025-02-21 08:04:34', '2025-02-21 08:04:34'),
(22, 'CLB Hà Nội mạnh, nhưng đừng quên HAGL có vũ khí quan trọng này', 'HAGL có điểm tựa vững vàng để nuôi hy vọng thắng CLB Hà Nội, trong trận đấu diễn ra lúc 17 giờ hôm nay (21.2) trên sân Pleiku', 'HAGL và chuyện Pleiku \'đi dễ khó về\'\r\nLượt đi V-League đã khép lại với HAGL theo kịch bản... đầu voi đuôi chuột. Thầy trò HLV Lê Quang Trãi bất bại suốt 5 vòng đầu (thắng 2, hòa 3), từng ngự trị trên ngôi đầu V-League. Làn gió mới từ các cầu thủ trẻ trung, năng động cùng đấu pháp phòng ngự phản công đã đưa đội bóng phố núi từ chỗ phải chật vật đua trụ hạng, trở thành tập thể khó bị đánh bại.\r\n\r\nTuy nhiên, ngày vui nhanh chóng qua đi. Lối chơi nặng về phòng thủ của HAGL dần bị đối thủ \"đọc vị\". Khi những ngòi nổ như Marciel da Silva, Châu Ngọc Quang... bị kèm chặt, đội bóng của giám đốc kỹ thuật (GĐKT) Vũ Tiến Thành trở nên thiếu đột phá. Những thất bại cũng xuất hiện thường xuyên hơn, đưa HAGL trở lại vị trí vốn có.\r\n\r\nTrần Minh Vương cùng đồng đội chỉ giành 8 điểm trong 8 trận gần nhất, với tỷ lệ thắng 25% (chỉ ngang các đội nhóm dưới như Hải Phòng, Quảng Nam và kém SLNA).\r\n\r\nĐây vẫn chỉ là đội bóng có thực lực trung bình, cần ưu tiên trụ hạng trước, khi khả năng cạnh tranh ngôi cao là không rõ ràng. GĐKT Vũ Tiến Thành đã thay đổi diện mạo HAGL nhờ giáo án thể lực mới mẻ (tăng cường sức bền và khả năng va chạm) cùng triết lý chơi máu lửa và chặt chẽ hơn. Dù vậy, cuộc cải tổ ở HAGL không thể thành công chỉ với những nét khác biệt này. Họ thiếu cầu thủ giỏi để chuyển mình chỉ sau vài tháng.\r\n\r\nNhưng, bóng đá không phải chuyện mạnh được yếu thua. Nếu vậy, HAGL đã không quật ngã cả CLB Công an Hà Nội (CLB CAHN) và CLB Hà Nội ở lượt đi V-League. Ngay cả khi yếu hơn, HAGL vẫn có kẽ hở để lách vào tìm kiếm chiến thắng.\r\n\r\nỞ trận đấu diễn ra lúc 17 giờ hôm nay (21.2), ưu thế trước tiên của HAGL là sân nhà Pleiku, nơi GĐKT Vũ Tiến Thành quyết biến thành \"đấu trường\" đi dễ khó về với các đội khách. HAGL đã bất bại 6 trận sân nhà ở lượt đi (thắng 2, hòa 4), dù phải gặp nhiều đội mạnh như CLB CAHN, Nam Định hay Thanh Hóa.\r\n\r\nNhìn rộng ra, HAGL chỉ thua 1 trong 17 trận sân nhà gần nhất tại V-League và Cúp quốc gia. Không dễ để thắng ở Pleiku bởi hai lý do. Độ cao và bầu không khí loãng tại đây là trở ngại về mặt thể lực với bất cứ đội bóng nào làm khách. Đồng thời, kích thước và không gian sân Pleiku cũng mang tới cho HAGL cảm giác an toàn, quen thuộc hơn. Những khán đài áp sát sân bóng trở thành điểm tựa cho lối đá phản công với cự ly đội hình hẹp mà ông Vũ Tiến Thành dày công xây dựng.\r\n\r\nMàn thử lửa cân sức\r\nVới đội bóng ưu tiên đá phòng ngự chặt chẽ như HAGL, bàn mở tỷ số luôn là chìa khóa chiến thắng. Trong cả 4 trận thắng ở lượt đi, HAGL đều dẫn trước, rồi triển khai đấu pháp vây ráp khoa học để bảo toàn chiến thắng.\r\n\r\nBàn mở tỷ số sẽ là chìa khóa ở trận đấu trên sân Pleiku. Nếu HAGL ghi bàn trước, CLB Hà Nội sẽ phải đối diện \"khối bê tông\" ở phố núi. Mà từ đầu giải đến giờ, đại diện thủ đô luôn gặp khó trước những hàng phòng ngự lùi sâu. Với Marciel da Silva và Washington Brandao trên hàng công, HAGL đã sẵn sàng trừng phạt đối thủ. Đội bóng phố núi không cần chơi hay hơn, chỉ cần biết trừng phạt đối thủ bằng một \"nhát kiếm\" chớp nhoáng như trận lượt đi là được.\r\n\r\nBên phía đối diện, tân HLV Makoto Teguramori cùng các ngoại binh mới hứa hẹn giúp CLB Hà Nội chuyển mình, nhưng mọi thay đổi đều cần thời gian.\r\n\r\nCLB Hà Nội sẽ nỗ lực tìm được bàn dẫn trước để đẩy HAGL vào thế phải tấn công, vốn là sở đoản của đội bóng này. 5 trận gần nhất thủng lưới trước, HAGL hòa 2, thua 3. Gần như không có cơ hội lật ngược thế cờ nếu HAGL bị dẫn bàn.\r\n\r\nTrận đấu ở Pleiku chiều nay sẽ toan tính và kín kẽ, khi cả hai đội đều không muốn khởi đầu lượt về với một thất bại. CLB Hà Nội mạnh hơn, nhưng tại \"đấu trường Pleiku\", HAGL đã sẵn sàng mở hội để gây áp lực lên tốp 5.', 65, 1, 16, 'public/post-image/2025-02-21-01-53-56.jpeg', 'disable', 2, 1, '2025-02-25 08:04:34', '2025-02-25 08:04:34', '2025-02-25 08:04:34'),
(26, 'Bộ Chính trị quyết định miễn học phí cho học sinh cả nước từ tháng 9.2025', 'Bộ Chính trị quyết định miễn học phí cho học sinh từ mầm non đến hết trung học phổ thông công lập trên phạm vi cả nước.', 'Ngày 28.2, Bộ Chính trị đã họp để kiểm điểm, đánh giá kết quả triển khai bước đầu việc thực hiện Nghị quyết 18 của T.Ư Đảng khóa XII về tiếp tục đổi mới, sắp xếp tổ chức bộ máy của hệ thống chính trị tinh gọn, hoạt động hiệu lực, hiệu quả.\r\n\r\nBộ Chính trị thống nhất cao chủ trương thực hiện mạnh mẽ, quyết liệt, nhanh chóng hơn nữa các nội dung của Nghị quyết 18 trong năm 2025.\r\n\r\nSau khi nghe báo cáo của Chính phủ về khả năng cân đối tài chính trong và sau quá trình tinh gọn tổ chức bộ máy của hệ thống chính trị, Bộ Chính trị quyết định thực hiện miễn toàn bộ học phí cho học sinh từ mầm non đến hết trung học phổ thông công lập trên phạm vi cả nước. Thời điểm thực hiện từ đầu năm học mới 2025 - 2026 (tháng 9.2025 trở đi).\r\n\r\nBộ chính trị giao Đảng ủy Chính phủ chỉ đạo Bộ GD-ĐT, Bộ Tài Chính, một số bộ, ngành liên quan và các địa phương phối hợp cụ thể hóa và thực hiện nghiêm túc quyết định nêu trên.\r\n\r\nTheo quy định tại khoản 3 điều 99 luật Giáo dục năm 2019 hiện hành, học sinh tiểu học trong các cơ sở giáo dục công lập không phải đóng học phí. \r\n\r\nTừ ngày 1.9.2024, trẻ mầm non 5 tuổi được miễn học phí, theo quy định tại khoản 6, điều 15 Nghị định số 81. \r\n\r\nNgoài ra, hiện cả nước có nhiều tỉnh thành miễn học phí 100% từ mầm non tới hết lớp 12 cho học sinh tại các cơ sở giáo dục công lập.\r\n\r\nMới đây, TP.HCM đã quyết định miễn học phí cho trẻ mầm non dưới 5 tuổi và học sinh trung học phổ thông công lập, ngoài công lập từ năm học 2025 - 2026.', 0, 1, 20, 'public/post-image/2025-03-04-08-45-05.jpeg', 'disable', 1, 1, '1970-01-01 01:00:00', '2025-03-03 10:32:03', '2025-03-04 14:45:05'),
(27, 'Bai moi', 'Day la mot bai viet moi', 'Tin tuc moi', 0, 1, 14, 'public/post-image/2025-03-13-08-55-18.jpeg', 'disable', 1, 1, '1970-01-01 01:00:00', '2025-03-13 14:55:18', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `permission` enum('user','admin') NOT NULL DEFAULT 'user',
  `verify_token` varchar(191) DEFAULT NULL,
  `is_active` tinyint(5) NOT NULL DEFAULT 1,
  `forgot_token` varchar(191) DEFAULT NULL,
  `forgot_token_expire` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `permission`, `verify_token`, `is_active`, `forgot_token`, `forgot_token_expire`, `created_at`, `updated_at`) VALUES
(1, 'adminsieucaps1tg', 'admin@admin.com', '$2y$10$IN3YIlgIvxiHxdBvNVz/GOm72x2h5aBvV9J2QmsVhLLwkvooKBhbm', 'admin', 'cf408fb6caedd3c8308a21254b1a3cb4a5c8757f7740354104af7b43dfe7bff6', 1, NULL, NULL, '2023-06-12 16:17:46', '2025-03-03 10:32:47'),
(2, 'thao', 'thao@gmail.com', '$2y$10$kUh4xMjKTXeNiy7jSIJO6.LOVBth9hQiPwMi0BgD.ao2uWBDn1OB.', 'user', NULL, 1, NULL, NULL, '2021-06-23 23:35:51', '2019-07-05 02:10:50'),
(3, 'bic', 'bic@gmail.com', '$2y$10$nlZ5dMJ2sv9HrKU4NJslDe0ick10lGSBZNM2i14zKtDGGAEqAdXVS', 'user', NULL, 1, NULL, NULL, '2019-06-06 01:28:40', '2025-02-21 05:33:25'),
(4, 'nhi', 'nhi@gmail.com', '$2y$10$CrqnkHtp2dKlyHfYRniXG.B8fWtrHtfavUyGVqc6bdiiF5lgwzi96', 'user', NULL, 1, NULL, NULL, '2019-10-27 21:56:13', '2019-10-27 22:18:23'),
(14, 'hang', 'hang@gmail.com', '$2y$10$aSmDJ.H30sPJDaRz1sAD9.HUBl1ZyRVvSA3t.sZphd6VnVVOElUKq', 'user', '4a9a76569b0a246d7fe89e31c6a83c4dbf2a7bb63371eecb9981fa5b585d9734', 1, NULL, NULL, '2025-02-28 08:56:34', NULL),
(15, 'hanh123', 'hangnho2003@gmail.com', '$2y$10$FgbnGCPwKNl4IzOegdmGLeDCH6NSvb6RHNIHP9qFLbdvTn7iI1zOG', 'user', 'fda8744d0ccd066007679b2906c1c77e1871ea395d5d1f5129a1ff9e84ffa057', 1, NULL, NULL, '2025-03-13 14:53:10', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `websetting`
--

CREATE TABLE `websetting` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Đang đổ dữ liệu cho bảng `websetting`
--

INSERT INTO `websetting` (`id`, `title`, `description`, `keywords`, `logo`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Tin Tuc', 'online news', 'online news', 'public/setting/logo.png', 'public/setting/icon.jpeg', '2019-06-09 19:54:37', '2022-10-24 16:41:31');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Chỉ mục cho bảng `websetting`
--
ALTER TABLE `websetting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT cho bảng `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `websetting`
--
ALTER TABLE `websetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
