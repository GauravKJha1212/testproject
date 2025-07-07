import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../providers/activity_provider.dart';
import '../models/activity.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? _quote;
  bool _loading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchQuote();
  }

  Future<void> _fetchQuote() async {
    setState(() { _loading = true; });
    try {
      final response = await http.get(Uri.parse('https://favqs.com/api/qotd'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _quote = data['quote']['body'];
          _loading = false;
        });
      } else {
        setState(() { _quote = 'Failed to load quote'; _loading = false; });
      }
    } catch (e) {
      setState(() { _quote = 'Error fetching quote'; _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    final activities = context.watch<ActivityProvider>().activities;
    final String user = ModalRoute.of(context)?.settings.arguments as String? ?? 'User';
    final date = DateFormat.yMMMMd().add_jm().format(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Text('Hello, ' + user + '!', style: Theme.of(context).textTheme.headline6),
                Text(date),
                const SizedBox(height: 16),
                Text('Wellness Tasks:', style: Theme.of(context).textTheme.subtitle1),
                ...activities.map((Activity a) => ListTile(title: Text(a.name), subtitle: a.notes != null ? Text(a.notes!) : null)),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/add'),
                  child: const Text('Add Activity'),
                ),
                const SizedBox(height: 16),
                if (_loading)
                  const CircularProgressIndicator()
                else if (_quote != null)
                  Text('"' + _quote! + '"', style: const TextStyle(fontStyle: FontStyle.italic)),
              ],
            ),
          );
        },
      ),
    );
  }
}
