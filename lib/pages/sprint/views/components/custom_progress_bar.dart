import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentorando/provider/sprint_tasks_provider.dart';
import 'package:progresso/progresso.dart';

class CustomProgressBar extends ConsumerWidget  {
  const CustomProgressBar({ super.key });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressProvider);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 8.0, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Align(
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
                padding: const EdgeInsets.only(right: 30),
                child: Text(
                  '${progress.toStringAsFixed(2)}%',
                  style: const TextStyle(
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
            progress: progress / 100,
            progressStrokeCap: StrokeCap.round,
            backgroundStrokeCap: StrokeCap.round,
          ),
        ),
      ],
    );
  }
}
