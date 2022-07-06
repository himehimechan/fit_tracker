import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fit_tracker_eden_farm/modules/profile/profile.dart';

import '../routes/routes.dart';

class Profile extends StatelessWidget {
  final ProfileController profile;

  const Profile(this.profile, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
            () {
              return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          // User card
          BigUserCard(
            cardColor: Theme.of(context).primaryColor,
            userName: profile.userName.value,
            userProfilePic: NetworkImage(profile.userProfilePhoto.value),
            cardActionWidget: SettingsItem(
              icons: Icons.edit,
              iconStyle: IconStyle(
                withBackground: true,
                backgroundColor: Colors.blue,
              ),
              title: "Edit",
              subtitle: "Tap untuk rubah data",
              onTap: () {
                Get.toNamed(Routes.profile_update);
              },
            )
          ),
          // You can add a settings title
          SettingsGroup(
            items: [
              SettingsItem(
                onTap: () {
                  profile.logout();
                },
                icons: Icons.exit_to_app_rounded,
                title: "Keluar",
              ),
            ],
          ),
        ],
      ),
    );
            }
            );
  }
}