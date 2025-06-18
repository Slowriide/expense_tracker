import 'package:control_gastos/presentation/providers/search/search_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  const ExpenseAppbar(this.title, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final isSearching = ref.watch(isSearchingProvider);
    return AppBar(
      centerTitle: true,
      leading: BackButton(),
      title:
          isSearching
              ? TextField(
                autofocus: false,
                decoration: InputDecoration(
                  hint: Text(
                    'Search...',
                    style: textStyle.bodyLarge!.copyWith(
                      color: Colors.grey.withValues(alpha: 0.8),
                    ),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                onChanged: (value) {
                  ref.read(searchTextProvider.notifier).set(value);
                },
              )
              : Text(title, style: textStyle.titleMedium),
      actionsPadding: EdgeInsets.only(right: 20),
      actions: [
        isSearching
            ? IconButton(
              onPressed: () {
                ref.read(isSearchingProvider.notifier).stop();
                ref.read(searchTextProvider.notifier).clear();
              },
              icon: Icon(Icons.close),
            )
            : IconButton(
              onPressed: () {
                ref.read(isSearchingProvider.notifier).toggle();
              },
              icon: Icon(Icons.search),
            ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
