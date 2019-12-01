[
  ['amazon', 'http://www.amazon.co.jp', 'amazon.png','世界13カ国で運営する世界最大級のインターネット通販サイト。2000年に日本向けのサイト「Amazon.co.jp」が開設された。取り扱う商品は、書籍やCDから食品、家電まで、日本国内だけで1億点を超える。'],
  ['aws', 'https://aws.amazon.com/jp/', 'aws.png','Amazon.comにより提供されているクラウドコンピューティングサービス'],
  ['facebook','https://www.facebook.com','facebook.png','アメリカ合衆国カリフォルニア州メンローパークに本社を置くFacebook, Inc.が運営する世界最大のソーシャル・ネットワーキング・サービス（SNS）である。'],
  ['hulu', 'http://www.hulu.jp/','hulu.png','アメリカカリフォルニア州ロサンゼルスに本拠地を置く動画配信サービス。Huluとは中国語で大事なものを入れる入れ物であるひょうたんを意味する「葫芦」（繁体字: 葫蘆、拼音: húlú）とインタラクティブに記録することを意味する「互录」（繁体字: 互錄、拼音: hùlù）とにちなむ。'],
  ['instagram','https://www.instagram.com', 'instagram.png','Facebook, Incが提供している無料の写真共有アプリケーション。日本語では略して「インスタ(表記insta)」とも呼ばれることもある。'],
  ['netflix','https://www.netflix.com/jp/', 'netflix.png',' 配信事業を展開し,ストリーミング配信では既存のコンテンツに加え、独占配信やオリジナル作品も扱っている。'],
  ['twitter', 'https://twitter.com/', 'twitter.png','アメリカ合衆国、カリフォルニア州サンフランシスコに本社を置くTwitter, Inc.のソーシャル・ネットワーキング・サービス。「ツイート」と呼ばれる半角280文字（日本語、中国語、韓国語は全角140文字）以内のメッセージや画像、動画、URLを投稿できる。'],
  ['ubereats', 'https://www.ubereats.com/ja-JP/', 'uber_eats.png','モバイルアプリケーション(iOS、Androidのみ対応)を使って対応している飲食店に出前を注文できる'],
  ['yahoo', 'https://www.yahoo.co.jp', 'yahoo.png','インターネット関連サービスの提供を行っていた企業の草分けの1つであり、検索エンジンをはじめとしたポータルサイトの運営企業。'],
  ['youtube', 'https://www.youtube.com', 'youtube.png','アメリカ合衆国・カリフォルニア州サンブルーノに本社を置く世界最大の動画共有サービス。Youは「あなた」、Tubeは「ブラウン管（テレビ）」という意味である。'],
  ['楽天市場', 'http://www.rakuten.co.jp/', '楽天.png','国内最大の電子商店街である「楽天市場」（らくてんいちば）を運営'],
  ['google map', 'https://www.google.co.jp/maps', 'google_map.png','Googleがインターネットを通して提供している地図、ローカル（地域）検索サービス。'],
  ['google', 'https://www.google.com', 'google.png','Googleが提供する検索エンジンで、World Wide Web上で最も多く使われている検索エンジンである'],
  ['ameba', 'http://www.ameba.jp/', 'ameba.png','株式会社サイバーエージェントが運営しているネットサービスのブランド名である。ブログサービス、交流サイト、ニュースサイトなどを運営。'],
  ['yahoo天気', 'http://weather.yahoo.co.jp/weather/', 'yahoo天気.png','Yahoo! JAPANが運営する天気予報サイト。日本国内の天気の情報を提供しているサイトである。'],
  ['食べログ', 'http://tabelog.com/', 'taberogu.png','カカクコムグループが運営するグルメレビューサイトである。コンセプトは「ランキングと口コミで探せるグルメサイト」。ユーザーの口コミと共に全国のレストラン情報が掲載されている。'],
  ['livedoor', 'http://www.livedoor.com/', 'livedoor.png','ライブドア (英: livedoor) は、韓国のインターネットサービス会社であるネイバーの子会社、LINEが運営するポータルサイトである。'],
  ['wikipedia', 'https://www.wikipedia.org/', 'wikipedia.png',' ウィキメディア財団が運営しているインターネット百科事典である。コピーレフトなライセンスのもと、サイトにアクセス可能な誰もが無料で自由に編集に参加できる。世界の各言語で展開されている。'],
  ['LINE', 'https://line.me/ja/', 'line.png','LINE株式会社（旧NHN Japan株式会社）が開発し提供するソーシャル・ネットワーキング・サービス(SNS)、ならびに同サービスにおけるクライアントソフトウェアの名称である。スマートフォンやパソコンに対応し、インターネット電話やテキストチャットなどの機能を有する。'],
  ['google翻訳', 'https://translate.google.co.jp', 'google翻訳.png','Googleが提供する翻訳サイトで、テキストの一部分、もしくはウェブページ全体を他言語に翻訳するサービスである']
].each do |name, url, image,text|
  Favorite.create!(
    { name: name, url: url, image: open("#{Rails.root}/app/assets/images/#{image}"), text: text }
  )
end