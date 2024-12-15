//import 'package:flutter/material.dart';
import '../models/department.dart'; 


/*
const departmentIcons = {
 Department.computerEngineering: Icons.computer,
  Department.computerScience: Icons.devices,
  Department.cybersecurity: Icons.security,
 Department.artificialIntelligence: Icons.memory
};



enum Department {
  computerEngineering,  // Change from ComEngineering
  computerScience,      // Change from ComputerScience
  cybersecurity,        // Change from Cybersecurity
  artificialIntelligence, // Change from ArtificialIntelligence
}*/



enum Gender {
  male,
  female
}


class Student {
  final String firstName;
  final String lastName;
  final Department department;
  final int grade;
  final Gender gender;

  Student({
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.grade,
    required this.gender,
  });
}
