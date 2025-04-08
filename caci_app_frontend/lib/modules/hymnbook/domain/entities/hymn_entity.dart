import "stanza_entity.dart";
import 'chorus_entity.dart';

/// Represents a hymn entity with its associated properties.
class HymnEntity {
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
  final List<StanzaEntity>? stanzas;

  /// A list of choruses associated with the hymn (optional).
  final List<ChorusEntity>? choruses;

  /// Indicates whether the hymn is marked as a favorite.
  final bool isFavorite;

  /// Constructor for creating a [HymnEntity] instance.
  const HymnEntity({
    this.id,
    required this.hymnNumber,
    required this.title,
    this.author,
    required this.language,
    this.category,
    this.tags,
    this.stanzas,
    this.choruses,
    this.isFavorite = false,
  }):assert(
    hymnNumber > 0,
    'Hymn number must be greater than zero',
  );
}
