import 'package:flutter/material.dart';

class TicTacToeBoard extends StatelessWidget {
  const TicTacToeBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.7,
        maxWidth: 500,
      ),
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white24,
              ),
            ),
            child: Center(
              child: Text(
                "X",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 100,
                  shadows: [
                    const Shadow(
                      blurRadius: 40,
                      color: Colors.deepPurple,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
