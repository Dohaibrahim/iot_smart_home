import 'package:IOT_SmartHome/features/family_setup_screens/presentation/widgets/family_id_card.dart';
import 'package:IOT_SmartHome/features/family_setup_screens/presentation/widgets/family_members_list.dart';
import 'package:flutter/material.dart';

class MotherView extends StatelessWidget {
  final String familyId;

  const MotherView({super.key, required this.familyId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          FamilyIdCard(familyId: familyId),
          const SizedBox(height: 20),
          Expanded(
            child: FamilyMembersList(
              familyId: familyId,
              onRemoveMember: (context, userId) {},
              onUpdateMember: (context, userId, firstName, lastName, role) {},
            ),
          ),
        ],
      ),
    );
  }
}
