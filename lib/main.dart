import 'package:flutter/material.dart';
import 'package:football_tournament/screens/home_screen.dart';
import 'screens/invitations_screen.dart';
import 'screens/login_screen.dart';
import 'screens/match_scores_screen.dart';
import 'screens/match_statistics_screen.dart';
import 'screens/player_invitations_screen.dart';
import 'screens/register_screen.dart';
import 'screens/team_members_screen.dart';
import 'screens/team_screen.dart';
import 'screens/tournament_list_screen.dart';
import 'screens/tournament_screen.dart';

void main() {
  runApp(FootballTournamentApp());
}

class FootballTournamentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Tournament',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/team': (context) => TeamScreen(),
        '/invitations': (context) => InvitationsScreen(),
        '/player-invitations': (context) => PlayerInvitationsScreen(),
        '/match-scores': (context) => MatchScoresScreen(),
        '/match-statistics': (context) => MatchStatisticsScreen(),
        '/team-members': (context) => TeamMembersScreen(),
        '/tournaments': (context) => TournamentScreen(),
        '/tournament-list': (context) => TournamentListScreen(),
      },
    );
  }
}
