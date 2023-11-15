import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isDisabled;
  final bool isBusy;
  final VoidCallback? onTap;
  const PrimaryButton({
    super.key,
    required this.text,
    this.isDisabled = false,
    this.isBusy = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // This handles the state of the button when its disabled
    if (isDisabled) {
      return Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent.withOpacity(0.4),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }

    // This handles the state of the button when its busy
    if (isBusy) {
      return Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent.withOpacity(0.4),
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Loading',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            CircularProgressIndicator.adaptive(),
          ],
        ),
      );
    }

    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        child: InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: onTap,
          child: SizedBox(
            height: 50,
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
