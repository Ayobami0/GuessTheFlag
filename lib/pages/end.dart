import 'package:flutter/material.dart';

class FinishPage extends StatelessWidget {
  const FinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 90), 
              const Text('You scored 10/24'),
              const Text(
                'Would You like to play again',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 90), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {}, 
                    icon: const Icon(Icons.close),
                    iconSize: 40,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.done),
                    iconSize: 40,
                  )
                ],
              ),
            ],
      )),
    );
  }
}
