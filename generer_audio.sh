#!/bin/zsh
# Génère les MP3 des onomatopées avec les voix neuronales Microsoft (edge-tts).
# Installation (une fois) : python3 -m venv .venv && .venv/bin/pip install edge-tts
# Format : animal|fichier|voix|texte prononcé
cd "${0:A:h}"
while IFS='|' read -r animal fichier voix texte; do
  [[ -z "$animal" || "$animal" == \#* ]] && continue
  mkdir -p "audio/$animal"
  .venv/bin/edge-tts --voice "$voix" --text "$texte" --write-media "audio/$animal/$fichier.mp3" 2>/dev/null &&
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
vache|fr|fr-FR-DeniseNeural|Meuh !
vache|en|en-US-AvaNeural|Moo!
vache|nl|nl-NL-FennaNeural|Boe!
vache|ja|ja-JP-NanamiNeural|モーモー
vache|tl|fil-PH-BlessicaNeural|Unga!
lion|fr|fr-FR-DeniseNeural|Grrr !
lion|en|en-US-AvaNeural|Rawr!
lion|fi|fi-FI-NooraNeural|Mur!
lion|ja|ja-JP-NanamiNeural|ガオー
lion|tl|fil-PH-BlessicaNeural|Awoo!
mouton|fr|fr-FR-DeniseNeural|Bêêê !
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
LISTE
