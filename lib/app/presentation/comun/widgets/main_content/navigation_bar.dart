import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigationBar({Key key, this.currentIndex = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
        child: BottomNavigationBar(
          onTap: (index) {
            switch (index) {
              case 0:
              // todo check route
              /*if (currentIndex != index) {
                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                    pageBuilder: (context, _, __) {
                      return HomePage();
                    },
                  ));
                }*/
                break;
              case 1:
              // todo check route
              /*if (currentIndex != index) {
                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                    pageBuilder: (context, _, __) {
                      return HealthPage();
                    },
                  ));
                }*/
                break;
              case 2:
              // todo check route
              /*if (currentIndex != index) {
                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                    pageBuilder: (context, _, __) {
                      return ProfilePage();
                    },
                  ));
                }*/
                break;
            }
          },
          //type: BottomNavigationBarType.fixed, -> to have more than 3 options
          elevation: 5,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.book), label: "Inicio"),
            /*BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.running),
                label: AppLocalizations.of(context).exercise),*/
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.heartbeat), label: "otro"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.userAlt), label: "otro2")
          ],
        ),
      ),
    );
  }
}