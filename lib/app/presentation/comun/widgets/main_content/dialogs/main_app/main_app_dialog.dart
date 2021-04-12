import 'package:animate_do/animate_do.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/card_decorations/card_decoration.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/dialogos/styles/dialog_styles.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/main_content/dialogs/main_app/dialog_title.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/main_content/dialogs/main_app/main_dialog_items.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/main_content/dialogs/main_app/user_profile_item.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/dialog_pading_size.dart';
import 'package:cherche_transport_u/external/dialogs/dialog_content.dart';
import 'package:flutter/material.dart';

class MainAppDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: DialogContent(
        isScrolleable: false,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(getMainAppDialogPaddingSize(context)),
          decoration: getCardRoundDecoration(context),
          constraints:
              BoxConstraints(maxWidth: getMaxAlertDialogWidth(context)),
          margin:
              EdgeInsets.symmetric(horizontal: getAlertDialogMarginX(context)),
          child: FadeInLeft(
            delay: Duration(milliseconds: 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: DialogTitle(),
                ),
                UserProfileItem(),
                Divider(
                  color: Colors.grey,
                ),
                MainDialogItems(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
