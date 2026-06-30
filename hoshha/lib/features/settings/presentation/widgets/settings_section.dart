import 'package:flutter/material.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: _buildChildrenWithDividers(context),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  List<Widget> _buildChildrenWithDividers(BuildContext context) {
    final List<Widget> items = [];
    for (int i = 0; i < children.length; i++) {
      items.add(children[i]);
      if (i < children.length - 1) {
        items.add(
          Divider(
            height: 1,
            thickness: 1,
            color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.3),
            indent: 16,
            endIndent: 16,
          ),
        );
      }
    }
    return items;
  }
}
