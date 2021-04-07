import 'package:flutter/material.dart';

BoxDecoration getCardDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).cardColor,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        bottomLeft: Radius.circular(16.0),
        bottomRight: Radius.circular(16.0),
        topRight: Radius.circular(68.0)),
    boxShadow: <BoxShadow>[
      BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          offset: Offset(2, 3),
          blurRadius: 10.0),
    ],
  );
}

BoxDecoration getCardRoundDecoration(BuildContext context) {
  return BoxDecoration(
    color: Theme.of(context).cardColor,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        bottomLeft: Radius.circular(16.0),
        bottomRight: Radius.circular(16.0),
        topRight: Radius.circular(16.0)),
    boxShadow: <BoxShadow>[
      BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          offset: Offset(2, 3),
          blurRadius: 10.0),
    ],
  );
}
