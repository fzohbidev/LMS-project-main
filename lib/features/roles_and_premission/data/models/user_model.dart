class User {
  final String name;
  final String email;
  final String role;
  final String status;
  final String invitedDate;
  final int daysToExpire;

  User({
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    required this.invitedDate,
    required this.daysToExpire,
  });
}
