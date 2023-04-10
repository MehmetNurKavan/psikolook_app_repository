class Topluluk {
  final String toplulukTitle;
  final String groupId;
  Topluluk({
    required this.toplulukTitle,
    required this.groupId,
  });

  Map<String, dynamic> toMap() {
    return {
      'toplulukTitle': toplulukTitle,
      'groupId': groupId,
    };
  }

  factory Topluluk.fromMap(Map<String, dynamic> map) {
    return Topluluk(
      toplulukTitle: map['toplulukTitle'] ?? '',
      groupId: map['groupId'] ?? '',
    );
  }
}
