import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../state/nav_state.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  final primaryColor = const Color(0xff4338CA);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<ProviderNav>(context);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: const Offset(0, -0.1),
              spreadRadius: 4,
              blurRadius: 15)
        ],
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Colors.grey.shade100,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25.0, right: 25.0, top: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconBottomBar2(
                text: "",
                icon: Icons.fastfood_outlined,
                selected: navProvider.pageIndex == 0,
                onPressed: () {
                  navProvider.changePageTo(0, 'HomeScreen');
                }),
            IconBottomBar2(
                text: "",
                icon: Icons.directions_car,
                selected: navProvider.pageIndex == 1,
                onPressed: () {
                  navProvider.changePageTo(1, 'HomeScreen');
                }),
            IconBottomBar2(
                text: "Home",
                icon: Icons.home,
                selected: navProvider.pageIndex == 2,
                onPressed: () {
                  navProvider.changePageTo(2, 'HomeScreen');
                }),
            IconBottomBar2(
                text: "Cart",
                icon: Icons.school,
                selected: navProvider.pageIndex == 3,
                onPressed: () {
                  navProvider.changePageTo(3, 'HomeScreen');
                }),
            IconBottomBar2(
                text: "Account",
                icon: Icons.person_outline,
                selected: navProvider.pageIndex == 4,
                onPressed: () {
                  navProvider.changePageTo(4, 'User Details');
                })
          ],
        ),
      ),
    );
  }
}

class IconBottomBar2 extends StatelessWidget {
  IconBottomBar2(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final primaryColor = Color(0xFF1D2228);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 22,
      backgroundColor: selected ? Color(0xFF1D2228) : Colors.transparent,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 25,
          color: selected ? Colors.white : Colors.black54,
        ),
      ),
    );
  }
}
