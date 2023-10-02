import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
          child: Row(
            children: [
              ImageWidget(), //child property of container
              const SizedBox(
                width: 20,
              ),
              TextWidget()
            ],
          ),
        ),
      ),
    );
  }

  Column TextWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Title'),
            Checkbox(
              value: isDone,
              onChanged: (value) {
                setState(() {
                  isDone = !isDone;
                });
              },
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text('Subtitle'),
        const SizedBox(
          height: 20,
        ),
        btnWidget(),
      ],
    );
  }

  Row btnWidget() {
    return Row(
      children: [
        Container(
          width: 80,
          height: 28,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 67, 84, 76),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.timelapse,
                color: Color.fromARGB(255, 241, 231, 196),
                size: 18,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'time',
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 241, 231, 196)),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Container(
          width: 80,
          height: 28,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 241, 231, 196),
            borderRadius: BorderRadius.circular(18),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.edit,
                color: Color.fromARGB(255, 67, 84, 76),
                size: 18,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'edit',
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 67, 84, 76)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 130,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        image: DecorationImage(
            image: AssetImage("assets/image/33.png"), fit: BoxFit.cover),
      ),
    );
  }
}
