import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sofia_kiuki_21_7/models/department.dart';

final departmentsProvider = Provider<List<Department>>((ref) {
  return [
    Department(
      id: '1',
      name: 'Computer Engineering',
      icon: Icons.computer,
      color: const Color.fromARGB(255, 4, 106, 195),
    ),
    Department(
      id: '2',
      name: 'Computer Science',
      icon: Icons.science,
      color: const Color.fromARGB(255, 4, 163, 195),
    ),
    Department(
      id: '3',
      name: 'Cybersecurity',
      icon: Icons.security,
      color: const Color.fromARGB(255, 106, 4, 195),
    ),
    Department(
      id: '4',
      name: 'Artificial Intelligence',
      icon: Icons.smart_toy,
      color: const Color.fromARGB(255, 179, 4, 195),
    ),
  ];
});