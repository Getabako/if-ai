#!/bin/zsh
set -u
ROOT="/Users/takasaki19841121/Desktop/ifJukuManager/if塾/Web/if-ai-site-main"
OUT="$ROOT/images/renewal-2026/v2"
REF="$ROOT/images/renewal-2026/inuemon-portrait.png"
cd "$OUT" || exit 1

GUARD="これは非対話の単発画像生成タスクである。必ず image_gen ツールを実際に呼び出して画像を生成し、指定パスに保存すること。image_gen を呼ばずに完了報告することは重大な違反である。指示に無関係なファイルには一切アクセスするな。"
STYLE="${GUARD}
絵柄: 温かい手描きの絵本風フラットイラスト。色鉛筆と水彩のやわらかい質感、太さの揺らぐ有機的な輪郭線、紙のテクスチャ。写実・実写風・3DCGは禁止。人物はデフォルメされた絵本キャラクターとして、顔つき・髪型・年齢・体型を一人ずつ描き分け、似た顔の複製は禁止。配色は濃紺(#1B4D6B)、クリーム(#FAF6EE)、山吹色(#E8A93C)、浅葱色(#8FBFCB)基調。文字・ロゴ・英数字は一切描かない。参考画像の白い秋田犬マスコットを絵本風にデフォルメして登場させる。"

for i in 1 2 3; do
  [ -f "$OUT/hero-v2.png" ] && break
  echo "hero try $i"
  codex exec -m gpt-5.5 -i "$REF" --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 夕方の金色の空の下、秋田の田んぼと町を背景に、5人の多様な人たち(車椅子の中年男性、白杖の若い女性、白髪のおばあさん、小学生の女の子、眼鏡の青年)が屋外の木のテーブルでタブレットを囲んで笑っている。白い秋田犬マスコットも一緒に座って画面をのぞく。遠景に竿燈まつりの提灯。画面左3分の1は空と田んぼの余白。横長16:9。
image_gen で生成し ${OUT}/hero-v2.png に保存。完了したら保存したファイルのサイズも報告。" >> "$OUT/.r1b.log" 2>&1
done
[ -f "$OUT/hero-v2.png" ] && echo HERO_OK || echo HERO_FAIL

for i in 1 2 3; do
  [ -f "$OUT/feature-2-v2.png" ] && break
  echo "f2 try $i"
  codex exec -m gpt-5.5 -i "$REF" --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 明るい作業室で、車椅子の丸顔で短髪の若い男性がノートPCで仕事の練習をしている。隣にポニーテールでそばかすの女性支援員がしゃがんで目線を合わせ、にこやかに話す。机に白い秋田犬マスコットの小さな置物。ふたりの顔は全く違うタイプに。横長4:3。
image_gen で生成し ${OUT}/feature-2-v2.png に保存。完了したら保存したファイルのサイズも報告。" >> "$OUT/.r2b.log" 2>&1
done
[ -f "$OUT/feature-2-v2.png" ] && echo F2_OK || echo F2_FAIL

if [ ! -f "$OUT/ogp-v2.png" ]; then
  codex exec -m gpt-5.5 -i "$REF" -i "$OUT/hero-v2.png" --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: SNSシェア用OGP画像。2枚目の参考画像(ヒーローイラスト)と同じ絵柄・同じ世界観で、白い秋田犬マスコットと多様な人たちが並んで正面を向いてほほえむ集合イラスト。背景は秋田の田んぼと金色の空。中央上部に文字を載せる余白。横長1200x630相当の1.91:1。
image_gen で生成し ${OUT}/ogp-v2.png に保存。完了したら保存したファイルのサイズも報告。" >> "$OUT/.r3b.log" 2>&1
fi
[ -f "$OUT/ogp-v2.png" ] && echo OGP_OK || echo OGP_FAIL
echo RETRY2_DONE
