import 'package:cherche_transport_u/app/presentation/comun/widgets/main_content/content_page.dart';
import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';

class DialogContent extends StatelessWidget {
  final Widget child;
  final bool isScrolleable;

  const DialogContent({Key key, this.child, this.isScrolleable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ContentPage(
      isDetails: true,
      showAppBar: false,
      isScrolleable: isScrolleable,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: getCustomValueForScreenType<double>(
            context: context,
            mobile: double.infinity,
            tablet: 700,
          ),
        ),
        height: size.height,
        child: isScrolleable
            ? Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: child,
                ),
              )
            : Center(
                child: child,
              ),
      ),
    );
  }
}
