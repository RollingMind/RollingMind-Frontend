import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String title;
  final bool isBack, isList, isAlarm;
  const BaseAppBar(
    this.appBar,
    this.title,
    this.isBack,
    this.isList,
    this.isAlarm,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
        )
      ),
      centerTitle: true,
      toolbarHeight: 80,
      surfaceTintColor: Colors.white,
      elevation: 5,
      shadowColor: Colors.black54,
      leading: 
      (isBack) ? IconButton(
                  icon: Image.asset(
                    "assets/mingcute_left-line.png",
                    width: 30,
                    height: 30
                  ),
                  onPressed: () => Get.offNamed("/"),
                  padding: EdgeInsets.only(left: 16),
                )
      : (isList) ? IconButton(
                    icon:Image.asset(
                      "assets/option-line.png",
                      width: 30,
                      height: 30
                    ),
                    onPressed: null,
                    padding: EdgeInsets.only(left: 16),
                  )
      : null,
      automaticallyImplyLeading: false,
      actions: [
        if (isAlarm)
          IconButton(
            onPressed: null,
            icon: Image.asset(
              "assets/tabler_bell-filled.png",
              width: 30,
              height: 30
            ),
            padding: EdgeInsets.only(right: 16),
          )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70);
}
