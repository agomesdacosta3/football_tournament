import 'package:flutter/material.dart';

class TeamScreen extends StatefulWidget {
  @override
  _TeamScreenState createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  final _teamNameController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _createTeam() {
    if (_formKey.currentState?.validate() ?? false) {
      // Logique pour sauvegarder l'équipe (à implémenter plus tard)
      print('Team Created: ${_teamNameController.text}');
      print('Description: ${_descriptionController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Team'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _teamNameController,
                decoration: InputDecoration(labelText: 'Team Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Team name is required';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _createTeam,
                child: Text('Create Team'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/invitations');
                },
                child: Text('Manage Invitations'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/player-invitations');
                },
                child: Text('View Received Invitations'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/match-scores');
                },
                child: Text('Enter Match Scores'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/team-members');
                },
                child: Text('Manage Team Members'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tournaments');
                },
                child: Text('Manage Tournaments'),
              ),
              SizedBox(height: 16),
              Text(
                'Team Members (Coming Soon)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView(
                  children: [
                    // Cette liste sera remplie plus tard
                    ListTile(
                      title: Text('No members yet'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
