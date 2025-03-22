import 'package:complex_adaptive_ui/utils/device_type.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HomeAppBar({required this.scaffoldKey, super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Home'),
      centerTitle: true,
      backgroundColor: Colors.white,
      leadingWidth: 60,
      leading:
          DeviceType.isPhone(context)
              ? Padding(
                padding: EdgeInsets.only(left: 20),
                child: IconButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openDrawer();
                  },
                  icon: Row(children: [const Icon(Icons.menu)]),
                ),
              )
              : null,
      actions: [
        DeviceType.isPhone(context)
            ? Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(onPressed: () {}, icon: Row(children: [const Icon(Icons.person)])),
            )
            : Padding(
              padding: EdgeInsets.only(right: 20),
              child: ElevatedButton(
                onPressed: () {},
                child: Row(children: [Text('Профиль'), const Icon(Icons.person)]),
              ),
            ),

      ],
    );
  }
}
