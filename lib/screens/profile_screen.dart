import 'package:care_tutor_note_taking_app/constant.dart';
import 'package:care_tutor_note_taking_app/providers/notes_provider.dart';
import 'package:care_tutor_note_taking_app/providers/user_provider.dart';
import 'package:care_tutor_note_taking_app/widgets/row_gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final profileImage = CircleAvatar(
      radius: 40,
      backgroundImage: AssetImage('assets/image/dp.jpg'),
    );

    final UserProvider userProvider = Get.find<UserProvider>();
    final NotesProvider noteProvider = Get.find<NotesProvider>();
    return ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileImage,
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userProvider.currentUser.value!.username),
                      SizedBox(height: 4),
                      Text(userProvider.currentUser.value!.email),
                      SizedBox(height: 4),
                      Text(noteProvider.notes.length.toString()),
                    ],
                  ),
                )
              ],
            ),
            RowGap(),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorPrimary,
                borderRadius: BorderRadius.circular(8)
              ),
              child: InkWell(
                onTap: () {},
                child: Text('Edit Profile',style: TextStyle(color: neutralWhite),),
              ),
            ),
            RowGap(),
            RowGap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.code),
                    SizedBox(width: 8),
                    Text(
                      'Programming Profiles',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Icon(Icons.shuffle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileRow('Codeforces', 'rahat_almas'),
                profileRow('LeetCode', 'rahat_almas'),
                profileRow('HackerRank', 'rahat_almas'),
              ],
            ),
            RowGap(),
            RowGap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.code),
                    SizedBox(width: 8),
                    Text(
                      'Social Media',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Icon(Icons.shuffle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileRow('LinkedIn', '@almaslink'),
                profileRow('GitHub', '@rahatalmas'),
                profileRow('Twitter', '@almastweet'),
              ],
            ),
          ],
        );
  }
}
  Widget profileRow(String platform, String handle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text('$platform: ',
              style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(handle)),
        ],
      ),
    );
  }