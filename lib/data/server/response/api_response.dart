class ApiResponse{
  final String message;
  final bool isSuccessful;
  final dynamic responseBody;

  ApiResponse({this.message = '', this.isSuccessful = true, required this.responseBody});
}