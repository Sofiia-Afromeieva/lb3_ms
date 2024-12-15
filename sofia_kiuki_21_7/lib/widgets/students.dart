import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sofia_kiuki_21_7/widgets/student_item.dart';
import 'package:sofia_kiuki_21_7/widgets/new_student.dart'; 
import 'package:sofia_kiuki_21_7/providers/students_provider.dart';
import 'package:sofia_kiuki_21_7/models/student.dart';

class StudentsScreen extends ConsumerWidget {
  const StudentsScreen({super.key}); 

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final students = ref.watch(studentsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _openNewStudentModal(context, ref);
            },
          ),
        ],
      ),
      body:  ListView.builder(
        itemCount: students.length,
        itemBuilder: (ctx, index) {
          final student = students[index];
          return Dismissible(
            key: ValueKey(student),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {
              final deletedStudent = students[index];
              final notifier = ref.read(studentsProvider.notifier);

              notifier.removeStudent(index);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Student removed!'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      notifier.insertStudent(deletedStudent, index);
                    },
                  ),
                  duration: const Duration(seconds: 5),
                ),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: InkWell(
              onTap: () {
                _openNewStudentModal(
                  context,
                  ref,
                  student: student,
                  index: index,
                );
              },
              child: StudentItem(student: student),
          ),
        );
      },
    
  ),
);
}

 void _openNewStudentModal(BuildContext context, WidgetRef ref,
    {Student? student, int? index}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (ctx) {
      return SafeArea(
        minimum: const EdgeInsets.only(top: 16),
        child: FractionallySizedBox(
          heightFactor: 0.95,
          child: NewStudent(
            initialStudent: student,
            onSave: (newStudent) {
              final notifier = ref.read(studentsProvider.notifier);
              try {
                if (index != null) {
                  notifier.editStudent(newStudent, index);
                  debugPrint('Editing student at index $index');
                } else {
                  notifier.addStudent(newStudent);
                  debugPrint('Adding new student');
                }
              } catch (e) {
                debugPrint('Error during save: $e');
                ScaffoldMessenger.of(ctx).showSnackBar(
                  SnackBar(
                    content: Text('Error: $e'),
                  ),
                );
              }
            },
          ),
        ),
      );
    },
  );
}
}