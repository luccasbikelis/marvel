import 'package:com_mottu_marvel/share/base/exception/base_exception.dart';



class HttpErrorException extends BaseException {
  late String message;
  HttpErrorException(Map cause) : super(cause: cause.toString()) {
    message = cause['message'] ?? '';
  }

  @override
  String toString() => "Http Error Exception: $cause";
}
