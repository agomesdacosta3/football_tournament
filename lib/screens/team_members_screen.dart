import 'package:flutter/material.dart';

class TeamMembersScreen extends StatefulWidget {
  @override
  _TeamMembersScreenState createState() => _TeamMembersScreenState();
}

class _TeamMembersScreenState extends State<TeamMembersScreen> {
  final List<String> _teamMembers = ['Player 1', 'Player 2', 'Player 3'];

  void _addMember(String memberName) {
    setState(() {
      _teamMembers.add(memberName);
    });
  }

  void _removeMember(int index) {
    setState(() {
      _teamMembers.removeAt(index);
    });
  }

  void _showAddMemberDialog() {
    final TextEditingController _memberNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Member'),
          content: TextField(
            controller: _memberNameController,
            decoration: InputDecoration(labelText: 'Member Name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_memberNameController.text.isNotEmpty) {
                  _addMember(_memberNameController.text);
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Members'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _teamMembers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_teamMembers[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeMember(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _showAddMemberDialog,
              child: Text('Add Member'),
            ),
          ),
        ],
      ),
    );
  }
}
