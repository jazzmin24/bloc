import 'dart:developer';
import 'package:bloc_learning/bloc/counter/counter_bloc.dart';
import 'package:bloc_learning/bloc/slider/slider_bloc.dart';
import 'package:bloc_learning/bloc/toggle/toggle_bloc.dart';
import 'package:equatable/equatable.dart'; //imported equatable package
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => ToggleBloc()),
        BlocProvider(create: (context) => SliderBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    log("Complete widget tree is building");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Toggle Button:  ",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
                BlocBuilder<ToggleBloc, ToggleState>(
                  builder: (context, state) {
                    log("BlocBuilder for ToggleBloc building");
                    return Switch(
                        value: state.toggleValue,
                        onChanged: (value) {
                          context.read<ToggleBloc>().add(ToggleButtonPressed());
                        });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              log("BlocBuilder building");
              return Text("Value: ${state.counterValue}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600));
            }),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(IncrementEvent());
                    },
                    child: const Text("Increment")),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(DecrementEvent());
                    },
                    child: const Text("Decrement")),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<SliderBloc, SliderState>(builder: (context, state) {
              log("BlocBuilder building for Red Container");
              return Container(
                color: Colors.red.withOpacity(state.sliderValue),
                height: 100,
                width: 100,
              );
            }),
            BlocBuilder<SliderBloc, SliderState>(builder: (context, state) {
              log("BlocBuilder building for SliderBloc");
              return Slider(
                  value: state.sliderValue,
                  onChanged: (value) {
                    context
                        .read<SliderBloc>()
                        .add(SliderValueEvent(slider: value));
                  });
            })
          ],
        ),
      ),
    );
  }
}




////---------LEARNING ABOUT EQUATABLE PACKAGE IN FLUTTER---------

//------- WITH EQUATABLE -------
// import 'dart:developer';
// import 'package:equatable/equatable.dart'; //imported equatable package
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: EquatableTesting(),
//     );
//   }
// }

// class EquatableTesting extends StatefulWidget {
//   const EquatableTesting({super.key});

//   @override
//   State<EquatableTesting> createState() => _EquatableTestingState();
// }

// class _EquatableTestingState extends State<EquatableTesting> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         Person person1 = const Person(name: "messi", age: 30);
//         const Person person2 = Person(name: "John", age: 30);
//         Person person3 = Person(name: "John", age: 30);

//         log("message 1: ${person1 == person2}");
//         log("message 2: ${person1 == person3}");
//         log("message 3: ${person2 == person3}");

//         log("hash code 1: ${person1.hashCode}");
//         log("hash code 2: ${person2.hashCode}");
//         log("hash code 3: ${person3.hashCode}");
//       }),
//     );
//   }
// }

// class Person extends Equatable {
//   final String name;
//   final int age;
//   const Person({required this.name, required this.age});

//   // Equatable package automatically generates the == operator and hashCode based on the list of properties provided in the props getter.
//   @override
//   List<Object> get props => [name, age];
// }






//------- WITHOUT EQUATABLE -------
// import 'dart:developer';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: EquatableTesting(),
//     );
//   }
// }

// class EquatableTesting extends StatefulWidget {
//   const EquatableTesting({super.key});

//   @override
//   State<EquatableTesting> createState() => _EquatableTestingState();
// }

// class _EquatableTestingState extends State<EquatableTesting> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         Person person1 = const Person(name: "John", age: 30);
//         const Person person2 = Person(name: "John", age: 30);
//         Person person3 = Person(name: "John", age: 30);

//         log("message 1: ${person1 == person2}"); // false
//         log("message 2: ${person1 == person3}"); // true
//         log("message 3: ${person2 == person3}"); // true

//         log("hash code 1: ${person1.hashCode}"); // different hash code
//         log("hash code 2: ${person2.hashCode}"); // different hash code
//         log("hash code 3: ${person3.hashCode}"); // different hash code

//         person1 == person2;
//         person1 == person3;
//         person2 == person3;
//       }),
//     );
//   }
// }

// class Person {
//   final String name;
//   final int age;
//   const Person({required this.name, required this.age});

//   bool operator ==(Object other) {
//     return identical(this, other) // same object in memory? shortcut
//         ||
//         other is Person // is it even a Person?
//             &&
//             runtimeType == other.runtimeType // exact same class?
//             &&
//             name == other.name // same name?
//             &&
//             age == other.age; // same age?
//   }

//   @override
//   int get hashCode => Object.hash(name, age);
// }
