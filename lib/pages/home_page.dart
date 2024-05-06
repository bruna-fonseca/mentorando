import 'package:flutter/material.dart';
import 'package:mentorando/components/mentor_tile.dart';
import '../components/simple_text_field.dart';
import '../components/search_button.dart';
import 'package:mentorando/config/mentor_data.dart' as mentor_data;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List filteredMentors = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      filteredMentors = mentor_data.mentorList;
    });
  }

  void _filterMentors(String value) {
    setState(() {
      filteredMentors = mentor_data.mentorList
          .where((mentor) =>
             mentor.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          'Nossos mentores',
          style: TextStyle(color: Color(0xff363B53)),
        ),
    ),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SimpleTextField(
                        labelText: "procure mentores",
                        callback: (String value) {
                          _filterMentors(value);
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    const SearchButton(),
                  ],
                ),
              ),
              // Listagem de mentores
              Expanded(
                child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, index) {
                      return MentorTile(mentorInfo: filteredMentors[index]);
                    },
                    separatorBuilder: (_, index) => const SizedBox(height: 20),
                    itemCount: filteredMentors.length,
                ),
              ),
            ],
          ),
      ),
    );
  }
}