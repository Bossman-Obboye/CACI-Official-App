import "package:cac_official/modules/hymnbook/data/models/chorus_model.dart";
import "package:cac_official/modules/hymnbook/domain/entities/hymn_entity.dart";

import "stanza_model.dart";

/// Represents a hymn model with its associated properties.
class HymnModel {
  /// The unique number assigned to the hymn.
  final int hymnNumber;

  /// The unique identifier for the hymn (optional).
  final String? id;

  /// The title of the hymn.
  final String title;

  /// The author of the hymn (optional).
  final String? author;

  /// The language in which the hymn is written.
  final String language;

  /// The category or genre of the hymn (optional).
  final String? category;

  /// A list of tags associated with the hymn for categorization or searching.
  final List<String>? tags;

  /// A list of stanzas that make up the hymn (optional).
  final List<StanzaModel>? stanzas;

  /// A list of choruses associated with the hymn (optional).
  final List<ChorusModel>? choruses;

  /// Indicates whether the hymn is marked as a favorite.
  final bool isFavorite;

  /// Constructor for creating a [HymnModel] instance.
  const HymnModel({
    this.id,
    required this.hymnNumber,
    required this.title,
    this.author,
    required this.language,
    this.category,
    this.tags,
    this.stanzas,
    this.choruses,
    this.isFavorite = false, // Default value is false
  });

  /// Factory constructor to create a [HymnModel] from a [HymnEntity].
  factory HymnModel.fromEntity(HymnEntity entity) {
    return HymnModel(
      id: entity.id,
      hymnNumber: entity.hymnNumber,
      title: entity.title,
      author: entity.author,
      language: entity.language,
      category: entity.category,
      tags: entity.tags,
      stanzas: entity.stanzas?.map((e) => StanzaModel.fromEntity(e)).toList() ?? [],
      choruses: entity.choruses?.map((e) => ChorusModel.fromEntity(e)).toList() ?? [],
      isFavorite: entity.isFavorite, // Map isFavorite from entity
    );
  }

  /// Converts the [HymnModel] to a [HymnEntity].
  HymnEntity toEntity() {
    return HymnEntity(
      id: id,
      hymnNumber: hymnNumber,
      title: title,
      author: author,
      language: language,
      category: category,
      tags: tags ?? [],
      stanzas: stanzas?.map((stanza) => stanza.toEntity()).toList() ?? [],
      choruses: choruses?.map((chorus) => chorus.toEntity()).toList() ?? [],
      isFavorite: isFavorite, // Include isFavorite in conversion
    );
  }

  /// Factory constructor to create a [HymnModel] from a JSON map.
  factory HymnModel.fromJson(Map<String, dynamic> json) {
    return HymnModel(
      id: json["id"] as String?,
      hymnNumber: json["hymnNumber"] as int,
      title: json["title"] as String,
      author: json["author"] as String?,
      language: json["language"] as String,
      category: json["category"] as String?,
      tags: (json["tags"] as List<dynamic>?)?.cast<String>() ?? [],
      stanzas: (json['stanzas'] as List<dynamic>?)
              ?.map((e) => StanzaModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      choruses: (json['choruses'] as List<dynamic>?)
              ?.map((e) => ChorusModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isFavorite: json["isFavorite"] as bool? ?? false, // Default to false if not present
    );
  }

  /// Converts the [HymnModel] to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "hymnNumber": hymnNumber,
      "title": title,
      "author": author,
      "language": language,
      "category": category,
      "tags": tags ?? [],
      "stanzas": stanzas?.map((stanza) => stanza.toJson()).toList() ?? [],
      "choruses": choruses?.map((chorus) => chorus.toJson()).toList() ?? [],
      "isFavorite": isFavorite, // Include isFavorite in JSON
    };
  }
}
