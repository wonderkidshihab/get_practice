import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              PaneItem(icon: const Icon(Icons.home), title: const Text('Home')),
              PaneItem(
                  icon: const Icon(Icons.settings),
                  title: const Text('Settings')),
              PaneItem(
                  icon: const Icon(Icons.info), title: const Text('About')),
            ],
          ),
          content: Obx(
            () => NavigationBody(
              index: controller.selectedIndex.value,
              children: const [
                Center(
                  child: Text('Home'),
                ),
                Center(
                  child: Text('Settings'),
                ),
                Center(
                  child: Text('About'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
