class Survey {
  final String uid;
  final String surrveyTitle;
  final String surveyId;
  final String surveyName;
  final String surveyLink;
  Survey({
    required this.uid,
    required this.surrveyTitle,
    required this.surveyId,
    required this.surveyLink,
    required this.surveyName,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'surveyTitle': surrveyTitle,
      'surveyId': surveyId,
      'surveyLink': surveyLink,
      'surveyName': surveyName,
    };
  }

  factory Survey.fromMap(Map<String, dynamic> map) {
    return Survey(
      uid: map['uid'] ?? '',
      surrveyTitle: map['surveyTitle'] ?? '',
      surveyId: map['surveyId'] ?? '',
      surveyLink: map['surveyLink'] ?? '',
      surveyName: map['surveyName'] ?? '',
    );
  }
}
