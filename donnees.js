// Pour ajouter un animal : ajouter une entrée ici, une ligne dans generer_audio.sh,
// puis lancer le script (fichiers dans audio/<id>/<code>.mp3)
// « nature » : vrai cri de l'animal (audio/<id>/nature.mp3), extrait d'un enregistrement de Wikimedia Commons
const ANIMAUX = [
  {
    id: "chien", nom: "🐕 Chien",
    nature: { auteur: "Amada44", licence: "CC BY-SA 3.0", source: "https://commons.wikimedia.org/wiki/File:Barking_of_a_dog_2.ogg" },
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
    nature: { auteur: "alys", licence: "Domaine public", source: "https://commons.wikimedia.org/wiki/File:Medium_rooster_crowing.ogg" },
    cris: [
      { code: "fr", langue: "Français", texte: "Cocorico" },
      { code: "en", langue: "Anglais",  texte: "Cock-a-doodle-doo" },
      { code: "es", langue: "Espagnol", texte: "Kikirikí" },
      { code: "ja", langue: "Japonais", texte: "Kok-e-kok-ok", note: "コケコッコー" },
      { code: "tr", langue: "Turc",     texte: "Ü-ürü-üüü" },
      { code: "uk", langue: "Ukrainien", texte: "Kukuriku", note: "Кукуріку" },
    ],
  },
  {
    id: "grenouille", nom: "🐸 Grenouille",
    nature: { auteur: "MichaeltheFox8621", licence: "CC BY-SA 4.0", source: "https://commons.wikimedia.org/wiki/File:Single_Frog_Croak.oga" },
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
    nature: { auteur: "erdie", licence: "CC BY 3.0", source: "https://commons.wikimedia.org/wiki/File:Pig_grunt_-_Erdie.ogg" },
    cris: [
      { code: "fr", langue: "Français", texte: "Groin groin" },
      { code: "ar", langue: "Arabe",    texte: "Qubaax", note: "قُباع" },
      { code: "es", langue: "Espagnol", texte: "Oinc oinc" },
      { code: "sv", langue: "Suédois",  texte: "Nöff nöff" },
      { code: "ja", langue: "Japonais", texte: "Buu buu", note: "ブーブー" },
      { code: "uk", langue: "Ukrainien", texte: "Khryu-khryu", note: "Хрю-хрю" },
    ],
  },
  {
    id: "vache", nom: "🐄 Vache",
    nature: { auteur: "MichaeltheFox8621", licence: "CC BY-SA 4.0", source: "https://commons.wikimedia.org/wiki/File:Single_Cow_Moo.ogg" },
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
    nature: { auteur: "J. Growcott et al.", licence: "CC BY 4.0", source: "https://commons.wikimedia.org/wiki/File:Lionroar.wav" },
    cris: [
      { code: "fr", langue: "Français", texte: "Grrr" },
      { code: "fr-2", langue: "Français", texte: "Roaaar" },
      { code: "en", langue: "Anglais",  texte: "Rawr" },
      { code: "fi", langue: "Finnois",  texte: "Mur" },
      { code: "ja", langue: "Japonais", texte: "Gao", note: "ガオー" },
      { code: "tl", langue: "Tagalog",  texte: "Awoo" },
    ],
  },
  {
    id: "mouton", nom: "🐑 Mouton",
    nature: { auteur: "earthcalling", licence: "Domaine public", source: "https://commons.wikimedia.org/wiki/File:Sheep_bleating.ogg" },
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
    nature: { auteur: "QWerk", licence: "CC BY-SA 3.0", source: "https://commons.wikimedia.org/wiki/File:House_Sparrows_chirping.ogg" },
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
    nature: { auteur: "Heismark", licence: "Domaine public", source: "https://commons.wikimedia.org/wiki/File:Meow_of_a_pleading_cat.oga" },
    cris: [
      { code: "fr", langue: "Français",   texte: "Miaou miaou" },
      { code: "ar", langue: "Arabe",      texte: "Muwaa’", note: "مُواء" },
      { code: "el", langue: "Grec",       texte: "Niau niau", note: "Νιάου νιάου" },
      { code: "vi", langue: "Vietnamien", texte: "Meo meo" },
      { code: "bn", langue: "Bengali",    texte: "Miu miu", note: "মিউ মিউ" },
      { code: "uk", langue: "Ukrainien",  texte: "Myav-myav", note: "М'яв-м'яв" },
    ],
  },
  {
    id: "abeille", nom: "🐝 Abeille",
    nature: { auteur: "Spanac", licence: "CC BY 3.0", source: "https://commons.wikimedia.org/wiki/File:Bee_buzzing_sound_(animal_noises).opus" },
    cris: [
      { code: "fr", langue: "Français", texte: "Bzzz" },
      { code: "zh", langue: "Chinois",  texte: "Wēng wēng wēng", note: "嗡嗡嗡" },
      { code: "ja", langue: "Japonais", texte: "Buun", note: "ブーン" },
      { code: "tr", langue: "Turc",     texte: "Vızz" },
      { code: "hi", langue: "Hindi",    texte: "Barr", note: "बर्र" },
    ],
  },
  {
    id: "cheval", nom: "🐎 Cheval",
    nature: { auteur: "E. Briefer et al.", licence: "CC BY 4.0", source: "https://commons.wikimedia.org/wiki/File:Segregation-of-information-about-emotional-arousal-and-valence-in-horse-whinnies-srep09989-s2.oga" },
    cris: [
      { code: "fr", langue: "Français", texte: "Hiii hiii" },
      { code: "en", langue: "Anglais",  texte: "Neigh" },
      { code: "ru", langue: "Russe",    texte: "I-go-go", note: "И-го-го" },
      { code: "de", langue: "Allemand", texte: "Iehiehieh" },
      { code: "ko", langue: "Coréen",   texte: "Hiing", note: "히잉" },
    ],
  },
];
