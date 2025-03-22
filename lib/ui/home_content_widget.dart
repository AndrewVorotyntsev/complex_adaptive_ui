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

  bool _isButtonVisible = false;
  double _buttonSize = 100.0;
  double _lastOffset = 0.0;

  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {}
        return true;
      },
      child: Stack(
        children: [
          Center(
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
                              width: constraints.maxWidth > 800 ? 800 : constraints.maxWidth,
                              child: ScrollConfiguration(
                                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
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
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (DeviceType.isPhone(context))
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: AnimatedOpacity(
                  opacity: _isButtonVisible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 200),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: 50,
                    width: _buttonSize,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(30)),
                    child: InkWell(child: Text('Button'), onTap: () {}),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _scrollListener() {
    // Определяем направление прокрутки
    print(controller.offset);
    if (controller.offset < 100) {
      _isButtonVisible = false;
    } else if (controller.offset > _lastOffset) {
      // Прокрутка вниз, скрываем кнопку
      setState(() {
        _isButtonVisible = false;
      });
    } else if (controller.offset < _lastOffset) {
      // Прокрутка вверх, показываем кнопку
      setState(() {
        _isButtonVisible = true;
      });
    }

    // Обновляем последнюю позицию прокрутки
    _lastOffset = controller.offset;

    // Изменяем размер кнопки в зависимости от прокрутки
    setState(() {
      _buttonSize = (controller.offset > 1000) ? 150.0 : 100;
    });
  }
}
