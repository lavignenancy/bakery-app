import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.showTag = false});

  final String title;
  final bool showTag;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        if (showTag) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFDFF3E4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.check,
                size: 14, color: Color(0xFF34A853)),
          ),
        ],
      ],
    );
  }
}
