import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/health_score_cubit.dart';
import '../cubit/health_score_state.dart';
import 'widgets/score_gauge_widget.dart';
import '../../domain/entities/health_score.dart';

class HealthScorePage extends StatefulWidget {
  const HealthScorePage({super.key});

  @override
  State<HealthScorePage> createState() => _HealthScorePageState();
}

class _HealthScorePageState extends State<HealthScorePage> {
  @override
  void initState() {
    super.initState();
    context.read<HealthScoreCubit>().loadHealthScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Hawsha', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCL53v4tra95wan6KuK6l9-NNgbR5BNwbrKIk9KnV-oxMUypLXZ60qhj-sTOK_tBasIeFjs0cH9aWxff5AcCaSss8a49hR2N9wxCeaUJm9WgHH5hs0GeRXSKupsbpd47-HEepWozJt7bOi7ehAHkf4S10M6X7mygGHjDZ4fDogPjGqlLHY4rp3W_EFe8blZH0XgfyvKdawxK2Gb84hb3sF3E-q-0Hui1qqOKnkTKT5j4fISRlmRNT9I9UVmrdgLPjtvuJAE10RxTUBs'),
            ),
          ),
        ],
      ),
      body: BlocBuilder<HealthScoreCubit, HealthScoreState>(
        builder: (context, state) {
          if (state is HealthScoreLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HealthScoreLoaded) {
            final score = state.score;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ScoreGaugeWidget(score: score.overallScore, statusText: score.statusText),
                  const SizedBox(height: 16),
                  const Text('درجة الصحة المالية', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 4),
                  Text('أداؤك المالي في الربع الحالي متميز ومستقر', style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurfaceVariant)),
                  const SizedBox(height: 32),
                  _buildAiTip(context, score.aiTip),
                  const SizedBox(height: 32),
                  _buildDetailedScores(context, score.detailedScores),
                  const SizedBox(height: 32),
                  _buildTrendSection(context, score.last3MonthsTrend),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('تحسين الدرجة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 80), // spacing for bottom bar
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildAiTip(BuildContext context, String aiTip) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.smart_toy, color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('نصيحة الذكاء الاصطناعي', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(aiTip, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 14, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedScores(BuildContext context, List<DetailedScore> scores) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: scores.length,
      itemBuilder: (context, index) {
        final ds = scores[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.stars, color: Theme.of(context).colorScheme.primary), // simplify icons
              const SizedBox(height: 8),
              Text(ds.title, style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.onSurfaceVariant)),
              const SizedBox(height: 4),
              Text('${ds.score}/100', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).colorScheme.primary)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTrendSection(BuildContext context, List<int> trend) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('اتجاه الصحة المالية', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('آخر 3 أشهر', style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.onSurfaceVariant)),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildTrendBar(context, 'أكتوبر', trend[0], 0.3),
              _buildTrendBar(context, 'نوفمبر', trend[1], 0.6),
              _buildTrendBar(context, 'ديسمبر', trend[2], 1.0, isBold: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrendBar(BuildContext context, String month, int score, double heightFactor, {bool isBold = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 40,
          height: 80 * heightFactor,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(isBold ? 1.0 : 0.4),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
        ),
        const SizedBox(height: 8),
        Text(month, style: TextStyle(fontSize: 10, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}
