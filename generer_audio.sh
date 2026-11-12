#!/bin/zsh
# Génère les MP3 des onomatopées avec les voix neuronales Microsoft (edge-tts).
# Installation (une fois) : python3 -m venv .venv && .venv/bin/pip install edge-tts
# Usage : ./generer_audio.sh [animal/fichier ...]  (sans argument : tous les cris)
# Format : animal|fichier|voix|texte prononcé[|vitesse[|options edge-tts]]
#   vitesse < 1 allonge le son après coup (ex. 0.6) ; options : ex. --rate=-50% --pitch=+40Hz
cd "${0:A:h}"
while IFS='|' read -r animal fichier voix texte vitesse opts; do
  [[ -z "$animal" || "$animal" == \#* ]] && continue
  (( $# )) && (( ! ${@[(Ie)$animal/$fichier]} )) && continue
  mkdir -p "audio/$animal"
  sortie="audio/$animal/$fichier.mp3"
  .venv/bin/edge-tts --voice "$voix" ${=opts} --text "$texte" --write-media "$sortie" 2>/dev/null &&
    if [[ -n "$vitesse" ]]; then
      ffmpeg -nostdin -y -loglevel error -i "$sortie" -filter:a "atempo=$vitesse" "$sortie.tmp.mp3" && mv "$sortie.tmp.mp3" "$sortie"
    fi &&
    echo "ok  $animal/$fichier.mp3  ($texte)" || echo "ÉCHEC  $animal/$fichier.mp3"
done <<'LISTE'
chien|fr|fr-FR-DeniseNeural|Ouaf ouaf !
chien|fr-2|fr-FR-DeniseNeural|Wouf wouf !
chien|en|en-US-AvaNeural|Woof woof!
chien|en-2|en-US-AvaNeural|Bow wow!
chien|es|es-ES-ElviraNeural|¡Guau guau!
chien|ja|ja-JP-NanamiNeural|ワンワン
chien|hi|hi-IN-SwaraNeural|बाउ बाउ
chien|zh|zh-CN-XiaoxiaoNeural|汪汪！
coq|fr|fr-FR-DeniseNeural|Cocorico !
coq|en|en-US-AvaNeural|Cock-a-doodle-doo!
coq|es|es-ES-ElviraNeural|¡Kikirikí!
coq|ja|ja-JP-NanamiNeural|コケコッコー
coq|tr|tr-TR-EmelNeural|Ü-ürü-üüü!
grenouille|fr|fr-FR-DeniseNeural|Coâ coâ !
grenouille|en|en-US-AvaNeural|Ribbit!
grenouille|ru|ru-RU-SvetlanaNeural|Ква ква!
grenouille|hi|hi-IN-SwaraNeural|टर्र टर्र
grenouille|tr|tr-TR-EmelNeural|Vrak vrak!
cochon|fr|fr-FR-DeniseNeural|Groin groin !
cochon|ar|ar-SA-ZariyahNeural|قُباع
cochon|es|es-ES-ElviraNeural|¡Oinc oinc!
cochon|sv|sv-SE-SofieNeural|Nöff nöff!
cochon|ja|ja-JP-NanamiNeural|ブーブー
cochon|uk|uk-UA-PolinaNeural|Хрю-хрю!
vache|fr|fr-FR-DeniseNeural|Meuh !|0.5
vache|en|en-US-AvaNeural|Moo!|0.5
vache|nl|nl-NL-FennaNeural|Boe!
vache|ja|ja-JP-NanamiNeural|モーモー
vache|tl|fil-PH-BlessicaNeural|Unga!
lion|fr|fr-FR-DeniseNeural|Grrrrreuh !|0.7
lion|fr-2|fr-FR-DeniseNeural|Roaaar !|0.7
lion|en|en-US-AvaNeural|Rawr!
lion|fi|fi-FI-NooraNeural|Mur!
lion|ja|ja-JP-NanamiNeural|ガオー
lion|tl|fil-PH-BlessicaNeural|Awoo!
mouton|fr|fr-FR-DeniseNeural|Bè, bè !|0.5
mouton|it|it-IT-IsabellaNeural|Bee!
mouton|ar|ar-SA-ZariyahNeural|ماء
mouton|tr|tr-TR-EmelNeural|Mee!
mouton|sk|sk-SK-ViktoriaNeural|Bé bé!
oiseau|fr|fr-FR-DeniseNeural|Cui cui !
oiseau|en|en-US-AvaNeural|Tweet tweet!
oiseau|ta|ta-IN-PallaviNeural|கூ, கூ
oiseau|hi|hi-IN-SwaraNeural|चेह चेह
oiseau|pt|pt-BR-FranciscaNeural|Piu piu!
chat|fr|fr-FR-DeniseNeural|Miaou miaou !
chat|ar|ar-SA-ZariyahNeural|مُواء
chat|el|el-GR-AthinaNeural|Νιάου νιάου!
chat|vi|vi-VN-HoaiMyNeural|Meo meo!
chat|bn|bn-IN-TanishaaNeural|মিউ মিউ
chat|uk|uk-UA-PolinaNeural|М'яв-м'яв!
abeille|zh|zh-CN-XiaoxiaoNeural|嗡嗡嗡
abeille|ja|ja-JP-NanamiNeural|ブーン
abeille|tr|tr-TR-EmelNeural|Vızz!
abeille|hi|hi-IN-SwaraNeural|बर्र
cheval|fr|fr-FR-DeniseNeural|Hîîî, hîîî !||--rate=-50% --pitch=+40Hz
cheval|en|en-US-AvaNeural|Neigh!
cheval|ru|ru-RU-SvetlanaNeural|И-го-го!
cheval|de|de-DE-KatjaNeural|Ieh-hieh-hieh!
cheval|ko|ko-KR-SunHiNeural|히잉
LISTE

# Cas particulier : la voix épelle « bzzz » (B-Z-Z-Z). On garde le « bz » de « Bzou »
# et on étire seulement le « z » pour obtenir un bourdonnement continu.
if (( ! $# || ${@[(Ie)abeille/fr]} )); then
  TMP=$(mktemp -d)
  .venv/bin/edge-tts --voice fr-FR-DeniseNeural --text "Bzou" --write-media "$TMP/bzou.mp3" 2>/dev/null &&
    ffmpeg -nostdin -y -loglevel error -i "$TMP/bzou.mp3" -filter_complex \
      "[0]atrim=0:0.29,asetpts=N/SR/TB[b];[0]atrim=0.29:0.35,asetpts=N/SR/TB,atempo=0.5,atempo=0.5,atempo=0.5,atempo=0.5,afade=t=out:st=0.55:d=0.3[z];[b][z]acrossfade=d=0.02" \
      -codec:a libmp3lame -q:a 3 audio/abeille/fr.mp3 &&
    echo "ok  abeille/fr.mp3  (bzzz)" || echo "ÉCHEC  abeille/fr.mp3"
  rm -rf "$TMP"
fi
