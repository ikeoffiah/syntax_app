/// Represents a question in the application.
/// Contains details such as question ID, text, code snippet, difficulty level,
/// a list of options, and the category the question belongs to.
class QuestionModel {
  // Category the question belongs to

  /// Constructor for creating an instance of QuestionModel.
  QuestionModel({
    required this.id,
    required this.text,
    required this.hasCode,
    required this.difficulty,
    required this.options,
    required this.category,
    this.codeSnippet,
  });

  /// Factory method to parse JSON data into a `QuestionModel` instance.
  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json['id'],
        text: json['text'],
        codeSnippet: json['code_snippet'],
        hasCode: json['has_code'],
        difficulty: json['difficulty'],
        options: (json['options'] as List<dynamic>) // Parses options from JSON
            .map(
              (option) => OptionModel.fromJson(option),
            ) // Maps JSON data to OptionModel
            .toList(),
        category: CategoryModel.fromJson(
          json['category'],
        ), // Maps JSON data to CategoryModel
      );
  final int id; // Unique identifier for the question
  final String text; // The text/content of the question
  final String?
      codeSnippet; // Optional code snippet associated with the question
  final bool hasCode; // Indicates if the question has a code snippet
  final String difficulty; // Difficulty level of the question
  final List<OptionModel>
      options; // List of options for the multiple-choice question
  final CategoryModel category;
}

/// Represents an option in a multiple-choice question.
/// This includes information such as whether it is the correct answer
/// and an explanation for its correctness or incorrectness.
class OptionModel {
  // Explanation of why this answer is correct or incorrect

  /// Constructor for creating an instance of OptionModel.
  OptionModel({
    required this.id,
    required this.text,
    required this.isCorrect,
    required this.explanation,
  });

  /// Factory method to parse JSON data into an `OptionModel` instance.
  factory OptionModel.fromJson(Map<String, dynamic> json) => OptionModel(
        id: json['id'],
        text: json['text'],
        isCorrect: json['is_correct'],
        explanation: json['explanation'],
      );
  final String id; // Unique identifier for the option
  final String text; // Text content of the option
  final bool isCorrect; // Indicates if this option is the correct answer
  final String explanation;
}

/// Represents the category of a question.
/// Categories help organize questions into different groups or subjects.
class CategoryModel {
  // The course that this category belongs to

  /// Constructor for creating an instance of CategoryModel.
  CategoryModel({
    required this.name,
    required this.course,
  });

  /// Factory method to parse JSON data into a `CategoryModel` instance.
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json['name'],
        course: CourseModel.fromJson(
          json['course'],
        ), // Parses JSON data into CourseModel
      );
  final String name; // The name of the category
  final CourseModel course;
}

/// Represents a course to which a category belongs.
/// Contains course information like name, ID, and the date it was created.
class CourseModel {
  // The creation date of the course

  /// Constructor for creating an instance of CourseModel.
  CourseModel({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  /// Factory method to parse JSON data into a `CourseModel` instance.
  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: json['id'],
        name: json['name'],
        createdAt: json['created_at'],
      );
  final String id; // Unique identifier for the course
  final String name; // Name of the course
  final String createdAt;
}
