import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsTile extends StatelessWidget {
  final String text;

  const SettingsTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final route = '/${text.replaceAll(' ', '').toLowerCase()}';

    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon and text for the expense category
            Row(
              children: [
                //icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.ac_unit_outlined, size: 25),
                ),
                SizedBox(width: 10),

                //Text
                Text(text),
              ],
            ),

            Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      ),
    );
  }
}
