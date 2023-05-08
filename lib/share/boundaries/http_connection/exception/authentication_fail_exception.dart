import 'package:com_mottu_marvel/share/base/exception/base_exception.dart';



class AuthenticationFailException extends BaseException {
  late String message;
  AuthenticationFailException(Map cause) : super(cause: cause.toString()) {
    message = cause['message'] ?? '';
  }

  @override
  String toString() => "Authentication Fail Exception: $cause";
}
