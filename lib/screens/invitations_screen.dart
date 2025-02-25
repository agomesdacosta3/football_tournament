import 'package:flutter/material.dart';

class InvitationsScreen extends StatefulWidget {
  @override
  _InvitationsScreenState createState() => _InvitationsScreenState();
}

class _InvitationsScreenState extends State<InvitationsScreen> {
  final List<String> _availablePlayers = ['Player1', 'Player2', 'Player3']; // Liste temporaire
  final List<String> _sentInvitations = []; // Invitations envoyées

  void _sendInvitation(String player) {
    setState(() {
      _availablePlayers.remove(player);
      _sentInvitations.add(player);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Invitation sent to $player')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Invitations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Available Players',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _availablePlayers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_availablePlayers[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () => _sendInvitation(_availablePlayers[index]),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Text(
              'Sent Invitations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _sentInvitations.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_sentInvitations[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
