import 'package:complex_adaptive_ui/ui/home_side_bar.dart';
import 'package:complex_adaptive_ui/ui/home_content_widget.dart';
import 'package:complex_adaptive_ui/utils/device_type.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {

    if (DeviceType.isTablet(context)) {
      return Row(children: [Expanded(flex: 3, child: HomeSideBar()), Expanded(flex: 7, child: HomeContentWidget())]);
    }
    return HomeContentWidget();
  }
}
