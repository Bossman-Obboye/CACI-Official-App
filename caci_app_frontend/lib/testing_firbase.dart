import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cac_official/modules/hymnbook/data/models/hymn_model.dart';
import 'package:cac_official/modules/hymnbook/data/models/stanza_model.dart';

Future<void> uploadFirstTwiHymn() async {
  final hymn = HymnModel(
    hymnNumber: 1,
    title: "Me koma`m' bue ma`W' Awu`rade pa!",
    author: null,
    language: "Twi",
    category: null,
    tags: ["salvation", "commitment"],
    stanzas: [
      StanzaModel(order: 1, content: "Me koma`m' bue ma`W' Awu`rade pa!\nB[tra`m', b[tra`m';\nMe gyidi fam W'as[mpa no ho,\nB[tra`m', b[tra`m'."),
      StanzaModel(order: 2, content: "Yiw, 'dan w]`m' koma`m' Awu`rade pa!\nB[tra`m', b[tra`m';\nWo anim ma sor' y[ me ampa,\nB[tra`m', b[tra`m'."),
      StanzaModel(order: 3, content: "Mema wu gyinaa akyir' aky[,\nB[tra`m', b[tra`m';\nMesr[`W' fa 'niwu b]n yi ky[ me,\nB[tra`m', b[tra`m'."),
      StanzaModel(order: 4, content: "Me te s[ Wob] me koma pon,\nB[tra`m', b[tra`m';\nMemma wonnyina akyiri bio,\nB[tra`m', b[tra`m'."),
    ],
    choruses: [
      ChorusModel(
        order: 1,
        content: "Bra b[tra`m' koraa, Awu`rade pa!\nNe nyinaa b[y[ w] Wo d] nti;\nMe koma yi mu y[ Wo trabea daa,\nB[tra`m', b[tra`m'.",
      ),
    ],
  );

  final docRef = FirebaseFirestore.instance
      .collection("hymns")
      .doc("twi_${hymn.hymnNumber}"); // Custom ID for uniqueness

  await docRef.set(hymn.toJson());
  print("Hymn uploaded successfully.");
}
