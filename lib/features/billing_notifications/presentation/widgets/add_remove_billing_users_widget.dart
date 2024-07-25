// lib/features/billing_notifications/presentation/widgets/add_remove_billing_users_widget.dart

import 'package:flutter/material.dart';

class AddRemoveBillingUsersWidget extends StatefulWidget {
  @override
  _AddRemoveBillingUsersWidgetState createState() =>
      _AddRemoveBillingUsersWidgetState();
}

class _AddRemoveBillingUsersWidgetState
    extends State<AddRemoveBillingUsersWidget> {
  final List<String> _users = []; // List to hold users
  final TextEditingController _userController = TextEditingController();

  void _addUser() {
    final user = _userController.text;
    if (user.isNotEmpty) {
      setState(() {
        _users.add(user);
        _userController.clear();
      });
    }
  }

  void _removeUser(int index) {
    setState(() {
      _users.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Manage Billing Users',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _userController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter User Email',
            ),
            onSubmitted: (_) => _addUser(), // Add user on enter
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _addUser,
            child: const Text('Add User'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_users[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () => _removeUser(index),
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
