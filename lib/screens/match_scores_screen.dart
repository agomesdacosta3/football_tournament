import 'package:flutter/material.dart';

class MatchScoresScreen extends StatefulWidget {
  @override
  _MatchScoresScreenState createState() => _MatchScoresScreenState();
}

class _MatchScoresScreenState extends State<MatchScoresScreen> {
  final List<Map<String, dynamic>> _matches = [
    {'teamA': 'Team 1', 'teamB': 'Team 2', 'scoreA': 0, 'scoreB': 0},
    {'teamA': 'Team 3', 'teamB': 'Team 4', 'scoreA': 0, 'scoreB': 0},
  ];

  void _updateScore(int index, String team, int score) {
    setState(() {
      _matches[index][team] = score;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Score updated for match ${index + 1}!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match Scores'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _matches.length,
          itemBuilder: (context, index) {
            final match = _matches[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${match['teamA']} vs ${match['teamB']}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildScoreInput(index, 'scoreA', match['scoreA']),
                        _buildScoreInput(index, 'scoreB', match['scoreB']),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/match-statistics');
                      },
                      child: Text('Enter Player Statistics'),
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

  Widget _buildScoreInput(int index, String team, int score) {
    return Row(
      children: [
        Text('${team == "scoreA" ? "Team A" : "Team B"} Score: '),
        SizedBox(
          width: 50,
          child: TextFormField(
            initialValue: score.toString(),
            keyboardType: TextInputType.number,
            onChanged: (newValue) {
              final newScore = int.tryParse(newValue) ?? 0;
              _updateScore(index, team, newScore);
            },
          ),
        ),
      ],
    );
  }
}
