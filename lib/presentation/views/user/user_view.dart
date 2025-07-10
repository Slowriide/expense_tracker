import 'package:control_gastos/presentation/views/user/widgets/settings_tile.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screen.height * 0.1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(minRadius: 100),
                SizedBox(height: 10),
                Text(
                  'Leandro paredes',
                  style: textStyle.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text('leandroparedes@gmail.com', style: textStyle.bodySmall),
                SizedBox(height: 10),
                SettingsTile(text: 'Settings'),
                SettingsTile(text: 'Category'),
                SettingsTile(text: 'Currency'),
                SettingsTile(text: 'Rate'),
                SettingsTile(text: 'Privacy Policy'),
                SettingsTile(text: 'Export account'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
