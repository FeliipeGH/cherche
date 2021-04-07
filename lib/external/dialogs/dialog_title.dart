import 'package:cherche_transport_u/external/dialogs/title_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DialogTitle extends StatelessWidget {
  final String title;

  const DialogTitle({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        children: [
          Flexible(
            child: Container(
                child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(FontAwesomeIcons.arrowLeft),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Container(
                  child: TitleTab(
                    title: title,
                    iconTitle: Icon(FontAwesomeIcons.calendarAlt),
                    subTitle: "",
                    showSubtitle: false,
                  ),
                ))
              ],
            )),
          )
        ],
      ),
    );
  }
}
