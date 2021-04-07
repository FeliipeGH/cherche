import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Function onTap;
  final IconData iconData;

  const CustomFloatingActionButton({
    Key key,
    this.onTap,
    @required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 3,
      onPressed: onTap,
      child: Icon(
        iconData,
        color: Theme.of(context).cardColor,
      ),
      backgroundColor: Theme.of(context).indicatorColor,
    );
  }
}
