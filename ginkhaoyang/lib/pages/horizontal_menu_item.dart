import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ginkhaoyang/constants/controllers.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function onTap;

  const HorizontalMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => onTap(),
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not hovering");
      },
      child: Container(
        color: menuController.isHovering(itemName) ? Colors.grey[500] : Colors.transparent, // Darker hover color
        child: Row(
          children: [
            Visibility(
              visible: menuController.isHovering(itemName) || menuController.isActive(itemName),
              child: Container(
                width: 6,
                height: 40,
                color: Colors.black,
              ),
              maintainSize: true,
              maintainState: true,
              maintainAnimation: true,
            ),
            SizedBox(width: _width / 80),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  menuController.returnIconFor(itemName),
                  if (!menuController.isActive(itemName))
                    Flexible(
                      child: Text(
                        itemName,
                        style: menuController.isHovering(itemName)
                            ? GoogleFonts.montserrat(color: Colors.black)
                            : GoogleFonts.catamaran(color: Colors.black),
                      ),
                    )
                  else
                    Flexible(
                      child: Text(
                        itemName,
                        style: GoogleFonts.hindMadurai(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
