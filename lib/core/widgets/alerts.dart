import 'package:flutter/material.dart';

class Alerts {
  Alerts._();

  ///Build a [Custom Alert Dialog] base on the current Platform [IOS] and [Android]
  static Future<Future> alertDialog({
    required BuildContext context,
    required String content,
    bool? isSuccess = true,
    required void Function()? onOk,
  }) async {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: isSuccess!
                ? const Icon(
                    Icons.check_circle_outline,
                    color: Colors.greenAccent,
                    size: 60,
                  )
                : const Icon(
                    Icons.cancel_outlined,
                    color: Colors.redAccent,
                    size: 60,
                  ),
            content: Text(content),
            actions: <Widget>[
              Center(
                child: TextButton(
                  onPressed: onOk,
                  child: const Text("Volver"),
                ),
              ),
            ],
          );
        });
  }

  static Future<Future> successExtraAction({
    required BuildContext context,
    required String content,
    required String callToAction,
    required void Function()? onCallToAction,
    required void Function()? onBack,
  }) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Icon(
              Icons.check_circle_outline,
              color: Colors.greenAccent,
              size: 60,
            ),
            content: Text(
              content,
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: onBack,
                child: const Text("Volver"),
              ),
              TextButton(
                onPressed: onCallToAction,
                child: Text(callToAction),
              ),
            ],
          );
        });
  }

  static Future<void> confirmation({
    required BuildContext context,
    required String content,
    required void Function()? onCallToAction,
  }) async {
    await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Icon(
              Icons.delete_outline_sharp,
              color: Colors.redAccent,
              size: 60,
            ),
            content: Text(
              content,
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: onCallToAction,
                child: const Text("Si"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("No"),
              ),
            ],
          );
        });
  }
}
