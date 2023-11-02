import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget(
      {super.key,
      this.onButtonPressed,
      required this.callToAction,
      required this.message,
      required this.icon});
  final void Function()? onButtonPressed;
  final String callToAction;
  final String message;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Icon(
                  icon,
                  size: 50,
                ),
              ),
              Text(
                message,
                style: const TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0)
                    .copyWith(top: 30),
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  child: Text(callToAction),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
