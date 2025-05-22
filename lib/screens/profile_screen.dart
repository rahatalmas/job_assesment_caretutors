import 'package:care_tutor_note_taking_app/constant.dart';
import 'package:care_tutor_note_taking_app/widgets/row_gap.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final profileImage = CircleAvatar(
      radius: 40,
      backgroundImage: AssetImage('assets/image/dp.jpg'),
    );

    final userName = Text('Rahat Almas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
    final email = Text('bmrahatalmas@gmail.com', style: TextStyle(color: Colors.grey[700]));
    final totalNotes = Text('Total Notes: 20', style: TextStyle(color: Colors.grey[600]));

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
                      userName,
                      SizedBox(height: 4),
                      email,
                      SizedBox(height: 4),
                      totalNotes,
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