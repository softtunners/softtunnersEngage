import 'package:engage/view/widgets/engageProfile/profileView.dart';
import 'package:flutter/material.dart';

class EngageProfile extends StatelessWidget {
  const EngageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ProfileView(name: '', designation: '', bio: 'prachi mam i really love you so much', mobileNo: '', email: '', dob: '', joinedDate: '', department: '', profile: ''));
  }
}
