import 'package:animate_do/animate_do.dart';
import 'package:cherche_transport_u/app/presentation/estilos_general/font_size.dart';
import 'package:cherche_transport_u/app/presentation/tema/typography.dart';
import 'package:flutter/material.dart';

class TitleTab extends StatefulWidget {
  final String title;
  final Icon iconTitle;
  final String subTitle;
  final bool showSubtitle;

  const TitleTab(
      {Key key,
        @required this.title,
        this.iconTitle,
        this.subTitle,
        this.showSubtitle = true})
      : super(key: key);

  @override
  _TitleTabState createState() => _TitleTabState();
}

class _TitleTabState extends State<TitleTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FadeInUp(
      delay: Duration(milliseconds: 300),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Text(
                  widget.title,
                  style: MainTypography.headlineTextStyle
                      .copyWith(fontSize: getHeadLineTitleFontSize(context)),
                )),
            if (widget.showSubtitle)
              Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      widget.iconTitle,
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        widget.subTitle,
                        style: MainTypography.headlineSecondaryTextStyle
                            .copyWith(fontSize: getSubTitleFontSize(context)),
                      ),
                    ],
                  )),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
