import 'package:cherche_transport_u/app/presentation/comun/widgets/card_decorations/card_decoration.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/font_size.dart';
import 'package:cherche_transport_u/app/presentation/tema/typography.dart';
import 'package:cherche_transport_u/external/dialogs/dialog_content.dart';
import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DialogContent(
      isScrolleable: false,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(getCustomValueForScreenType<double>(
          context: context,
          mobile: getCustomValueForRefinedSize<double>(
            context: context,
            small: 16,
            normal: 18,
            large: 20,
            extraLarge: 22,
          ),
          tablet: 24,
        )),
        decoration: getCardRoundDecoration(context),
        constraints: BoxConstraints(
            maxWidth: getCustomValueForScreenType<double>(
          context: context,
          mobile: getCustomValueForRefinedSize<double>(
            context: context,
            small: 220,
            normal: 230,
            large: 250,
            extraLarge: 260,
          ),
          tablet: 300,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor),
                ),
                SizedBox(
                  width: 16,
                ),
                Flexible(
                  child: Text(
                    "Cargando",
                    style: MainTypography.subtitleTextStyle
                        .copyWith(fontSize: getSubTitleFontSize(context)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => LoadingDialog(),
    barrierDismissible: false,
  );
}
