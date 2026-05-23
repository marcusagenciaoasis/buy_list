import 'package:flutter/material.dart';

class SummaryBar extends StatelessWidget {
  const SummaryBar({
    super.key,
    required this.unmarkedTotal,
    required this.markedTotal,
  });

  final double unmarkedTotal;
  final double markedTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _SummaryColumn(
          title: 'Nao marcados',
          value: 'R\$ ${unmarkedTotal.toStringAsFixed(2)}',
          valueColor: const Color(0xFF2195F2),
        ),
        const SizedBox(width: 24),
        _SummaryColumn(
          title: 'Marcados',
          value: 'R\$ ${markedTotal.toStringAsFixed(2)}',
          valueColor: Colors.green,
        ),
      ],
    );
  }
}

class _SummaryColumn extends StatelessWidget {
  const _SummaryColumn({
    required this.title,
    required this.value,
    required this.valueColor,
  });

  final String title;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.labelSmall;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyle),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.w600, color: valueColor),
        ),
      ],
    );
  }
}
