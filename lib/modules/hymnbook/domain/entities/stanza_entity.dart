/// Represents a stanza in a hymnbook, containing a stanza number and its lines.
class StanzaEntity {
  /// The number of the stanza.
  final int stanzaNumber;

  /// The lines of text in the stanza.
  final List<String>? lines;

  /// Creates a [StanzaEntity] with the given [stanzaNumber] and [lines].
  StanzaEntity({
    required this.stanzaNumber,
    this.lines,
  });
}
