import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  const ExpenseTile({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
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
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.blue,
                  size: 25,
                ),
              ),
              SizedBox(width: 10),

              //Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Groceries', style: textStyle.bodyMedium),
                  Text(
                    'March 15, 2024',
                    style: textStyle.bodySmall?.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          // Amount spent
          Text(
            '\$45.00',
            style: textStyle.bodyLarge?.copyWith(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
