import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:get_practice/app/modules/home/views/cart_section_view.dart';
import 'package:get_practice/app/modules/home/views/home_section_view.dart';
import 'package:get_practice/app/modules/usbdevices/views/usbdevices_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      home: Obx(
        () => NavigationView(
          pane: NavigationPane(
            selected: controller.selectedIndex.value,
            onChanged: (index) => controller.selectedIndex.value = index,
            items: <NavigationPaneItem>[
              PaneItem(
                icon: const Icon(FluentIcons.home),
                title: const Text('Home'),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.shopping_cart),
                title: const Text('Cart'),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.accounts),
                title: const Text('Account'),
              ),
              PaneItem(
                icon: const Icon(FluentIcons.usb),
                title: const Text('USB Checker'),
              ),
            ],
          ),
          content: Obx(
            () => NavigationBody(
              index: controller.selectedIndex.value,
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              children: [
                HomeSectionView(),
                const CartSectionView(),
                const Center(
                  child: Text('Account'),
                ),
                UsbdevicesView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
