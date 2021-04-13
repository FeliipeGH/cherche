import 'package:cherche_transport_u/app/domain/modelos/bus_travel.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/card_decorations/card_decoration.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/main_content/content_page.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/buttons_styles.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/font_size.dart';
import 'package:cherche_transport_u/app/presentation/tema/typography.dart';
import 'package:cherche_transport_u/external/inputs/selector_dialog/selector_dialog.dart';
import 'package:flutter/material.dart';

List<BusTravel> testList2 = [
  BusTravel("19/05/2019", "Ruta 7", 5),
  BusTravel("21/03/2020", "Ruta 19", 2.5),
  BusTravel("20/02/2021", "Ruta 21", 3),
  BusTravel("19/05/2019", "Ruta 7", 5),
  BusTravel("21/03/2020", "Ruta 19", 2.5),
  BusTravel("20/02/2021", "Ruta 21", 3),
  BusTravel("19/05/2019", "Ruta 7", 5),
  BusTravel("21/03/2020", "Ruta 19", 2.5),
  BusTravel("20/02/2021", "Ruta 21", 3),
  BusTravel("19/05/2019", "Ruta 7", 5),
  BusTravel("21/03/2020", "Ruta 19", 2.5),
  BusTravel("20/02/2021", "Ruta 21", 3),
  BusTravel("19/05/2019", "Ruta 7", 5),
  BusTravel("21/03/2020", "Ruta 19", 2.5),
  BusTravel("20/02/2021", "Ruta 21", 3),
  BusTravel("19/05/2019", "Ruta 7", 5),
  BusTravel("21/03/2020", "Ruta 19", 2.5),
  BusTravel("20/02/2021", "Ruta 21", 3),
];

class TravelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContentPage(
      currentIndex: 2,
      isScrolleable: false,
      child: Container(
        margin: EdgeInsets.only(top: 8),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              child: SelectorTextDialog(
                elementList: ['Ruta 19', 'Ruta 20', 'Ruta 21'],
                helperText: 'Selecciona colectivo',
                hintText: 'Selecciona colectivo',
                labelText: 'Selecciona colectivo',
                iconData: Icons.directions_bus,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              child: SelectorTextDialog(
                elementList: ['Cuernavaca-Jiutepec', 'Zapata-Jiutepec'],
                helperText: 'Tipo de recorrido',
                hintText: 'Tipo de recorrido',
                labelText: 'Tipo de recorrido',
                iconData: Icons.map_sharp,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              child: SelectorTextDialog(
                elementList: ['19/04/2019', '20/05/2021'],
                helperText: 'Fecha de servicio',
                hintText: 'Fecha de servicio',
                labelText: 'Fecha de servicio',
                iconData: Icons.calendar_today,
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Buscar"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: testList2.length,
                itemBuilder: (BuildContext context, int index) {
                  return BusTravelContainer(
                    busTravel: testList2[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BusTravelContainer extends StatelessWidget {
  final BusTravel busTravel;

  const BusTravelContainer({Key key, this.busTravel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.all(getPaddingButton(context)),
      decoration: getCardRoundDecoration(context),
      child: Row(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  busTravel.bus,
                  style: MainTypography.headlineTextStyle.copyWith(
                    fontSize: getHeadLineTitleFontSize(context),
                  ),
                ),
                Text(
                  busTravel.date,
                  style: MainTypography.bodyTextStyle
                      .copyWith(fontSize: getTextFontSize(context)),
                ),
              ],
            ),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.topRight,
                  child: Text("${busTravel.rate}")))
        ],
      ),
    );
  }
}
