import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 8.0, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Em Curso",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff363B53),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Text(
                  "50%",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff363B53),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22.0, right: 22.0),
          child: Progresso(
            progressColor: const Color(0xff18F313),
            progress: 0.5,
            progressStrokeCap: StrokeCap.round,
            backgroundStrokeCap: StrokeCap.round,
          ),
        ),
      ],
    );
  }
}
