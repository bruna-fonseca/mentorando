import 'package:mentorando/models/mentor_model.dart';

MentorModel firstMentor = MentorModel(
    name: "Fulano de tal",
    occupation: "Technical Lead",
    rating: 5.0,
    imgProfile: "assets/mentors/man1.svg"
);

MentorModel fourthMentor = MentorModel(
    name: "Fulana de tal",
    occupation: "Sr. Software Engineer",
    rating: 5.0,
    imgProfile: "assets/mentors/woman4.svg"
);

MentorModel secondMentor = MentorModel(
    name: "Fulano de tal",
    occupation: "Technical Lead",
    rating: 3.0,
    imgProfile: "assets/mentors/man4.svg"
);

MentorModel thirdMentor = MentorModel(
    name: "Fulana de tal",
    occupation: "Sr. Software Engineer",
    rating: 5.0,
    imgProfile: "assets/mentors/woman2.svg"
);

List<MentorModel> mentorList = [
  firstMentor,
  thirdMentor,
  secondMentor,
  fourthMentor,
  thirdMentor,
  firstMentor,
  secondMentor,
  fourthMentor,
];