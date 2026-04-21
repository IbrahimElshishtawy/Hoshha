import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class ExpenseGroupSection extends StatelessWidget {
  const ExpenseGroupSection({
    super.key,
    required this.title,
    required this.totalAmountText,
    required this.children,
  });

  final String title;
  final String totalAmountText;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: spacing.xs,
            end: spacing.xs,
            bottom: spacing.sm,
          ),
          child: Row(
            children: [
              Expanded(child: Text(title, style: theme.textTheme.titleMedium)),
              SizedBox(width: spacing.sm),
              Text(
                totalAmountText,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: colors.primary,
                ),
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            children: [
              for (var index = 0; index < children.length; index++) ...[
                children[index],
                if (index != children.length - 1)
                  Divider(height: 1, indent: spacing.md, endIndent: spacing.md),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
