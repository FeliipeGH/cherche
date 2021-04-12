import 'package:cherche_transport_u/external/inputs/material_input_provider.dart';
import 'package:cherche_transport_u/external/inputs/styles/material_input_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MaterialInput extends StatefulWidget {
  final String dataString;
  final String hintText;
  final String labelText;
  final String helperText;
  final IconData icon;
  final Function(String value) onChanged;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final bool psVisible;
  final TextStyle textStyle;
  final String Function(String value) validation;
  final bool isPassword;
  final bool enable;

  MaterialInput({
    Key key,
    this.dataString,
    this.hintText,
    this.textInputAction = TextInputAction.next,
    this.labelText,
    this.helperText,
    this.icon,
    this.validation,
    this.onChanged,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.psVisible = false,
    this.textStyle,
    this.isPassword = false,
    this.enable = true,
  }) : super(key: key);

  @override
  _MaterialInputState createState() => _MaterialInputState();
}

class _MaterialInputState extends State<MaterialInput> {
  final _focusNode = FocusNode();

  String errorText;
  bool showPass = false;
  bool hasChange = false;
  bool isFocus = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MaterialInputProvider materialInputProvider =
    Provider.of<MaterialInputProvider>(context);
    return Container(
      child: TextFormField(
        enabled:widget.enable,
        focusNode: _focusNode,
        initialValue: widget.dataString,
        keyboardType: widget.textInputType,
        obscureText: widget.isPassword ? !showPass : false,
        style:
        widget.textStyle.copyWith(fontSize: getInputTextFontSize(context)),
        validator: (String value) {
          if (hasChange || materialInputProvider.makeValidation) {
            _makeValidation(value);
            return widget.validation(value);
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          fillColor: Theme
              .of(context)
              .dividerColor,
          hintText: widget.hintText,
          contentPadding: EdgeInsets.all(8),
          filled: true,
          labelText: widget.labelText,
          helperText: widget.helperText,
          labelStyle: widget.textStyle.copyWith(
              fontSize: getInputTextFontSize(context)
          ),
          helperStyle: TextStyle(
              fontSize: getErrorTextFontSize(context)
          ),
          errorStyle: TextStyle(
              color:
              errorText == null ? Theme
                  .of(context)
                  .accentColor : Colors.red,
              fontSize: getErrorTextFontSize(context)
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
            BorderSide(
                color: errorText == null ? Colors.grey[700] : Colors.red),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: errorText == null
                    ? Theme
                    .of(context)
                    .primaryColor
                    : Colors.red),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                color: errorText == null
                    ? Theme
                    .of(context)
                    .primaryColor
                    : Colors.red),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: errorText == null
                    ? Theme
                    .of(context)
                    .primaryColor
                    : Colors.red),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: errorText == null
                    ? Theme
                    .of(context)
                    .primaryColor
                    : Colors.red),
          ),
          prefixIcon: Icon(
            widget.icon,
            color: errorText == null
                ? isFocus
                ? Theme
                .of(context)
                .accentColor
                : Colors.grey[700]
                : Colors.red,
            size: getMaterialInputIconSize(context),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
            icon: Icon(
              showPass ? Icons.visibility : Icons.visibility_off,
              color: errorText == null
                  ? isFocus
                  ? Theme
                  .of(context)
                  .accentColor
                  : Colors.grey[700]
                  : Colors.red,
              size: getMaterialInputIconSize(context),
            ),
            onPressed: () {
              setState(() {
                showPass = !showPass;
              });
            },
          )
              : widget.suffixIcon,
          errorText: errorText,
        ),
        onChanged: (value) {
          widget.onChanged(value);
          if (!hasChange) {
            hasChange = true;
          }
        },
        textInputAction: widget.textInputAction,
      ),
    );
  }

  void _makeValidation(value) {
    String aux = widget.validation(value);
    if (errorText != aux) {
      setState(() {
        errorText = aux;
      });
    }
  }
}
