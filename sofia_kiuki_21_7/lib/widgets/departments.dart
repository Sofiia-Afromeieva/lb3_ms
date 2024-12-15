import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sofia_kiuki_21_7/providers/departments_provider.dart';
import 'package:sofia_kiuki_21_7/widgets/department_item.dart';
import 'package:sofia_kiuki_21_7/providers/students_provider.dart';

class DepartmentsScreen extends ConsumerWidget {
  const DepartmentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final departments = ref.watch(departmentsProvider);
    final students = ref.watch(studentsProvider);

    Map<String, int> studentCounts = {};
    for (final student in students) {
      final deptId = student.department.name;
      studentCounts[deptId] = (studentCounts[deptId] ?? 0) + 1;
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        mainAxisExtent: 180,
      ),
      itemCount: departments.length,
      itemBuilder: (ctx, index) {
        final department = departments[index];
        final studentCount = studentCounts[department.name] ?? 0;
        return DepartmentItem(
          department: department,
          studentCount: studentCount,
        );
      },
    );
  }
}