import 'package:animate_do/animate_do.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/main_content/float_button.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/main_content/navigation_bar.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/main_content/styles/content_page_styles.dart';
import 'package:cherche_transport_u/app/presentation/tema/typography.dart';
import 'package:cherche_transport_u/external/responsive/services/process_device_type.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContentPage extends StatelessWidget {
  final Widget child;
  final bool isDetails;
  final bool showAppBar;
  final bool showFloatActionButton;
  final Function onFloatingActionTap;
  final bool isScrolleable;
  final IconData iconFloatActionButton;
  final int currentIndex;

  const ContentPage(
      {Key key,
      this.child,
      this.isDetails = false,
      this.showAppBar = true,
      this.showFloatActionButton = false,
      this.onFloatingActionTap,
      this.isScrolleable = true,
      this.iconFloatActionButton = FontAwesomeIcons.plus,
      this.currentIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: !showAppBar ? Colors.transparent : null,
      appBar: showAppBar
          ? AppBar(
              backgroundColor: Theme.of(context).backgroundColor,
              leading: FadeInUp(
                child: Container(
                  margin: EdgeInsets.only(left: 8),
                  child: isDetails
                      ? IconButton(
                          icon: Icon(
                            FontAwesomeIcons.arrowLeft,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      : Image.asset("assets/imgs/main/logo_app.png"),
                ),
              ),
              actions: isDetails
                  ? [
                      FadeInUp(
                        child: Container(
                          margin: EdgeInsets.all(4),
                          child: Image.asset("assets/imgs/main/logo_app.png"),
                        ),
                      ),
                    ]
                  : null,
              elevation: 2,
              title: FadeInUp(
                child: Text(
                  "FatLessOut",
                  style: MainTypography.tittleApp.copyWith(
                    fontSize: getTitleAppFontSize(context),
                  ),
                ),
              ),
            )
          : null,
      bottomNavigationBar: !isDetails
          ? CustomBottomNavigationBar(
              currentIndex: currentIndex,
            )
          : null,
/*      floatingActionButtonLocation:
          !isDetails ? FloatingActionButtonLocation.centerDocked : null,*/
      floatingActionButton: showFloatActionButton
          ? FadeInRight(
              delay: Duration(milliseconds: 600),
              child: CustomFloatingActionButton(
                onTap: onFloatingActionTap,
                iconData: iconFloatActionButton,
              ),
            )
          : null,
      body: isScrolleable
          ? SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Center(child: _MainContent(child: child)),
            )
          : Center(child: _MainContent(child: child)),
    );
  }
}

class _MainContent extends StatelessWidget {
  final Widget child;

  const _MainContent({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // set max width from different platforms
      margin: EdgeInsets.symmetric(horizontal: getContentPageMarginX(context)),
      constraints: BoxConstraints(
        maxWidth: getCustomValueForScreenType<double>(
          context: context,
          mobile: double.infinity,
          tablet: 800,
          desktop: 900,
        ),
      ),
      child: child,
    );
  }
}
