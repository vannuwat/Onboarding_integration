import 'package:flutter/material.dart';

AlertDialog alertDialog(BuildContext context, String title, String content) {
  return AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: <Widget>[
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('OK'),
      ),
    ],
  );
}

Future<void> alert(BuildContext context, String title, String content) {
  return showDialog<String>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => alertDialog(context, title, content),
  );
}

Future<bool?> confirm(BuildContext context, String title, String content) {
  return showDialog<bool>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('OK'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
      ],
    ),
  );
}
