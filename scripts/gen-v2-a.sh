#!/bin/zsh
# if(AI)サイト刷新v2 画像生成 バッチA（人物シーン系）
set -u
ROOT="/Users/takasaki19841121/Desktop/ifJukuManager/if塾/Web/if-ai-site-main"
OUT="$ROOT/images/renewal-2026/v2"
REF="$ROOT/images/renewal-2026/inuemon-portrait.png"
mkdir -p "$OUT"
cd "$OUT" || exit 1

GUARD="これは非対話の単発画像生成タスクである。指示された画像を1枚生成し保存する以外のことは一切行うな。指示に無関係なファイルやディレクトリには絶対にアクセスするな。"
STYLE="${GUARD}
絵柄の厳守事項: 温かい手描きの絵本風フラットイラスト。色鉛筆と水彩のやわらかい質感、太さの揺らぐ有機的な輪郭線、紙のテクスチャ。写実的な人物・実写風・3DCG・つるつるしたAI画像的な質感は禁止。人物は全員デフォルメされた絵本のキャラクターとして描き、顔つき・髪型・年齢・体型・服装をひとりずつ明確に描き分けること。似た顔の複製は禁止。配色は濃紺(#1B4D6B)、クリーム(#FAF6EE)、山吹色(#E8A93C)、浅葱色(#8FBFCB)を基調にした落ち着いた和のトーン。画面内に文字・ロゴ・英数字・看板の文字は一切描かない。
マスコット: 参考画像の白い秋田犬マスコット(丸いボディ、胸に淡い模様)を、この絵本風の絵柄にデフォルメして登場させる。"

echo "=== A1. hero-v2 ==="
codex exec -m gpt-5.5 -i "$REF" --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 秋田の町を舞台に、多様な人たちがテーブルを囲んでタブレットやノートPCを楽しそうに使っている風景。登場人物は6人で全員バラバラに描き分ける: 車椅子の中年男性、白杖を持つ若い女性、白髪のおばあさん、ツインテールの小学生の女の子、ぽっちゃりした眼鏡の青年、ショートカットのお母さん。中央やや右に白い秋田犬マスコットが小さめに座って一緒に画面をのぞいている。背景に稲穂の田んぼ、遠くの山並み、竿燈まつりの提灯を絵本風に。空はやわらかい夕方の金色。画面左3分の1は空や田んぼの余白にして文字を載せられるように。横長16:9、幅2048px程度。
これを ${OUT}/hero-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.a1.log" 2>&1
[ -f "$OUT/hero-v2.png" ] && echo OK || echo FAIL

echo "=== A2. feature-1-v2 ==="
codex exec -m gpt-5.5 -i "$REF" --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 不登校・ひきこもり支援の場面。自宅の温かい部屋で、パーカーを着た内気そうな中学生の男の子がクッションに座ってタブレットを見ている。そばに白い秋田犬マスコットが寄り添い、画面を一緒に見ている。窓の外はやわらかい朝の光。急かさない、安心できる空気感。人物はこの少年ひとりだけにして表情を丁寧に。横長4:3。
これを ${OUT}/feature-1-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.a2.log" 2>&1
[ -f "$OUT/feature-1-v2.png" ] && echo OK || echo FAIL

echo "=== A3. feature-2-v2 ==="
codex exec -m gpt-5.5 -i "$REF" --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 障害者AI就労支援の場面。明るい作業室で、車椅子に乗った短髪で丸顔の若い男性がノートPCに向かって仕事の練習をしている。隣にそばかすのあるポニーテールの女性支援員がしゃがんで目線を合わせ、にこやかに話している。机の上に白い秋田犬マスコットのちいさな置物姿。ふたりの顔立ちは全く違うタイプに描き分ける。横長4:3。
これを ${OUT}/feature-2-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.a3.log" 2>&1
[ -f "$OUT/feature-2-v2.png" ] && echo OK || echo FAIL

echo "=== A4. feature-3-v2 ==="
codex exec -m gpt-5.5 -i "$REF" --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 地域AI人材育成の講座風景。公民館の和やかな教室で、講師の白い秋田犬マスコットが前に立ちホワイトボードを指している(ボードの中身は図形と絵だけ、文字なし)。受講者は4人で全員描き分ける: 作業着姿の日焼けした農家のおじさん、着物風エプロンの割烹着のおばあさん、スーツの若い女性、坊主頭の商店主風の中年男性。みんな楽しそうにノートPCやノートを開いている。横長4:3。
これを ${OUT}/feature-3-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.a4.log" 2>&1
[ -f "$OUT/feature-3-v2.png" ] && echo OK || echo FAIL

echo "=== A5. flow-v2 ==="
codex exec -m gpt-5.5 -i "$REF" --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 「相談→体験→実践→次の一歩」の道のりを表す1枚絵。画面の下から上へ、あたたかい山吹色の小道がゆるやかに蛇行して続いていく。道の途中に4つの場面を小さく描く: (1)テーブルでお茶を飲みながら話を聞く場面、(2)タブレットを一緒にのぞく体験の場面、(3)ノートPCで手を動かす練習の場面、(4)扉が開いて光がさす旅立ちの場面。白い秋田犬マスコットが道案内のように歩いている。人物は場面ごとに違う人を描き分ける。縦長4:5。
これを ${OUT}/flow-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.a5.log" 2>&1
[ -f "$OUT/flow-v2.png" ] && echo OK || echo FAIL

echo "=== A6. mission-v2 ==="
codex exec -m gpt-5.5 -i "$REF" --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 「AIは人の可能性を広げる道具」を表す象徴的な1枚。大きく開いた両手のひらの上に、絵筆、ペン、音符、歯車、芽吹く双葉、小さなノートPCなどの道具たちがふわりと浮かんでいる。そばで白い秋田犬マスコットが嬉しそうに見上げている。背景はクリーム色の紙にやわらかい光の粒。あたたかく希望のある雰囲気。正方形1:1。
これを ${OUT}/mission-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.a6.log" 2>&1
[ -f "$OUT/mission-v2.png" ] && echo OK || echo FAIL

echo "BATCH A DONE"
