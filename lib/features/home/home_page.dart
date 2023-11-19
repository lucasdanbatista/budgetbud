import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:line_icons/line_icons.dart';

import '../../utils/extensions/int.dart';
import '../budget_list/budget_list_page.dart';
import '../expense_list/expense_list_page.dart';
import '../settings/settings_page.dart';
import 'widgets/home_page_child.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPageIndex = 0;
  late final pageController = PageController(initialPage: currentPageIndex);
  final pages = <HomePageChild>[
    BudgetListPage(
      controller: GetIt.I(),
    ),
    ExpenseListPage(
      budgetListController: GetIt.I(),
      controller: GetIt.I(),
    ),
    SettingsPage(
      controller: GetIt.I(),
    ),
  ];

  HomePageChild get currentPage => pages[currentPageIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentPage.appBarTitle),
        actions: currentPage.appBarActions,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) => setState(() => currentPageIndex = index),
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: currentPageIndex,
        onTap: (index) async {
          await pageController.animateToPage(
            index,
            curve: Curves.ease,
            duration: 400.milliseconds,
          );
          setState(() => currentPageIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LineIcons.wallet),
            label: 'Orçamentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.moneyBill),
            label: 'Despesas',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.wrench),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
