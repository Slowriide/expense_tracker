import 'package:control_gastos/presentation/views/home/expenses_view.dart';
import 'package:control_gastos/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    var sizedBox10 = SizedBox(height: 12);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome User', style: textStyle.titleMedium),
              sizedBox10,
              Text('Summary of your finances', style: textStyle.bodyMedium),
              sizedBox10,
              BalanceBox(textStyle: textStyle),
              sizedBox10,
              Row(
                children: [
                  Text('Last Expenses', style: textStyle.bodyLarge),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See all',
                      style: textStyle.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  sizedBox10,
                ],
              ),
              Expanded(child: ExpensesView()),
            ],
          ),
        ),
      ),
    );
  }
}
