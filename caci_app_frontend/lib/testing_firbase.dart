import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cac_official/modules/hymnbook/data/models/hymn_model.dart';
import 'package:cac_official/modules/hymnbook/data/models/stanza_model.dart';
import 'package:cac_official/modules/hymnbook/data/models/chorus_model.dart';

void uploadFirstTwiHymn() async {
  final hymn = HymnModel(
    hymnNumber: 1,
    title: "CACI Hymn 1",
    author: null,
    language: "Twi",
    category: null,
    tags: ["opening", "devotion"],
    isFavorite: false,
    stanzas: [
      StanzaModel(stanzaNumber: 1, lines: [
        "Me koma`m' bue ma`W' Awu`rade pa!",
        "B[tra`m', b[tra`m';",
        "Me gyidi fam W'as[mpa no ho,",
        "B[tra`m', b[tra`m'."
      ]),
      StanzaModel(stanzaNumber: 2, lines: [
        "Yiw, 'dan w]`m' koma`m' Awu`rade pa!",
        "B[tra`m', b[tra`m';",
        "Wo anim ma sor' y[ me ampa,",
        "B[tra`m', b[tra`m'."
      ]),
      StanzaModel(stanzaNumber: 3, lines: [
        "Mema wu gyinaa akyir' aky[,",
        "B[tra`m', b[tra`m';",
        "Mesr[`W' fa 'niwu b]n yi ky[ me,",
        "B[tra`m', b[tra`m'."
      ]),
      StanzaModel(stanzaNumber: 4, lines: [
        "Me te s[ Wob] me koma pon,",
        "B[tra`m', b[tra`m';",
        "Memma wonnyina akyiri bio,",
        "B[tra`m', b[tra`m'."
      ]),
    ],
    choruses: [
      ChorusModel(lines: [
        "Bra b[tra`m' koraa, Awu`rade pa!",
        "Ne nyinaa b[y[ w] Wo d] nti;",
        "Me koma yi mu y[ Wo trabea daa,",
        "B[tra`m', b[tra`m'."
      ])
    ],
  );

  // Upload to Firestore
  final firestore = FirebaseFirestore.instance;
  await firestore.collection("hymns").add(hymn.toJson());
  print("CAC DWOM 1 uploaded successfully!");
}
