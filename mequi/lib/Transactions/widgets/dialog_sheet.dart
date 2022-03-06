import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mequi/Utils/values/colors.dart';

late String _title;
late List<List<String>> _items;
late Function _callback;
/*
*@param title Titulo del dialogo
*@param items Una lista de listas en las cuales
*             contendra el icono, title y subtitle
*/
void showDialogSheet({
  required BuildContext context,
  String title = "",
  required List<List<String>> items,
  required Function callback,
}) {
  _title = title;
  _items = items;
  _callback = callback;
  final size = MediaQuery.of(context).size;
  showModalBottomSheet(
      context: context,
      barrierColor: const Color(colorShadowBlack).withOpacity(0.6),
      builder: (_) {
        return Wrap(children: [
          Container(
            color: Color(colorShadowBlack).withOpacity(0.6),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(colorBar),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(size.width * 0.13),
                    topLeft: Radius.circular(size.width * 0.13),
                  )),
              child: _Body(size: size),
            ),
          ),
        ]);
      });
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(
                top: size.height * 0.02, bottom: size.height * 0.02),
            height: size.height * 0.005,
            width: size.width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.width),
              color: Color(colorButtonsBar).withOpacity(0.8),
            )),
        Padding(
          padding: EdgeInsets.only(
            right: size.width * 0.05,
            bottom: size.width * 0.05,
          ),
          child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  size: size.height * 0.035,
                ),
              )),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: size.width * 0.03,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              _title,
              style: TextStyle(
                  fontSize: size.width * 0.08,
                  fontWeight: FontWeight.bold,
                  color: Color(colorPimary)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03,
            vertical: size.width * 0.05,
          ),
          child: Column(
            children: _items
                .map((e) => GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      _callback(e[0], context);
                    },
                    child: _itemOption(e)))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _itemOption(List<String> item) => Container(
        padding: EdgeInsets.all(size.width * 0.001),
        margin: EdgeInsets.all(size.width * 0.01),
        decoration: BoxDecoration(
          border: Border.all(
              width: 2.0, color: Color(colorButtonsBar).withOpacity(0.2)),
          borderRadius: BorderRadius.circular(size.width * 0.03),
        ),
        child: ListTile(
          leading: SvgPicture.asset(
            item[0],
            height: size.height * 0.05,
            width: size.width * 0.05,
          ),
          title: Text(
            item[1],
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: size.width * 0.05),
          ),
          subtitle: Text(item[2]),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(colorPimary),
          ),
        ),
      );
}
