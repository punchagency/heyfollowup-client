class EndPoints {
  //base url
  static String baseUrl = 'https://heyfollowup-server-c6d66688c3f4.herokuapp.com';

  static String login = '$baseUrl/api/auth/signin';
  static String signup = '$baseUrl/api/auth/signup';
  static String verifyOTP = '$baseUrl/api/auth/verify-otp';
  static String forgotPassword = '$baseUrl/api/auth/forgot-password';
  static String resetPassword = '$baseUrl/api/auth/reset-password';

  static String userDetails = '$baseUrl/api/auth/profile';

  //followups
  static String followup = '$baseUrl/api/follow-up/';
  static String getFollowupMessage = '$baseUrl/api/follow-up/generate/';

}
