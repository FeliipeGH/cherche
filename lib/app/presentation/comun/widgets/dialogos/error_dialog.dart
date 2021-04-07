import 'package:cherche_transport_u/app/presentation/comun/widgets/dialogos/general_alert_dialog.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/dialogos/styles/dialog_styles.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String msg;

  const ErrorDialog({Key key, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralAlertDialog(
      title: "Error",
      msg: msg,
      circleColor: Colors.red,
      icon: Icon(
        Icons.warning,
        color: Colors.red,
        size: getAlertDialogIconSize(context),
      ),
    );
  }
}

void showErrorDialog(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (_) => ErrorDialog(
            msg: msg,
          ));
}
