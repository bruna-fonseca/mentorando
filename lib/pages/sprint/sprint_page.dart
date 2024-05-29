import 'package:flutter/material.dart';
import 'package:mentorando/pages/sprint/components/custom_progress_bar.dart';
import 'package:mentorando/pages/sprint/components/sprint_card.dart';

class SprintPage extends StatelessWidget {
  const SprintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text("Progresso da sua Sprint"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomProgressBar(),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
              child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return const SprintCard();
                  },
                  separatorBuilder: (_, index) => const SizedBox(height: 20),
                  itemCount: 2,
              ),
            ),
        ],
        ),
      ),
    );
  }
}
