import 'package:flutter/material.dart';

class TournamentScreen extends StatefulWidget {
  @override
  _TournamentScreenState createState() => _TournamentScreenState();
}

class _TournamentScreenState extends State<TournamentScreen> {
  final _tournamentNameController = TextEditingController();
  final _locationController = TextEditingController();
  final _startDateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final List<String> _availableTeams = [
    'Team Alpha',
    'Team Bravo',
    'Team Charlie',
    'Team Delta'
  ]; // Exemple de liste d'équipes disponibles
  final List<String> _selectedTeams = [];

  void _createTournament() {
    if (_formKey.currentState?.validate() ?? false) {
      // Logique pour sauvegarder le tournoi (à implémenter plus tard)
      print('Tournament Created: ${_tournamentNameController.text}');
      print('Location: ${_locationController.text}');
      print('Start Date: ${_startDateController.text}');
      print('Selected Teams: $_selectedTeams');
    }
  }

  void _toggleTeamSelection(String teamName) {
    setState(() {
      if (_selectedTeams.contains(teamName)) {
        _selectedTeams.remove(teamName);
      } else {
        _selectedTeams.add(teamName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Tournament'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _tournamentNameController,
                  decoration: InputDecoration(labelText: 'Tournament Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tournament name is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Location is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _startDateController,
                  decoration: InputDecoration(labelText: 'Start Date'),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _startDateController.text =
                            '${pickedDate.toLocal()}'.split(' ')[0];
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Start date is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                Text(
                  'Select Teams:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: _availableTeams.map((team) {
                    final isSelected = _selectedTeams.contains(team);
                    return CheckboxListTile(
                      title: Text(team),
                      value: isSelected,
                      onChanged: (bool? value) {
                        _toggleTeamSelection(team);
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _createTournament,
                  child: Text('Create Tournament'),
                ),
                SizedBox(height: 16),
                Text(
                  'Created Tournaments (Coming Soon)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      title: Text('No tournaments yet'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
