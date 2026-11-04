#!/bin/zsh
# Génère les MP3 des onomatopées avec les voix macOS (say + ffmpeg).
# Format : animal|fichier|voix|texte prononcé
cd "${0:A:h}"
TMP=$(mktemp -d)
while IFS='|' read -r animal fichier voix texte; do
  [[ -z "$animal" || "$animal" == \#* ]] && continue
  mkdir -p "audio/$animal"
  say -v "$voix" -o "$TMP/a.aiff" "$texte" &&
    ffmpeg -y -loglevel error -i "$TMP/a.aiff" -codec:a libmp3lame -q:a 3 "audio/$animal/$fichier.mp3" &&
    echo "ok  $animal/$fichier.mp3  ($texte)"
done <<'LISTE'
chien|fr|Thomas (French (France))|Ouaf ouaf !
chien|fr-2|Thomas (French (France))|Wouf wouf !
chien|en|Samantha (English (US))|Woof woof!
chien|en-2|Samantha (English (US))|Bow wow!
chien|es|Mónica|¡Guau guau!
chien|ja|Kyoko|ワンワン
chien|hi|Lekha|बाउ बाउ
coq|fr|Thomas (French (France))|Cocorico !
coq|en|Samantha (English (US))|Cock-a-doodle-doo!
coq|es|Mónica|¡Kikirikí!
coq|ja|Kyoko|コケコッコー
coq|tr|Yelda|Ü-ürü-üüü!
grenouille|fr|Thomas (French (France))|Coâ coâ !
grenouille|en|Samantha (English (US))|Ribbit!
grenouille|ru|Milena|Ква ква!
grenouille|hi|Lekha|टर्र टर्र
grenouille|tr|Yelda|Vrak vrak!
cochon|fr|Thomas (French (France))|Groin groin !
cochon|ar|Majed|قُباع
cochon|es|Mónica|¡Oinc oinc!
cochon|sv|Alva|Nöff nöff!
cochon|ja|Kyoko|ブーブー
vache|fr|Thomas (French (France))|Meuh !
vache|en|Samantha (English (US))|Moo!
vache|nl|Xander|Boe!
vache|ja|Kyoko|モーモー
vache|tl|Damayanti|Unga!
lion|fr|Thomas (French (France))|Grrr !
lion|en|Samantha (English (US))|Rawr!
lion|fi|Satu|Mur!
lion|ja|Kyoko|ガオー
lion|tl|Damayanti|Awoo!
mouton|fr|Thomas (French (France))|Bêêê !
mouton|it|Alice|Bee!
mouton|ar|Majed|ماء
mouton|tr|Yelda|Mee!
mouton|sk|Laura|Bé bé!
oiseau|fr|Thomas (French (France))|Cui cui !
oiseau|en|Samantha (English (US))|Tweet tweet!
oiseau|ta|Vani|கூ, கூ
oiseau|hi|Lekha|चेह चेह
oiseau|pt|Luciana|Piu piu!
chat|fr|Thomas (French (France))|Miaou miaou !
chat|ar|Majed|مُواء
chat|el|Melina|Νιάου νιάου!
chat|vi|Linh|Meo meo!
chat|bn|Piya|মিউ মিউ
LISTE
rm -rf "$TMP"
