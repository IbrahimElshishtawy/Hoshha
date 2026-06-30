import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/transaction_cubit.dart';
import '../cubit/transaction_state.dart';
import 'widgets/transaction_history_list.dart';
import 'widgets/transaction_filter_chip.dart';
import '../../domain/entities/transaction.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key});

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  String _selectedFilter = 'الكل';

  final List<String> _filters = [
    'الكل',
    'دخل',
    'منصرف',
    'اشتراكات',
  ];

  @override
  void initState() {
    super.initState();
    context.read<TransactionCubit>().loadTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('سجل المعاملات', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Filters
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: _filters.map((filter) {
                return TransactionFilterChip(
                  label: filter,
                  isSelected: _selectedFilter == filter,
                  onTap: () {
                    setState(() {
                      _selectedFilter = filter;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          // Transactions List
          Expanded(
            child: BlocBuilder<TransactionCubit, TransactionState>(
              builder: (context, state) {
                if (state is TransactionLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is TransactionLoaded) {
                  // For demo, just splitting the list arbitrarily
                  final today = state.transactions.take(2).toList();
                  final yesterday = state.transactions.skip(2).toList();
                  
                  return ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      TransactionHistoryList(
                        title: 'اليوم',
                        transactions: today,
                      ),
                      TransactionHistoryList(
                        title: 'أمس',
                        transactions: yesterday,
                      ),
                      const SizedBox(height: 24),
                      // Infinite Scroll Loader
                      Center(
                        child: Column(
                          children: [
                            const CircularProgressIndicator(),
                            const SizedBox(height: 8),
                            Text(
                              'جاري تحميل المزيد من المعاملات...',
                              style: TextStyle(
                                fontSize: 10,
                                color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.4),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 80), // Fab space
                    ],
                  );
                } else if (state is TransactionError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
