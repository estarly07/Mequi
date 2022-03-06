import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:mequi/Utils/values/colors.dart';
import 'package:mequi/Utils/views/widgets/widgets.dart';

class TransactionSentPage extends StatelessWidget {
  const TransactionSentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Appbar(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.02,
                        horizontal: size.width * 0.03),
                    child: Text(
                      "Envía plata",
                      style: TextStyle(
                          fontSize: size.width * 0.08,
                          fontWeight: FontWeight.bold,
                          color: Color(colorPimary)),
                    ),
                  ),
                  TextFieldCustom(
                    hint: "Cel",
                    icon: Icons.person_add_outlined,
                    inputType: TextInputType.phone,
                    lenght: 10,
                    inputFormatter: FilteringTextInputFormatter.digitsOnly,
                    click: () {},
                  ),
                  TextFieldCustom(
                    hint: "¿Cuánto?",
                    inputType: TextInputType.number,
                    lenght: 10,
                    click: () {},
                  ),
                  TextFieldCustom(
                    hint: "Mensaje",
                    expanded: true,
                    inputType: TextInputType.multiline,
                    click: () {},
                  ),
                ],
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonCircleCusttom(
                    text: "Sigue",
                    textColor: colorBar,
                    backgroundColor: colorPink,
                    click: () {},
                  )),
            ],
          ),
        ),
      )),
    );
  }
}

class _Appbar extends StatefulWidget {
  const _Appbar({
    Key? key,
  }) : super(key: key);

  @override
  State<_Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<_Appbar> {
  bool showInfo = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      height: showInfo ? size.height * 0.15 : size.height * 0.08,
      duration: Duration(milliseconds: 500),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.arrow_back,
                size: size.width * 0.1,
                color: Color(colorPimary),
              ),
              trailing: GestureDetector(
                onTap: () => setState(() {
                  showInfo = !showInfo;
                }),
                child: Icon(
                  showInfo
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  size: size.width * 0.1,
                  color: Color(colorPimary),
                ),
              ),
            ),
            showInfo
                ? ListTile(
                    leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Disponible",
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: size.height * 0.01),
                        Text("Todo",
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                            )),
                      ],
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("\$ 0",
                            style: TextStyle(
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: size.height * 0.01),
                        Text("\$ 800000000",
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                            )),
                      ],
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
