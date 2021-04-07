import 'package:animate_do/animate_do.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/card_decorations/card_decoration.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/dialogos/styles/dialog_styles.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/buttons_styles.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/dialog_pading_size.dart';
import 'package:cherche_transport_u/app/presentation/tema/typography.dart';
import 'package:cherche_transport_u/external/dialogs/dialog_content.dart';
import 'package:flutter/material.dart';

class GeneralAlertDialog extends StatelessWidget {
  final Icon icon;
  final String title;
  final String msg;
  final Color circleColor;

  const GeneralAlertDialog(
      {Key key, this.icon, this.title, this.msg, this.circleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: DialogContent(
        isScrolleable: false,
        child: Container(
          padding: EdgeInsets.all(getDialogPaddingSize(context)),
          decoration: getCardRoundDecoration(context),
          constraints:
              BoxConstraints(maxWidth: getMaxAlertDialogWidth(context)),
          margin:
              EdgeInsets.symmetric(horizontal: getAlertDialogMarginX(context)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: circleColor, width: 2),
                ),
                child: icon,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  title,
                  style: MainTypography.headlineTextStyle
                      .copyWith(fontSize: getTitleDialogFontSize(context)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  msg,
                  style: MainTypography.headlineSecondaryTextStyle
                      .copyWith(fontSize: getTextDialogFontSize(context)),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 6),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(getPaddingButton(context))),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "OK",
                    style: MainTypography.buttonTextStyle.copyWith(
                        fontSize: getButtonFontSize(context),
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
