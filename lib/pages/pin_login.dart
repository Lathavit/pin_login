import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PinLogin extends StatefulWidget {
  const PinLogin({super.key});

  @override
  State<PinLogin> createState() => _PinLoginState();
}

class _PinLoginState extends State<PinLogin> {
  var _text = "______";

  Widget buildItem({
    IconData? icon,
    String? label,
    required String number,
    // required num number,
    Color color = Colors.black,
  }) {
    Widget childWidget;

    if (number == "") {
      childWidget = Icon(icon, color: color);
    } else {
      childWidget = Text(
        '$number \n$label',
        textAlign: TextAlign.center,
        style: GoogleFonts.notoSansThai(
          color: color,
          fontSize: 20.0,
        ),
      );
    }

    return InkWell(
      onTap: () {
        setState(() {
          if (number == "" && icon == Icons.close) {
            _text = "______";
          } else if (number == "" && icon == Icons.backspace) {
            int blank = _text.indexOf('_');

            if (blank > 0) {
              _text = _text.replaceRange(blank - 1, blank, '_');
            } else if (_text.length == 6) {
              _text = _text.replaceRange(_text.length - 1, _text.length, '_');
            } else {
              _text = _text.replaceFirst('_', '_');
            }
          } else if (_text.contains('_')) {
            int blank = _text.indexOf('_');
            _text = _text.replaceFirst('_', number, blank);
          }
        });
      },
      child: Container(
        width: 100.0,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        decoration: number != ""
            ? BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
              )
            : null,
        child: Center(child: childWidget),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var itemList = [
      SizedBox(height: 40.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.security,
            size: 65.0,
            color: Colors.black,
          ),
        ],
      ),
      SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "PIN LOGIN",
            style: GoogleFonts.notoSansThai(
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
      SizedBox(height: 60.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _text,
            style: GoogleFonts.poppins(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey),
          ),
        ],
      ),
      SizedBox(height: 100.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildItem(number: "1", label: "one"),
          SizedBox(width: 10.0),
          buildItem(number: "2", label: "two"),
          SizedBox(width: 10.0),
          buildItem(number: "3", label: "three"),
        ],
      ),
      SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildItem(number: "4", label: "four"),
          SizedBox(width: 10.0),
          buildItem(number: "5", label: "five"),
          SizedBox(width: 10.0),
          buildItem(number: "6", label: "six"),
        ],
      ),
      SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildItem(number: "7", label: "seven"),
          SizedBox(width: 10.0),
          buildItem(number: "8", label: "eight"),
          SizedBox(width: 10.0),
          buildItem(number: "9", label: "nine"),
        ],
      ),
      SizedBox(height: 10.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildItem(number: "", icon: Icons.close),
          SizedBox(width: 10.0),
          buildItem(number: "0", label: "zero"),
          SizedBox(width: 10.0),
          buildItem(number: "", icon: Icons.backspace),
        ],
      ),
    ];
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Use the responsive layout for larger screens
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: itemList,
                ),
              ),
            );
          } else {
            // Use a different layout for smaller screens
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: itemList,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
