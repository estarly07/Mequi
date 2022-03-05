import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mequi/Utils/values/colors.dart';

class Bar extends StatelessWidget {
  const Bar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.02,
        horizontal: size.width * 0.0325,
      ),
      height: size.height * 0.075,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: Color(colorShadow),
              spreadRadius: -2,
            )
          ],
          color: Color(colorBar),
          borderRadius: BorderRadius.circular(size.height * 0.1)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
        child: _ItemsBar(),
      ),
    );
  }
}

class _ItemsBar extends StatefulWidget {
  _ItemsBar({
    Key? key,
  }) : super(key: key);

  @override
  State<_ItemsBar> createState() => _ItemsBarState();
}

class _ItemsBarState extends State<_ItemsBar> {
  String pageSelect = 'Text("Inicio")';

  List<NavigationItem> list = [
    NavigationItem(Icon(Icons.widgets_outlined), Text("Armario")),
    NavigationItem(Icon(Icons.chat_outlined), Text("Movimientos")),
    NavigationItem(Icon(Icons.home_filled), Text("Inicio")),
    NavigationItem(Icon(Icons.notifications_none), Text("Notificaciones")),
    NavigationItem(Icon(Icons.person_outline_rounded), Text("Perfil")),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list
          .map((e) => GestureDetector(
                onTap: () {
                  setState(() {
                    pageSelect = e.title.toString();
                    print(pageSelect);
                  });
                },
                child: _buildItem(
                    item: e,
                    isSelect: pageSelect == e.title.toString(),
                    size: size),
              ))
          .toList(),
    );
  }

  Widget _buildItem(
          {required NavigationItem item,
          bool isSelect = false,
          required Size size}) =>
      AnimatedContainer(
        duration: const Duration(milliseconds: 270),
        curve: Curves.fastOutSlowIn,
        width: isSelect ? size.width * 0.35 : size.width * 0.1,
        height: size.height * 0.046,
        decoration: isSelect
            ? BoxDecoration(
                color: const Color(colorPinkLight),
                borderRadius: BorderRadius.circular(16),
              )
            : null,
        child: Center(
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              Center(
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _itemBar(
                        item,
                        isSelect,
                      ),
                      isSelect
                          ? DefaultTextStyle.merge(
                              child: item.title,
                              style: TextStyle(
                                  color: Color(colorPink),
                                  fontSize: size.width * 0.035,
                                  fontWeight: FontWeight.bold))
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  IconTheme _itemBar(NavigationItem item, bool isSelect) => IconTheme(
        data: IconThemeData(
            size: 24,
            color: isSelect
                ? const Color(colorPink)
                : const Color(colorButtonsBar)),
        child: item.icon,
      );
}

class NavigationItem {
  final Icon icon;
  final Text title;

  NavigationItem(this.icon, this.title);
}
