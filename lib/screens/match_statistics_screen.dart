import 'package:flutter/material.dart';

class MatchStatisticsScreen extends StatefulWidget {
  @override
  _MatchStatisticsScreenState createState() => _MatchStatisticsScreenState();
}

class _MatchStatisticsScreenState extends State<MatchStatisticsScreen> {
  final List<Map<String, dynamic>> _players = [
    {'name': 'Player 1', 'goals': 0, 'assists': 0},
    {'name': 'Player 2', 'goals': 0, 'assists': 0},
    {'name': 'Player 3', 'goals': 0, 'assists': 0},
    {'name': 'Player 4', 'goals': 0, 'assists': 0},
    {'name': 'Player 5', 'goals': 0, 'assists': 0},
  ];

  void _updateStatistic(int index, String stat, int value) {
    setState(() {
      _players[index][stat] = value;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Statistics updated for ${_players[index]['name']}!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match Statistics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _players.length,
          itemBuilder: (context, index) {
            final player = _players[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      player['name'],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatInput(
                            index, 'goals', 'Goals', player['goals']),
                        _buildStatInput(
                            index, 'assists', 'Assists', player['assists']),
                      ],
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

  Widget _buildStatInput(int index, String stat, String label, int value) {
    return Row(
      children: [
        Text('$label: '),
        SizedBox(
          width: 50,
          child: TextFormField(
            initialValue: value.toString(),
            keyboardType: TextInputType.number,
            onChanged: (newValue) {
              final newStatValue = int.tryParse(newValue) ?? 0;
              _updateStatistic(index, stat, newStatValue);
            },
          ),
        ),
      ],
    );
  }
}
