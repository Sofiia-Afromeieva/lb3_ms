import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/student.dart';
import 'package:sofia_kiuki_21_7/providers/departments_provider.dart';

class StudentsNotifier extends StateNotifier<List<Student>> {
  StudentsNotifier(super.state); 


 void addStudent(Student student) {
    state = [...state, student];
  }

  void editStudent(Student student, int index) {
    final newState = [...state];
    newState[index] = student;
    state = newState;
  }

  void insertStudent(Student student, int index) {
    final newState = [...state];
    newState.insert(index, student);
    state = newState;
  }

  void removeStudent(int index) {
    final newState = [...state];
    newState.removeAt(index);
    state = newState;
  }
}

final studentsProvider = StateNotifierProvider<StudentsNotifier, List<Student>>((ref) {

  final departments = ref.read(departmentsProvider);

  return StudentsNotifier([
    Student(
      firstName: 'Naruto',
      lastName: 'Uzumaki',
      department: departments.firstWhere((d) => d.name == 'Computer Science'),
      grade: 7,
      gender: Gender.male,
    ),
    Student(
      firstName: 'Shalltear',
      lastName: 'Bloodfallen',
      department: departments.firstWhere((d) => d.name == 'Cybersecurity'),
      grade: 9,
      gender: Gender.female,
    ),
    Student(
      firstName: 'Light',
      lastName: 'Yagami',
      department: departments.firstWhere((d) => d.name == 'Computer Engineering'),
      grade: 6,
      gender: Gender.male,
    ),
    Student(
      firstName: 'Nanami',
      lastName: 'Momozono',
      department: departments.firstWhere((d) => d.name == 'Artificial Intelligence'),
      grade: 8,
      gender: Gender.female,
    ),
    Student(
      firstName: 'Joseph',
      lastName: 'Joestar',
      department: departments.firstWhere((d) => d.name == 'Computer Science'),
      grade: 9,
      gender: Gender.male,
    ),
    Student(
      firstName: 'Ferid',
      lastName: 'Bathory',
      department: departments.firstWhere((d) => d.name == 'Cybersecurity'),
      grade: 10,
      gender: Gender.male,
    ),
    Student(
      firstName: 'Lucy',
      lastName: 'Heartfilia',
      department: departments.firstWhere((d) => d.name == 'Computer Engineering'),
      grade: 8,
      gender: Gender.female,
    ),
  ]);
});
