import 'package:flutter/material.dart';

class TournamentListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _tournaments = [
    {
      'name': 'Tournament 1',
      'location': 'Paris',
      'date': '2025-02-01',
      'teams': ['Team Alpha', 'Team Bravo', 'Team Charlie', 'Team Delta'],
    },
    {
      'name': 'Tournament 2',
      'location': 'Lyon',
      'date': '2025-03-10',
      'teams': ['Team Echo', 'Team Foxtrot', 'Team Golf', 'Team Hotel'],
    },
  ]; // Liste temporaire pour les tests

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tournaments'),
      ),
      body: ListView.builder(
        itemCount: _tournaments.length,
        itemBuilder: (context, index) {
          final tournament = _tournaments[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(tournament['name']),
              subtitle:
                  Text('${tournament['location']} - ${tournament['date']}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TournamentDetailScreen(
                      tournament: tournament,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class TournamentDetailScreen extends StatelessWidget {
  final Map<String, dynamic> tournament;

  const TournamentDetailScreen({required this.tournament});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tournament['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location: ${tournament['location']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Date: ${tournament['date']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Teams:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView(
                children: tournament['teams']
                    .map<Widget>((team) => ListTile(title: Text(team)))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
