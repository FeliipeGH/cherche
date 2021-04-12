import 'package:cherche_transport_u/app/presentation/comun/widgets/card_decorations/card_decoration.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/buttons_styles.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/dialog_pading_size.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/font_size.dart';
import 'package:cherche_transport_u/app/presentation/tema/typography.dart';
import 'package:cherche_transport_u/external/dialogs/dialog_content.dart';
import 'package:cherche_transport_u/external/inputs/material_input.dart';
import 'package:cherche_transport_u/external/inputs/styles/material_input_style.dart';
import 'package:flutter/material.dart';

class SelectorTextDialog extends StatefulWidget {
  final List<String> elementList;
  final IconData iconData;
  final String hintText;
  final String labelText;
  final String helperText;

  const SelectorTextDialog(
      {Key key,
      this.elementList,
      this.iconData,
      this.hintText,
      this.labelText,
      this.helperText})
      : super(key: key);

  @override
  _SelectorTextDialogState createState() => _SelectorTextDialogState();
}

class _SelectorTextDialogState extends State<SelectorTextDialog> {
  String dataString = "";

  void setDataString(String value) {
    setState(() {
      dataString = value;
    });
  }

  @override
  void initState() {
    super.initState();
    dataString = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => DialogElementList(
                          elementList: widget.elementList,
                          setDataString: setDataString,
                        ));
              },
              splashColor: Theme.of(context).primaryColor,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                decoration: BoxDecoration(color: Color(0xffECEEF2)),
                child: Row(
                  children: [
                    Icon(
                      widget.iconData,
                      color: Colors.grey[700],
                      size: getMaterialInputIconSize(context),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        dataString,
                        style: TextStyle(
                            fontSize: getTextFontSize(context),
                            color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DialogElementList extends StatefulWidget {
  final List<String> elementList;
  final Function(String value) setDataString;

  const DialogElementList({Key key, this.elementList, this.setDataString})
      : super(key: key);

  @override
  _DialogElementListState createState() => _DialogElementListState();
}

class _DialogElementListState extends State<DialogElementList> {
  List<String> listToDisplay = [];

  @override
  void initState() {
    super.initState();
    listToDisplay.addAll(widget.elementList);
  }

  @override
  Widget build(BuildContext context) {
    return DialogContent(
      isScrolleable: false,
      child: Container(
        padding: EdgeInsets.all(getMainAppDialogPaddingSize(context)),
        decoration: getCardRoundDecoration(context),
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: MaterialInput(
                validation: (_) => null,
                icon: Icons.search,
                textInputType: TextInputType.emailAddress,
                textStyle: TextStyle(fontSize: getTextFontSize(context)),
                hintText: "Buscar",
                labelText: "Buscar",
                helperText: "Buscar",
                onChanged: (String value) {
                  value.toLowerCase();
                  setState(() {
                    listToDisplay = widget.elementList
                        .where(
                            (element) => element.toLowerCase().contains(value))
                        .toList();
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: listToDisplay.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: ElementText(
                      text: listToDisplay[index],
                      setDataString: widget.setDataString,
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Regresar"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ElementText extends StatelessWidget {
  final String text;
  final Function(String value) setDataString;

  const ElementText({Key key, this.text, this.setDataString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getCardRoundDecoration(context),
      padding: EdgeInsets.all(getPaddingButton(context)),
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: () {
          setDataString(text);
          Navigator.pop(context);
        },
        child: Text(
          text,
          style: MainTypography.bodyTextStyle
              .copyWith(fontSize: getTextFontSize(context)),
        ),
      ),
    );
  }
}
