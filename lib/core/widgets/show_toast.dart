import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showToast(String message) async {
  return Fluttertoast.showToast(msg: message);
}
