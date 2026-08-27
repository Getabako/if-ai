#!/bin/zsh
set -u
ROOT="/Users/takasaki19841121/Desktop/ifJukuManager/if塾/Web/if-ai-site-main"
OUT="$ROOT/images/renewal-2026/v2"
REF="$ROOT/images/renewal-2026/inuemon-portrait.png"
cd "$OUT" || exit 1

GUARD="これは非対話の単発画像生成タスクである。指示された画像を1枚生成し保存する以外のことは一切行うな。指示に無関係なファイルやディレクトリには絶対にアクセスするな。画像生成ツール(image_gen)を必ず実際に呼び出して生成し、生成せずに完了報告することを禁ずる。"
STYLE="${GUARD}
絵柄の厳守事項: 温かい手描きの絵本風フラットイラスト。色鉛筆と水彩のやわらかい質感、太さの揺らぐ有機的な輪郭線、紙のテクスチャ。写実的な人物・実写風・3DCG・つるつるしたAI画像的な質感は禁止。人物は全員デフォルメされた絵本のキャラクターとして描き、顔つき・髪型・年齢・体型・服装をひとりずつ明確に描き分けること。似た顔の複製は禁止。配色は濃紺(#1B4D6B)、クリーム(#FAF6EE)、山吹色(#E8A93C)、浅葱色(#8FBFCB)を基調にした落ち着いた和のトーン。画面内に文字・ロゴ・英数字・看板の文字は一切描かない。
マスコット: 参考画像の白い秋田犬マスコット(丸いボディ、胸に淡い模様)を、この絵本風の絵柄にデフォルメして登場させる。"

if [ ! -f "$OUT/hero-v2.png" ]; then
codex exec -m gpt-5.5 -i "$REF" --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 秋田の町を舞台に、多様な人たちがテーブルを囲んでタブレットやノートPCを楽しそうに使っている風景。登場人物は6人で全員バラバラに描き分ける: 車椅子の中年男性、白杖を持つ若い女性、白髪のおばあさん、ツインテールの小学生の女の子、ぽっちゃりした眼鏡の青年、ショートカットのお母さん。中央やや右に白い秋田犬マスコットが小さめに座って一緒に画面をのぞいている。背景に稲穂の田んぼ、遠くの山並み、竿燈まつりの提灯を絵本風に。空はやわらかい夕方の金色。画面左3分の1は空や田んぼの余白にして文字を載せられるように。横長16:9、幅2048px程度。
これを ${OUT}/hero-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.r1.log" 2>&1
fi
[ -f "$OUT/hero-v2.png" ] && echo HERO_OK || echo HERO_FAIL

if [ ! -f "$OUT/feature-2-v2.png" ]; then
codex exec -m gpt-5.5 -i "$REF" --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 障害者AI就労支援の場面。明るい作業室で、車椅子に乗った短髪で丸顔の若い男性がノートPCに向かって仕事の練習をしている。隣にそばかすのあるポニーテールの女性支援員がしゃがんで目線を合わせ、にこやかに話している。机の上に白い秋田犬マスコットの小さな置物。ふたりの顔立ちは全く違うタイプに描き分ける。横長4:3。
これを ${OUT}/feature-2-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.r2.log" 2>&1
fi
[ -f "$OUT/feature-2-v2.png" ] && echo F2_OK || echo F2_FAIL
echo RETRY_DONE
