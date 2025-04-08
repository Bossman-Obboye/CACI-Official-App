
import '../../../domain/entities/chorus_entity.dart';
import '../../../domain/entities/hymn_entity.dart';
import '../../../domain/entities/stanza_entity.dart';
import '../chorus_model.dart';
import '../hive/hive_hymn_model.dart';
import '../stanza_model.dart';

extension HiveHymnMapper on HiveHymnModel {
  HymnEntity toEntity() {
    return HymnEntity(
      id: id,
      hymnNumber: hymnNumber,
      title: title,
      author: author,
      language: language,
      category: category,
      tags: tags,
      stanzas: stanzas.map((s) => s.toEntity()).toList(),
      choruses: choruses.map((c) => c.toEntity()).toList(),
      isFavorite: isFavorite,
    );
  }
}

extension HymnEntityMapper on HymnEntity {
  HiveHymnModel toHiveModel() {
    return HiveHymnModel(
      id: id,
      hymnNumber: hymnNumber,
      title: title,
      author: author,
      language: language,
      category: category,
      tags: tags ?? [],
      stanzas: (stanzas ?? []).map((s) => s.toHiveModel()).toList(),
      choruses: (choruses ?? []).map((c) => c.toHiveModel()).toList(),
      isFavorite: isFavorite,
    );
  }
}


extension StanzaModelMapper on StanzaModel {
  StanzaEntity toEntity() => StanzaEntity(
        stanzaNumber: stanzaNumber,
        lines: lines,
      );
}

extension StanzaEntityMapper on StanzaEntity {
  StanzaModel toHiveModel() => StanzaModel(
        stanzaNumber: stanzaNumber,
        lines: lines ?? [], // Ensure lines is not empty
      );
}

extension ChorusModelMapper on ChorusModel {
  ChorusEntity toEntity() => ChorusEntity(
        chorusNumber: chorusNumber,
        lines: lines,
      );
}
  
extension ChorusEntityMapper on ChorusEntity {
  ChorusModel toHiveModel() => ChorusModel(
        chorusNumber: chorusNumber,
        lines: lines ?? [], // Ensure lines is not empty
      );
}
