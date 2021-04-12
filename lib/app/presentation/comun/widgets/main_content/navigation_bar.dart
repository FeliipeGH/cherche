import 'package:cherche_transport_u/app/presentation/modulos/home/pagina_home.dart';
import 'package:cherche_transport_u/app/presentation/modulos/paradas/pagina_paradas.dart';
import 'package:cherche_transport_u/app/presentation/modulos/recordatorios/pagina_recordatorios.dart';
import 'package:cherche_transport_u/app/presentation/modulos/viajes/pagina_viajes.dart';
import 'package:flutter/material.dart';

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
                if (currentIndex != index) {
                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                    pageBuilder: (context, _, __) {
                      return PaginaHome();
                    },
                  ));
                }
                break;
              case 1:
                if (currentIndex != index) {
                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                    pageBuilder: (context, _, __) {
                      return StopsPage();
                    },
                  ));
                }
                break;
              case 2:
                if (currentIndex != index) {
                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                    pageBuilder: (context, _, __) {
                      return TravelsPage();
                    },
                  ));
                }
                break;
              case 3:
                if (currentIndex != index) {
                  Navigator.of(context).pushReplacement(PageRouteBuilder(
                    pageBuilder: (context, _, __) {
                      return RemindersPage();
                    },
                  ));
                }
                break;
            }
          },
          //type: BottomNavigationBarType.fixed, -> to have more than 3 options
          type: BottomNavigationBarType.fixed,
          elevation: 5,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
            BottomNavigationBarItem(
                icon: Icon(Icons.directions_bus), label: "Paradas"),
            BottomNavigationBarItem(
                icon: Icon(Icons.airport_shuttle_outlined), label: "Viajes"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmarks_rounded), label: "Recordatorios")
          ],
        ),
      ),
    );
  }
}
