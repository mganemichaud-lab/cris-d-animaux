// Pour ajouter un animal : ajouter une entrée ici, une ligne dans generer_audio.sh,
// puis lancer le script (fichiers dans audio/<id>/<code>.mp3)
const ANIMAUX = [
  {
    id: "chien", nom: "🐕 Chien",
    cris: [
      { code: "fr",   langue: "Français", texte: "Ouaf ouaf" },
      { code: "fr-2", langue: "Français", texte: "Wouf wouf" },
      { code: "en",   langue: "Anglais",  texte: "Woof woof" },
      { code: "en-2", langue: "Anglais",  texte: "Bow wow" },
      { code: "es",   langue: "Espagnol", texte: "Guau guau" },
      { code: "ja",   langue: "Japonais", texte: "Wan wan", note: "ワンワン" },
      { code: "hi",   langue: "Hindi",    texte: "Bow bow", note: "बाउ बाउ" },
      { code: "zh",   langue: "Chinois",  texte: "Wāng wāng", note: "汪汪" },
    ],
  },
  {
    id: "coq", nom: "🐓 Coq",
    cris: [
      { code: "fr", langue: "Français", texte: "Cocorico" },
      { code: "en", langue: "Anglais",  texte: "Cock-a-doodle-doo" },
      { code: "es", langue: "Espagnol", texte: "Kikirikí" },
      { code: "ja", langue: "Japonais", texte: "Kok-e-kok-ok", note: "コケコッコー" },
      { code: "tr", langue: "Turc",     texte: "Ü-ürü-üüü" },
    ],
  },
  {
    id: "grenouille", nom: "🐸 Grenouille",
    cris: [
      { code: "fr", langue: "Français", texte: "Coâ coâ" },
      { code: "en", langue: "Anglais",  texte: "Ribbit" },
      { code: "ru", langue: "Russe",    texte: "Kva kva", note: "Ква ква" },
      { code: "hi", langue: "Hindi",    texte: "Tarr tarr", note: "टर्र टर्र" },
      { code: "tr", langue: "Turc",     texte: "Vrak vrak" },
    ],
  },
  {
    id: "cochon", nom: "🐖 Cochon",
    cris: [
      { code: "fr", langue: "Français", texte: "Groin groin" },
      { code: "ar", langue: "Arabe",    texte: "Qubaax", note: "قُباع" },
      { code: "es", langue: "Espagnol", texte: "Oinc oinc" },
      { code: "sv", langue: "Suédois",  texte: "Nöff nöff" },
      { code: "ja", langue: "Japonais", texte: "Buu buu", note: "ブーブー" },
    ],
  },
  {
    id: "vache", nom: "🐄 Vache",
    cris: [
      { code: "fr", langue: "Français",    texte: "Meuh" },
      { code: "en", langue: "Anglais",     texte: "Moo" },
      { code: "nl", langue: "Néerlandais", texte: "Boe" },
      { code: "ja", langue: "Japonais",    texte: "Mo mo", note: "モーモー" },
      { code: "tl", langue: "Tagalog",     texte: "Unga" },
    ],
  },
  {
    id: "lion", nom: "🦁 Lion",
    cris: [
      { code: "fr", langue: "Français", texte: "Grrr" },
      { code: "en", langue: "Anglais",  texte: "Rawr" },
      { code: "fi", langue: "Finnois",  texte: "Mur" },
      { code: "ja", langue: "Japonais", texte: "Gao", note: "ガオー" },
      { code: "tl", langue: "Tagalog",  texte: "Awoo" },
    ],
  },
  {
    id: "mouton", nom: "🐑 Mouton",
    cris: [
      { code: "fr", langue: "Français", texte: "Bêê, bêêh" },
      { code: "it", langue: "Italien",  texte: "Bee" },
      { code: "ar", langue: "Arabe",    texte: "Meh", note: "ماء" },
      { code: "tr", langue: "Turc",     texte: "Mee" },
      { code: "sk", langue: "Slovaque", texte: "Bé bé" },
    ],
  },
  {
    id: "oiseau", nom: "🐦 Oiseau",
    cris: [
      { code: "fr", langue: "Français",  texte: "Cui cui" },
      { code: "en", langue: "Anglais",   texte: "Tweet tweet" },
      { code: "ta", langue: "Tamoul",    texte: "Koo, koo", note: "கூ, கூ" },
      { code: "hi", langue: "Hindi",     texte: "Cheh cheh", note: "चेह चेह" },
      { code: "pt", langue: "Portugais", texte: "Piu piu" },
    ],
  },
  {
    id: "chat", nom: "🐈 Chat",
    cris: [
      { code: "fr", langue: "Français",   texte: "Miaou miaou" },
      { code: "ar", langue: "Arabe",      texte: "Muwaa’", note: "مُواء" },
      { code: "el", langue: "Grec",       texte: "Niau niau", note: "Νιάου νιάου" },
      { code: "vi", langue: "Vietnamien", texte: "Meo meo" },
      { code: "bn", langue: "Bengali",    texte: "Miu miu", note: "মিউ মিউ" },
    ],
  },
];
