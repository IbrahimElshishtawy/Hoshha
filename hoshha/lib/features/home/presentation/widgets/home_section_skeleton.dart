import 'package:flutter/material.dart';

import '../../../../theme/theme_extensions.dart';

class HomeSectionSkeleton extends StatelessWidget {
  const HomeSectionSkeleton.card({super.key, this.height = 220})
    : itemCount = null;

  const HomeSectionSkeleton.list({super.key, this.itemCount = 4})
    : height = null;

  final double? height;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Card(
      child: Padding(
        padding: EdgeInsetsDirectional.all(spacing.lg),
        child: height != null
            ? _CardSkeleton(height: height!)
            : _ListSkeleton(itemCount: itemCount!),
      ),
    );
  }
}

class _CardSkeleton extends StatelessWidget {
  const _CardSkeleton({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final chartHeight = height > 120 ? height - 120 : 0.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SkeletonLine(widthFactor: 0.42, height: 18),
        SizedBox(height: spacing.md),
        const _SkeletonLine(widthFactor: 0.75, height: 54),
        SizedBox(height: spacing.md),
        _SkeletonBox(height: chartHeight),
      ],
    );
  }
}

class _ListSkeleton extends StatelessWidget {
  const _ListSkeleton({required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Column(
      children: [
        for (var index = 0; index < itemCount; index++) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _SkeletonBox.square(size: 40),
              SizedBox(width: spacing.md),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SkeletonLine(widthFactor: 0.5, height: 16),
                    SizedBox(height: 8),
                    _SkeletonLine(widthFactor: 0.35, height: 14),
                  ],
                ),
              ),
              SizedBox(width: spacing.sm),
              const _SkeletonLine(widthFactor: 0.18, height: 16),
            ],
          ),
          if (index != itemCount - 1) SizedBox(height: spacing.md),
        ],
      ],
    );
  }
}

class _SkeletonLine extends StatelessWidget {
  const _SkeletonLine({required this.widthFactor, required this.height});

  final double widthFactor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.hasBoundedWidth
            ? constraints.maxWidth * widthFactor
            : 320.0 * widthFactor;

        return Align(
          alignment: AlignmentDirectional.centerStart,
          child: SizedBox(
            width: width,
            child: _SkeletonBox(height: height),
          ),
        );
      },
    );
  }
}

class _SkeletonBox extends StatelessWidget {
  const _SkeletonBox({required this.height}) : width = double.infinity;

  const _SkeletonBox.square({required double size})
    : width = size,
      height = size;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colors.surfaceContainer,
        borderRadius: BorderRadiusDirectional.circular(context.appRadius.md),
      ),
    );
  }
}
