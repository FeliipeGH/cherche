import 'package:cherche_transport_u/app/presentation/comun/widgets/dialogos/general_alert_dialog.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/dialogos/styles/dialog_styles.dart';
import 'package:cherche_transport_u/app/presentation/tema/colores.dart';
import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  final String msg;

  const WarningDialog({Key key, this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralAlertDialog(
      title: "Alerta",
      msg: msg,
      circleColor: ColoresPrincipales.cursorColor,
      icon: Icon(
        Icons.info,
        color: ColoresPrincipales.cursorColor,
        size: getAlertDialogIconSize(context),
      ),
    );
  }
}

void showWarningDialog(BuildContext context, String msg) {
  showDialog(
      context: context,
      builder: (_) => WarningDialog(
            msg: msg,
          ));
}
