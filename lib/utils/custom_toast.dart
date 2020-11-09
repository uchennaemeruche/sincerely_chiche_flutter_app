import 'package:toast/toast.dart';

showShortToast(msg, context) {
  Toast.show(msg, context, gravity: Toast.BOTTOM, duration: Toast.LENGTH_SHORT);
}
