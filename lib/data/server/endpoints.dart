class EndPoints {
  //base url
  static String baseUrl = 'https://heyfollowup-server-c6d66688c3f4.herokuapp.com';

  static String login = '$baseUrl/api/auth/signin';
  static String signup = '$baseUrl/api/auth/signup';
  static String verifyOTP = '$baseUrl/api/auth/verify-otp';

  static String userDetails = '$baseUrl/api/auth/profile';

}
