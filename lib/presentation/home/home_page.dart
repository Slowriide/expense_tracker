import 'package:control_gastos/presentation/presentation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int pageIndex;
  const HomePage({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[
    HomeView(),
    ChartsView(),
    CalendarView(),
    UserView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: pageIndex, children: viewRoutes),
      bottomNavigationBar: CustomBottomNavbar(currentIndex: pageIndex),
    );
  }
}
