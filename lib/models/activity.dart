class Activity {
  final String name;
  final String? notes;
  final DateTime createdAt;

  Activity({required this.name, this.notes}) : createdAt = DateTime.now();
}
