/// Represents a chorus entity in the hymnbook domain.
/// 
/// This class is used to model a chorus, which may optionally have a 
/// chorus number and contains a list of lines that make up the chorus.
/// 
/// - [chorusNumber]: An optional integer representing the number of the chorus.
/// - [lines]: A required list of strings representing the lines of the chorus.
class ChorusEntity {
  final int? chorusNumber;
  final List<String>? lines;

  ChorusEntity({this.chorusNumber, this.lines});
}
