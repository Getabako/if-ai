#!/bin/zsh
# if(AI)サイト刷新v2 画像生成 バッチB（モチーフ・バナー系）
set -u
ROOT="/Users/takasaki19841121/Desktop/ifJukuManager/if塾/Web/if-ai-site-main"
OUT="$ROOT/images/renewal-2026/v2"
REF="$ROOT/images/renewal-2026/inuemon-portrait.png"
mkdir -p "$OUT"
cd "$OUT" || exit 1

GUARD="これは非対話の単発画像生成タスクである。指示された画像を1枚生成し保存する以外のことは一切行うな。指示に無関係なファイルやディレクトリには絶対にアクセスするな。"
STYLE="${GUARD}
絵柄の厳守事項: 温かい手描きの絵本風フラットイラスト。色鉛筆と水彩のやわらかい質感、太さの揺らぐ有機的な輪郭線、紙のテクスチャ。写実・3DCG・つるつるしたAI画像的な質感は禁止。配色は濃紺(#1B4D6B)、クリーム(#FAF6EE)、山吹色(#E8A93C)、浅葱色(#8FBFCB)を基調にした落ち着いた和のトーン。画面内に文字・ロゴ・英数字は一切描かない。"

echo "=== B1. tools-design-v2 ==="
codex exec -m gpt-5.5 --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 「デザイン・制作の仕事」を表す静物モチーフイラスト。木のテーブルの上に、絵筆と絵の具パレット、色鉛筆、開いたスケッチブック、小さなノートPC(画面には抽象的な図形のみ)、音符の飾りを、絵本風にかわいく配置。人物は描かない。クリーム色の背景。正方形1:1。
これを ${OUT}/tools-design-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.b1.log" 2>&1
[ -f "$OUT/tools-design-v2.png" ] && echo OK || echo FAIL

echo "=== B2. tools-media-v2 ==="
codex exec -m gpt-5.5 --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 「動画・SNS発信の仕事」を表す静物モチーフイラスト。木のテーブルの上に、スマートフォン、小さなビデオカメラ、マイク、吹き出しの形のカード、再生ボタンの形のクッキーを絵本風にかわいく配置。人物は描かない。クリーム色の背景。正方形1:1。
これを ${OUT}/tools-media-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.b2.log" 2>&1
[ -f "$OUT/tools-media-v2.png" ] && echo OK || echo FAIL

echo "=== B3. tools-office-v2 ==="
codex exec -m gpt-5.5 --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 「事務・書類作成の仕事」を表す静物モチーフイラスト。木の机の上に、書類の束、万年筆、チェックマーク付きの付箋、そろばん、湯のみ、卓上ライトを絵本風にかわいく配置。書類の中身は線と図形のみで文字は描かない。人物は描かない。クリーム色の背景。正方形1:1。
これを ${OUT}/tools-office-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.b3.log" 2>&1
[ -f "$OUT/tools-office-v2.png" ] && echo OK || echo FAIL

echo "=== B4. tools-shop-v2 ==="
codex exec -m gpt-5.5 --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 「お店・サービス支援の仕事」を表す静物モチーフイラスト。のれんのかかった小さな商店の店先を絵本風に。木の台の上に野菜かご、値札風の無地の札、スマートフォン、小さなレジ、鉢植えをかわいく配置。のれんや札に文字は描かない。人物は描かない。正方形1:1。
これを ${OUT}/tools-shop-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.b4.log" 2>&1
[ -f "$OUT/tools-shop-v2.png" ] && echo OK || echo FAIL

echo "=== B5. inuemon-v2 ==="
codex exec -m gpt-5.5 -i "$REF" --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 参考画像の白い秋田犬マスコット(丸いボディ、胸に淡い模様)を、この温かい絵本風の絵柄で描き直した全身立ち姿1体。にこやかに片手を上げて挨拶している。背景はクリーム色の紙の質感に淡い光の粒だけ。正方形1:1。
これを ${OUT}/inuemon-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.b5.log" 2>&1
[ -f "$OUT/inuemon-v2.png" ] && echo OK || echo FAIL

echo "=== B6. contact-banner-v2 ==="
codex exec -m gpt-5.5 -i "$REF" --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: お問い合わせバナーの背景イラスト。夕暮れのやわらかい金色に染まる秋田の町並みと田んぼを絵本風に横長パノラマで描く。画面の左下で白い秋田犬マスコットが振り返ってこちらに手を振っている。家々の窓にあたたかい灯り。中央から右は空と雲の広い余白にして文字を載せられるように。横長でおよそ21:9、幅2048px程度。
これを ${OUT}/contact-banner-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.b6.log" 2>&1
[ -f "$OUT/contact-banner-v2.png" ] && echo OK || echo FAIL

echo "=== B7. partner-band-v2 ==="
codex exec -m gpt-5.5 --sandbox workspace-write --dangerously-bypass-approvals-and-sandbox \
"${STYLE}
題材: 連携セクションの背景イラスト。夜の濃紺の空の下、秋田の町の建物たちが灯りをともして並び、建物と建物の間をあたたかい光の糸がゆるやかにつないでいる。竿燈まつりの提灯の列を遠景に。全体は濃紺主体の落ち着いた暗めのトーンで、上に白い文字を載せても読めるように。横長16:9、幅2048px程度。
これを ${OUT}/partner-band-v2.png として保存。完了したらパスのみ報告。" > "$OUT/.b7.log" 2>&1
[ -f "$OUT/partner-band-v2.png" ] && echo OK || echo FAIL

echo "BATCH B DONE"
