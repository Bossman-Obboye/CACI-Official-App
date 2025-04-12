import 'package:cac_official/modules/hymnbook/domain/entities/stanza_entity.dart';

/// A model class representing a stanza in a hymn.
/// This class is used to handle data transformations between
/// the domain layer and external data sources (e.g., JSON).
class StanzaModel {
  /// The number of the stanza.
  final int stanzaNumber;

  /// The lines of text in the stanza.
  final List<String> lines;

  /// Constructor for creating a [StanzaModel] instance.
  const StanzaModel({required this.stanzaNumber, required this.lines});

  /// Factory constructor to create a [StanzaModel] from a [StanzaEntity].
  factory StanzaModel.fromEntity(StanzaEntity? stanzaEntity) {
    if (stanzaEntity == null) {
      throw ArgumentError('stanzaEntity cannot be null');
    }
    return StanzaModel(
      stanzaNumber: stanzaEntity.stanzaNumber,
      lines: stanzaEntity.lines ?? [],
    );
  }

  /// Converts this [StanzaModel] to a [StanzaEntity].
  StanzaEntity toEntity() {
    return StanzaEntity(stanzaNumber: stanzaNumber, lines: lines);
  }

  /// Factory constructor to create a [StanzaModel] from a JSON map.
  factory StanzaModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError('json cannot be null');
    }
    if (json["stanzaNumber"] == null || json["lines"] == null) {
      throw ArgumentError('Invalid JSON: stanzaNumber and lines cannot be null');
    }
    return StanzaModel(
      stanzaNumber: json["stanzaNumber"], // Extracts the stanza number from JSON.
      lines: List<String>.from(json["lines"]), // Converts JSON list to List<String>.
    );
  }

  /// Converts this [StanzaModel] to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      "stanzaNumber": stanzaNumber, // Adds the stanza number to JSON.
      "lines": lines, // Adds the lines to JSON.
    };
  }
}
