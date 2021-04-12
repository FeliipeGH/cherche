import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cherche_transport_u/app/presentation/comun/widgets/main_content/styles/content_page_styles.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/font_size.dart';
import 'package:cherche_transport_u/app/presentation/tema/typography.dart';
import 'package:flutter/material.dart';

class UserProfileItem extends StatefulWidget {
  @override
  _UserProfileItemState createState() => _UserProfileItemState();
}

class _UserProfileItemState extends State<UserProfileItem> {
  bool showEditProfile = false;

  void changeShowEditProfile() {
    setState(() {
      showEditProfile = !showEditProfile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: changeShowEditProfile,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    "David Burgos",
                    style: MainTypography.bodyTextStyle
                        .copyWith(fontSize: getTextFontSize(context)),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Transform.rotate(
                      angle: showEditProfile ? pi : 0,
                      child: Icon(
                        Icons.arrow_drop_down_circle_outlined,
                        size: getTitleIconSize(context),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (showEditProfile) ProfileContent(),
        ],
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.account_circle_outlined,
              size: getTitleIconSize(context),
            ),
            title: Text("Perfil"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.logout,
              size: getTitleIconSize(context),
            ),
            title: Text("Cerrar sesión"),
          ),
        ],
      ),
    );
  }
}
