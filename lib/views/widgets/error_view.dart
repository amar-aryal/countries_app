import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
    required this.errorText,
    required this.onPressed,
  }) : super(key: key);

  final String errorText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_outlined,
            size: size.width / 6.5,
            color: Colors.black26,
          ),
          const SizedBox(height: 15),
          Text(
            errorText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          MaterialButton(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            onPressed: onPressed,
            color: const Color(0xffF76C6C),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Text(
              'Try again',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
