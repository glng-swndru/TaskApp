import 'package:flutter/material.dart';
import 'app_color.dart';

class Appinfo {
  static success(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColor.approved,
      ),
    );
  }

  static failed(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColor.rejected,
      ),
    );
  }
}