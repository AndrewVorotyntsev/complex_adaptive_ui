import 'package:complex_adaptive_ui/ui/home_chips.dart';
import 'package:complex_adaptive_ui/utils/device_type.dart';
import 'package:flutter/material.dart';

class HomeContentWidget extends StatefulWidget {

  const HomeContentWidget({super.key});

  @override
  State<HomeContentWidget> createState() => _HomeContentWidgetState();
}

class _HomeContentWidgetState extends State<HomeContentWidget> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          if (DeviceType.isTablet(context)) HomeChips(),
          Expanded(
            child: Scrollbar(
              controller: controller,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: SizedBox(
                        width: constraints.maxWidth > 800 ? 800 :constraints.maxWidth,
                        child: ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context).copyWith(
                            scrollbars: false,
                          ),
                          child: GridView.builder(
                            controller: controller,
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 1,
                            ),
                            itemCount: 40,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // Обработчик клика (переход по ссылке или другое действие)
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.7),
                                          offset: Offset(2, 2),
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    child: Image.network(
                                      'https://images.unsplash.com/photo-1510137600163-2729bc6959a6?ixid=eyJhcHBfaWQiOjE0NTg5fQ',
                                      fit: BoxFit.cover,
                                      filterQuality: FilterQuality.high,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        // GridView.builder(
                        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //     crossAxisCount: crossAxisCount,
                        //     // mainAxisExtent: 100,
                        //     childAspectRatio: 1.0, // Пропорции карточки
                        //     crossAxisSpacing: 40, // Расстояние между карточками по горизонтали
                        //     mainAxisSpacing: 40, // Расстояние между карточками по вертикали
                        //   ),
                        //   itemCount: 40, // Количество карточек
                        //   itemBuilder: (context, index) {
                        //     return ColoredBox(
                        //       color: Colors.grey,
                        //       child: Align(
                        //         alignment: index.isOdd ? Alignment.bottomLeft : Alignment.bottomRight,
                        //         child: Container(
                        //           width: itemWidth,
                        //           height: itemWidth,
                        //           color: Colors.blueAccent,
                        //           alignment: Alignment.center,
                        //           child: Text(
                        //             'Card $index',
                        //             style: TextStyle(color: Colors.white, fontSize: 16),
                        //             textAlign: TextAlign.center,
                        //           ),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
