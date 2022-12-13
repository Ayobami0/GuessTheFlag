import 'package:flutter/material.dart';

class LoadingError extends StatelessWidget {

  final error;

  const LoadingError({required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children : <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: $error'),
              ),
          ]
        ),
      ),
    ); 
  }
}
