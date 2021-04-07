import 'package:cherche_transport_u/app/presentation/estilos_general/font_size.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final Function onChange;
  final String title;

  const CustomCheckBox({Key key, this.onChange, this.title}) : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isCheck = false;

  _CustomCheckBoxState();

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: EdgeInsets.all(0),
      activeColor: Theme.of(context).primaryColor,
      title: Text(
        widget.title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: getTextFontSize(context)),
      ),
      value: isCheck,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool value) {
        setState(() {
          isCheck = !isCheck;
        });
        widget.onChange(value);
      },
    );
  }
}
