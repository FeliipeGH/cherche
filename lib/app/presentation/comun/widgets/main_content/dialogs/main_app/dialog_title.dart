import 'package:cherche_transport_u/app/presentation/estilos_general/font_size.dart';
import 'package:cherche_transport_u/app/presentation/tema/typography.dart';
import 'package:flutter/material.dart';

class DialogTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.close),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 8),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "ChercheTransport",
                style: MainTypography.headlineTextStyle
                    .copyWith(fontSize: getSubTitleFontSize(context)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
