import 'package:control_gastos/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;
  const CustomBottomNavbar({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
      case 3:
        context.go('/home/3');
        break;
    }
  }

  void onCentralButtonTapped(BuildContext context) {
    // Acción al tocar el botón central
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: ExpenseForm(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SizedBox(
      height: 90,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 8.0,
            elevation: 0,
            color: theme.surface,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  context,
                  index: 0,
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home,
                  label: 'Home',
                ),
                _buildNavItem(
                  context,
                  index: 1,
                  icon: Icons.pie_chart_outline_outlined,
                  activeIcon: Icons.pie_chart_rounded,
                  label: 'Charts',
                ),
                const SizedBox(width: 60), // Espacio para el botón central
                _buildNavItem(
                  context,
                  index: 2,
                  icon: Icons.calendar_month_outlined,
                  activeIcon: Icons.calendar_month_rounded,
                  label: 'Calendar',
                ),
                _buildNavItem(
                  context,
                  index: 3,
                  icon: Icons.person_outline_outlined,
                  activeIcon: Icons.person,
                  label: 'User',
                ),
              ],
            ),
          ),
          Positioned(
            top: -10,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => onCentralButtonTapped(context),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: theme.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final isSelected = index == currentIndex;
    final theme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => onItemTapped(context, index),
      behavior: HitTestBehavior.translucent,
      child: SizedBox(
        height: 60,
        width: 60,
        child: Column(
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: isSelected ? theme.secondary : theme.onSurface,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? theme.secondary : theme.onSurface,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
