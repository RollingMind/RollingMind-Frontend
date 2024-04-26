import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  AppBar appBar;
  String title;
  bool isBack, isList, isAlarm;
  BaseAppBar(this.appBar, this.title, this.isBack, this.isList, this.isAlarm,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
      centerTitle: true,
      toolbarHeight: 80,
      surfaceTintColor: Colors.white,
      elevation: 5,
      shadowColor: Colors.black54,
      leading: (isBack)
          ? IconButton(
              icon: Image.asset("assets/mingcute_left-line.png",
                  width: 30, height: 30),
              onPressed: null,
              padding: EdgeInsets.all(16),
            )
          : (isList)
              ? IconButton(
                  icon: Image.asset("assets/option-line.png",
                      width: 30, height: 30),
                  onPressed: null,
                  padding: EdgeInsets.all(16),
                )
              : null,
      actions: [
        if (isAlarm)
          IconButton(
            onPressed: null,
            icon: Image.asset("assets/tabler_bell-filled.png",
                width: 30, height: 30),
            padding: EdgeInsets.all(16),
          )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
