import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength:
        Toast.LENGTH_SHORT, // Thời gian hiển thị: LENGTH_SHORT hoặc LENGTH_LONG
    gravity: ToastGravity.BOTTOM, // Vị trí: TOP, CENTER, BOTTOM
    backgroundColor: Colors.black, // Màu nền
    textColor: Colors.white, // Màu chữ
    fontSize: 16, // Kích thước chữ
  );
}
