import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showMessage(String msg) {
  return Fluttertoast.showToast(msg: msg);
}
