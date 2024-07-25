import 'package:flutter/material.dart';

// Example user model for the UI
class User {
  final int id;
  final String name;

  User({required this.id, required this.name});
}

class BillingUserAssignmentWidget extends StatefulWidget {
  @override
  _BillingUserAssignmentWidgetState createState() =>
      _BillingUserAssignmentWidgetState();
}

class _BillingUserAssignmentWidgetState
    extends State<BillingUserAssignmentWidget> {
  final List<User> users = [
    User(id: 1, name: 'Nizar'),
    User(id: 2, name: 'Abdelkarim'),
    User(id: 3, name: 'Mhamad'),
  ];

  final Set<int> selectedUserIds = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          title: Text(user.name),
          trailing: Checkbox(
            value: selectedUserIds.contains(user.id),
            onChanged: (bool? value) {
              setState(() {
                if (value == true) {
                  selectedUserIds.add(user.id);
                } else {
                  selectedUserIds.remove(user.id);
                }
              });
            },
          ),
        );
      },
    );
  }
}
