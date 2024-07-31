import 'package:flutter/material.dart';
import 'package:lms/features/roles_and_premission/data/models/role_model.dart';


class AddNewRoleViewBody extends StatefulWidget {
  const AddNewRoleViewBody({super.key});

  @override
  _AddNewRoleViewBodyState createState() => _AddNewRoleViewBodyState();
}

class _AddNewRoleViewBodyState extends State<AddNewRoleViewBody> {
  final TextEditingController _roleController = TextEditingController();
final List<Role> _roles = [];

  void _addRole() {
    final roleName = _roleController.text.trim();
    if (roleName.isNotEmpty) {
      setState(() {
        _roles.add(Role(name: roleName));
      });
      _roleController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add Bulk Roles',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _roleController,
            decoration: InputDecoration(
              labelText: 'Role Name',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.add),
                onPressed: _addRole,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _roles.length,
              itemBuilder: (context, index) {
                final role = _roles[index];
                return ListTile(
                  title: Text(role.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _roles.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle bulk roles addition logic
              // Example: print the added roles to the console
              for (var role in _roles) {
                print('Role: ${role.name}');
              }
              // Clear the list after processing
              setState(() {
                _roles.clear();
              });
            },
            child: const Text('Add Roles'),
          ),
        ],
      ),
    );
  }
}
