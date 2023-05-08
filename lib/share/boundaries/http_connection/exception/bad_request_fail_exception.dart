import 'package:com_mottu_marvel/share/base/exception/base_exception.dart';



class BadRequestFailException extends BaseException {
  late String message;
  BadRequestFailException(Map cause) : super(cause: cause.toString()) {
    message = cause['message'] ?? '';
  }
}
