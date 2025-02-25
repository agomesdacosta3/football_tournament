import 'package:flutter/material.dart';

class PlayerInvitationsScreen extends StatefulWidget {
  @override
  _PlayerInvitationsScreenState createState() =>
      _PlayerInvitationsScreenState();
}

class _PlayerInvitationsScreenState extends State<PlayerInvitationsScreen> {
  final List<Map<String, String>> _receivedInvitations = [
    {'teamName': 'Team A', 'from': 'Captain A'},
    {'teamName': 'Team B', 'from': 'Captain B'},
  ];

  void _acceptInvitation(String teamName) {
    setState(() {
      _receivedInvitations
          .removeWhere((invitation) => invitation['teamName'] == teamName);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You joined $teamName!')),
    );
  }

  void _declineInvitation(String teamName) {
    setState(() {
      _receivedInvitations
          .removeWhere((invitation) => invitation['teamName'] == teamName);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You declined the invitation from $teamName.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Received Invitations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _receivedInvitations.isEmpty
            ? Center(
                child: Text(
                  'No invitations received.',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: _receivedInvitations.length,
                itemBuilder: (context, index) {
                  final invitation = _receivedInvitations[index];
                  return Card(
                    child: ListTile(
                      title: Text('From: ${invitation['from']}'),
                      subtitle: Text('Team: ${invitation['teamName']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.check, color: Colors.green),
                            onPressed: () =>
                                _acceptInvitation(invitation['teamName']!),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, color: Colors.red),
                            onPressed: () =>
                                _declineInvitation(invitation['teamName']!),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
