# いらないもの診断
[アプリページ](https://unnecessaries-finder.herokuapp.com)

## サービス概要
部屋の写真をアップロードするだけで\
「実はいらないもの」が見つかり、\
生活改善のきっかけが得られるサービス。

## ユーザーの抱える問題
自分の部屋に不要なものがたくさんあることや、それを片付けることで生活が改善されることに気づいていない。

## 解決方法
ユーザーは部屋の写真を撮影するだけ。\
写真に映ったものそれぞれに対し必要性を問いかけるコメントを表示。

## 登場人物
- ユーザー
  - 部屋の写真をアップロードするだけ。
- 管理者（=開発者）
  - ものそれぞれに対するコメントを追加・編集。

## プロダクト
一分で「実はいらないもの」が見つかるWebアプリケーション。

## マーケット
- 自分の所有するものについてあまり深く考えたことのない人。
- 断捨離することで生活が改善される可能性に気づいていない人。

## ER図
[![Image from Gyazo](https://i.gyazo.com/e9e884c00f4b7f0074b2abe7a5e39812.png)](https://gyazo.com/e9e884c00f4b7f0074b2abe7a5e39812)

## トップ画面
[![Image from Gyazo](https://i.gyazo.com/41cd5f9c1caa10d49f7711204a2101f4.png)](https://gyazo.com/41cd5f9c1caa10d49f7711204a2101f4)

## データベースバックアップコマンド
`mysqldump -h us-cdbr-east-04.cleardb.com -u b104f183417e94 --databases heroku_edbcf68f9daaafa --no-tablespaces --column-statistics=0 -p > production_db_backup.sql`

