import 'package:flutter/material.dart';
import 'package:sofia_kiuki_21_7/models/department.dart';

class DepartmentItem extends StatelessWidget {
  final Department department;
  final int studentCount;

  const DepartmentItem({
    super.key,
    required this.department,
    required this.studentCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [department.color.withOpacity(0.6), department.color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            department.name,
            style: theme.textTheme.headlineLarge?.copyWith(color: Colors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Students enrolled: ',
                style: theme.textTheme.bodyLarge?.copyWith(color: Colors.white),
              ),
              Text(
                '$studentCount',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              department.icon,
              size: 32,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
