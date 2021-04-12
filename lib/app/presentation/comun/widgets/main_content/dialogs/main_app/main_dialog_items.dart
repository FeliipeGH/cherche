import 'package:cherche_transport_u/app/presentation/comun/widgets/main_content/styles/content_page_styles.dart';
import 'package:flutter/material.dart';

class MainDialogItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.alarm,
            size: getTitleIconSize(context),
          ),
          title: Text("Horarios de transporte"),
        ),
      ],
    );
  }
}
