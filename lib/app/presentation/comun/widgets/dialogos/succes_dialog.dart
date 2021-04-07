import 'package:cherche_transport_u/app/presentation/comun/widgets/dialogos/general_alert_dialog.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/dialogos/styles/dialog_styles.dart';
import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final String msg;

  const SuccessDialog({Key key, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralAlertDialog(
      title: "Éxito",
      msg: msg,
      circleColor: Theme.of(context).primaryColor,
      icon: Icon(
        Icons.check,
        color: Theme.of(context).primaryColor,
        size: getAlertDialogIconSize(context),
      ),
    );
  }
}

void showSuccessDialog(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (_) => SuccessDialog(
        msg: msg,
      ));
}
