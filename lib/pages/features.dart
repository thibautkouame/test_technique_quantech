import 'package:flutter/material.dart';
import 'package:test_technique_quantech/const/colors.dart';

void showDevelopmentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: const Text(
          'Cette fonctionnalité est en cours de développement.',
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(color: AppColors.darkRed),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}