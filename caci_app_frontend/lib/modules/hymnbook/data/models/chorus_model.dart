import '../../domain/entities/chorus_entity.dart';

/// A model class representing a chorus, used for data transfer and storage.
/// This class can be converted to and from a [ChorusEntity] for domain logic.
class ChorusModel {
  /// The number of the chorus, can be null if not specified.
  final int? chorusNumber;

  /// The lines of the chorus, represented as a list of strings.
  final List<String> lines;

  /// Constructor for [ChorusModel].
  /// [chorusNumber] is optional, but [lines] is required.
  const ChorusModel({this.chorusNumber, required this.lines});

  /// Factory constructor to create a [ChorusModel] from a [ChorusEntity].
  /// This is useful for transforming domain entities into data models.
  factory ChorusModel.fromEntity(ChorusEntity entity) {
    return ChorusModel(
      chorusNumber: entity.chorusNumber,
      lines: entity.lines ?? [],
    );
  }

  /// Converts this [ChorusModel] instance into a [ChorusEntity].
  /// This is useful for passing data to the domain layer.
  ChorusEntity toEntity() {
    return ChorusEntity(
      chorusNumber: chorusNumber,
      lines: lines,
    );
  }

  /// Factory constructor to create a [ChorusModel] from a JSON map.
  /// This is useful for deserializing data from external sources.
  factory ChorusModel.fromJson(Map<String, dynamic> json) {
    return ChorusModel(
      chorusNumber: json['chorusNumber'] as int?, // Explicit type casting for clarity.
      lines: List<String>.from(json['lines'] ?? []), // Ensures proper type conversion.
    );
  }

  /// Converts this [ChorusModel] instance into a JSON map.
  /// This is useful for serializing data for external storage or transmission.
  Map<String, dynamic> toJson() => {
        'chorusNumber': chorusNumber,
        'lines': lines,
      };
}
