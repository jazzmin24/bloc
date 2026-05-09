import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: EquatableTesting(),
    );
  }
}

class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key});

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Person person1 = const Person(name: "John", age: 30);
        const Person person2 = Person(name: "John", age: 30);
        Person person3 = Person(name: "John", age: 30);

        log("message 1: ${person1 == person2}"); // false
        log("message 2: ${person1 == person3}"); // true
        log("message 3: ${person2 == person3}"); // true

        log("hash code 1: ${person1.hashCode}"); // different hash code
        log("hash code 2: ${person2.hashCode}"); // different hash code
        log("hash code 3: ${person3.hashCode}"); // different hash code

        person1 == person2;
        person1 == person3;
        person2 == person3;
      }),
    );
  }
}

class Person {
  final String name;
  final int age;
  const Person({required this.name, required this.age});

  bool operator ==(Object other) {
    return identical(this, other) // same object in memory? shortcut
        ||
        other is Person // is it even a Person?
            &&
            runtimeType == other.runtimeType // exact same class?
            &&
            name == other.name // same name?
            &&
            age == other.age; // same age?
  }

  @override
  int get hashCode => Object.hash(name, age);
}
