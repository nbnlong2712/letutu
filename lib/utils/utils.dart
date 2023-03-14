import 'package:flutter/material.dart';
import 'package:letutu/utils/styles.dart';

class Utils {
  static SnackBar snackBar(String content, Color color) {
    return SnackBar(content: Text(content, style: const TextStyle(color: Colors.white)), backgroundColor: color);
  }

  static Future<void> showMyDialog(BuildContext context, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  text,
                  style: Utils.isLargeScreen(context)
                      ? textStyleH4_20()
                      : textStyleH6_14(),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Ok',
                style:
                Utils.isLargeScreen(context) ? textStyleH4_20() : textStyleH6_14(),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }
}
