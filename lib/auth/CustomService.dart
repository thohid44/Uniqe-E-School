import 'package:http/http.dart' as http;

class CustomWebServices {
  static var apiClient = http.Client();

  static String signup_api_url = "http://uniqueeschool.com/api/studentRegApi";
  static String signin_api_url = "http://uniqueeschool.com/api/studentLoginApi";
  static String all_book_api_url = "https://uniqueeschool.com/books_data/";
  static String course_order_api_url =
      "http://uniqueeschool.com/api/courseOrder";
  static String course_api_url = "http://uniqueeschool.com/api/list";
  static String lesson_api_url = "http://uniqueeschool.com";

  static String std_name = "name";
  static String std_email = "email";
  static String std_pass = "password";
  //Course Ordersa
  static String userId = "user_id";
  static String userName = "user_name";
  static String cPrice = "price";
  static String courseId = "course_id";
  static String bookId = "book_id";
  static String mobile = "transaction_mobile_no";
  static String transactionId = "transaction_id";

  /// Course
  static String course_status = "status";
  static String course_result = "status";
}
