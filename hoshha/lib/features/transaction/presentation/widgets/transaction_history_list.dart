import 'package:flutter/material.dart';
import '../../domain/entities/transaction_entity.dart';
import 'package:intl/intl.dart';

class TransactionHistoryList extends StatelessWidget {
  final String title;
  final List<TransactionEntity> transactions;

  const TransactionHistoryList({
    super.key,
    required this.title,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              letterSpacing: 1.2,
            ),
          ),
        ),
        ...transactions.map((t) => _buildTransactionCard(context, t)),
      ],
    );
  }

  Widget _buildTransactionCard(BuildContext context, TransactionEntity transaction) {
    final isIncome = transaction.type == 'income';
    final formatter = NumberFormat.currency(symbol: 'ريال', decimalDigits: 2, customPattern: '\u00a4 #,##0.00');

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isIncome ? Colors.green.shade100 : Colors.red.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(
                  isIncome ? Icons.account_balance_wallet : Icons.shopping_cart,
                  color: isIncome ? Colors.green.shade700 : Colors.red.shade700,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    transaction.category, // assuming category exists, or fallback to something
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isIncome ? '+' : '-'} ${formatter.format(transaction.amount)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isIncome ? Colors.green.shade700 : Colors.red.shade700,
                ),
                textDirection: TextDirection.ltr,
              ),
              Text(
                transaction.time,
                style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
