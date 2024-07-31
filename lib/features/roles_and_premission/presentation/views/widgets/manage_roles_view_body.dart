import 'package:flutter/material.dart';
import 'package:lms/features/roles_and_premission/data/models/role_model.dart';

class ManageRolesViewBody extends StatelessWidget {
  const ManageRolesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Role> roles = [
      Role(name: 'Junior Editor', isAssigned: true),
      Role(name: 'Senior Editor', isAssigned: false),
      Role(name: 'Administrator', isAssigned: true),
      // Add more roles as needed
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Custom roles',
            
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: roles.length,
              itemBuilder: (context, index) {
                final role = roles[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    title: Text(role.name),
                    trailing: Text(
                      role.isAssigned ? 'Assigned' : '',
                      style: TextStyle(color: role.isAssigned ? Colors.blue : Colors.grey),
                    ),
                    onTap: () {
                      // Handle role tap
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

