import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sofia_kiuki_21_7/models/student.dart';
import 'package:sofia_kiuki_21_7/providers/departments_provider.dart';
import 'package:sofia_kiuki_21_7/models/department.dart';

class NewStudent extends ConsumerStatefulWidget {
  final void Function(Student student) onSave;
  final Student? initialStudent;

  const NewStudent({super.key, required this.onSave, this.initialStudent});

  @override
  ConsumerState<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends ConsumerState<NewStudent> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _gradeController = TextEditingController();
  Department? _selectedDepartment;
  Gender _selectedGender = Gender.male;

  int _firstNameCharCount = 0;
  int _lastNameCharCount = 0;

  @override
  void initState() {
    super.initState();
    if (widget.initialStudent != null) {
      _firstNameController.text = widget.initialStudent!.firstName;
      _lastNameController.text = widget.initialStudent!.lastName;
      _gradeController.text = widget.initialStudent!.grade.toString();
      _selectedDepartment = widget.initialStudent!.department;
      _selectedGender = widget.initialStudent!.gender;

      _firstNameCharCount = widget.initialStudent!.firstName.length;
      _lastNameCharCount = widget.initialStudent!.lastName.length;
    }

    _firstNameController.addListener(() {
      setState(() {
        _firstNameCharCount = _firstNameController.text.length;
      });
    });

    _lastNameController.addListener(() {
      setState(() {
        _lastNameCharCount = _lastNameController.text.length;
      });
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _gradeController.dispose();
    super.dispose();
  }

void _submitData() {
  if (_firstNameController.text.isEmpty ||
      _lastNameController.text.isEmpty ||
      _gradeController.text.isEmpty ||
      int.tryParse(_gradeController.text) == null ||
      _selectedDepartment == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fill all fields correctly.'),
      ),
    );
    return;
  }

  final newStudent = Student(
    firstName: _firstNameController.text,
    lastName: _lastNameController.text,
    department: _selectedDepartment!,
    grade: int.parse(_gradeController.text),
    gender: _selectedGender,
  );

  widget.onSave(newStudent);
  Navigator.of(context).pop();
}


  @override
  Widget build(BuildContext context) {
    final departments = ref.watch(departmentsProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _firstNameController,
            decoration: const InputDecoration(
              labelText: 'First Name',
              counterText: '',
            ),
            maxLength: 50,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '$_firstNameCharCount/50',
              style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          TextField(
            controller: _lastNameController,
            decoration: const InputDecoration(
              labelText: 'Last Name',
              counterText: '',
            ),
            maxLength: 50,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '$_lastNameCharCount/50',
              style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          TextField(
            controller: _gradeController,
            decoration: const InputDecoration(
              labelText: 'Grade',
            ),
            keyboardType: TextInputType.number,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: DropdownButton<Gender>(
              value: _selectedGender,
              items: Gender.values
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender.name.toUpperCase()),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedGender = value!;
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: DropdownButton<Department>(
              value: _selectedDepartment,
              items: departments
                  .map((dept) => DropdownMenuItem(
                        value: dept,
                        child: Row(
                          children: [
                            Icon(dept.icon),
                            const SizedBox(width: 8),
                            Text(dept.name),
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDepartment = value!;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: const Text('Save Student'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
