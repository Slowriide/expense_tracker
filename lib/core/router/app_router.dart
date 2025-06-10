import 'package:control_gastos/domain/entities/expense.dart';
import 'package:control_gastos/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0',
  errorBuilder: (context, state) {
    return Scaffold(body: Center(child: Text('Error: ${state.error}')));
  },
  routes: [
    GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        var pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        if (pageIndex > 4 || pageIndex < 0) {
          pageIndex = 0; // Default to the first page if out of bounds
        }
        return HomePage(pageIndex: pageIndex);
      },
      routes: [
        // Add nested routes here if needed
      ],
    ),

    GoRoute(
      path: '/editexpenses',
      builder: (context, state) {
        final extra = state.extra;
        if (extra == null || extra is! Expense) {
          return const Scaffold(
            body: Center(child: Text('Expense data is missing')),
          );
        }

        return EditExpenseView(expense: extra);
      },
    ),
  ],
);
