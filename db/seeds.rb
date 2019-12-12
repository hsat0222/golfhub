# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#prefecture seeds
Prefecture.create!(
  [
    {
        pref_name: "北海道",
        pref_region: "東北・北海道",
    },
    {
        pref_name: "青森県",
        pref_region: "東北・北海道",
    },
    {
        pref_name: "岩手県",
        pref_region: "東北・北海道",
    },
    {
        pref_name: "秋田県",
        pref_region: "東北・北海道",
    },
    {
        pref_name: "宮城県",
        pref_region: "東北・北海道",
    },
    {
        pref_name: "山形県",
        pref_region: "東北・北海道",
    },
    {
        pref_name: "福島県",
        pref_region: "東北・北海道",
    },
    {
        pref_name: "茨城県",
        pref_region: "関東",
    },
    {
        pref_name: "栃木県",
        pref_region: "関東",
    },
    {
        pref_name: "群馬県",
        pref_region: "関東",
    },
    {
        pref_name: "千葉県",
        pref_region: "関東",
    },
    {
        pref_name: "東京都",
        pref_region: "関東",
    },
    {
        pref_name: "神奈川県",
        pref_region: "関東",
    },
    {
        pref_name: "山梨県",
        pref_region: "中部",
    },
    {
        pref_name: "長野県",
        pref_region: "中部",
    },
    {
        pref_name: "新潟県",
        pref_region: "中部",
    },
    {
        pref_name: "富山県",
        pref_region: "中部",
    },
    {
        pref_name: "石川県",
        pref_region: "中部",
    },
    {
        pref_name: "福井県",
        pref_region: "中部",
    },
    {
        pref_name: "静岡県",
        pref_region: "中部",
    },
    {
        pref_name: "愛知県",
        pref_region: "中部",
    },
    {
        pref_name: "岐阜県",
        pref_region: "中部",
    },
    {
        pref_name: "三重県",
        pref_region: "近畿",
    },
    {
        pref_name: "滋賀県",
        pref_region: "近畿",
    },
    {
        pref_name: "京都府",
        pref_region: "近畿",
    },
    {
        pref_name: "大阪府",
        pref_region: "近畿",
    },
    {
        pref_name: "兵庫県",
        pref_region: "近畿",
    },
    {
        pref_name: "奈良県",
        pref_region: "近畿",
    },
    {
        pref_name: "和歌山県",
        pref_region: "近畿",
    },
    {
        pref_name: "鳥取県",
        pref_region: "中国",
    },
    {
        pref_name: "鳥取県",
        pref_region: "中国",
    },
    {
        pref_name: "島根県",
        pref_region: "中国",
    },
    {
        pref_name: "岡山県",
        pref_region: "中国",
    },
    {
        pref_name: "広島県",
        pref_region: "中国",
    },
    {
        pref_name: "山口県",
        pref_region: "中国",
    },
    {
        pref_name: "香川県",
        pref_region: "四国",
    },
    {
        pref_name: "愛媛県",
        pref_region: "四国",
    },
    {
        pref_name: "徳島県",
        pref_region: "四国",
    },
    {
        pref_name: "高知県",
        pref_region: "四国",
    },
    {
        pref_name: "福岡県",
        pref_region: "九州・沖縄",
    },
    {
        pref_name: "佐賀県",
        pref_region: "九州・沖縄",
    },
    {
        pref_name: "長崎県",
        pref_region: "九州・沖縄",
    },
    {
        pref_name: "熊本県",
        pref_region: "九州・沖縄",
    },
    {
        pref_name: "大分県",
        pref_region: "九州・沖縄",
    },
    {
        pref_name: "宮崎県",
        pref_region: "九州・沖縄",
    },
    {
        pref_name: "鹿児島県",
        pref_region: "九州・沖縄",
    },
    {
        pref_name: "沖縄県",
        pref_region: "九州・沖縄",
    },
    {
        pref_name: "その他",
        pref_region: "その他",
    }
  ]
)

Map.create!(
  [
    {
      place: "DMMカントリークラブ",
    },
    {
      place: "関東国際DMMゴルフクラブ",
    },
    {
      place: "笠岡カントリークラブ",
    },
    {
      place: "横浜ゴルフクラブ",
    },
  ]
)

Round.create!(
  [
    {
      prefecture_id: "4",
      round_title: "クリスマスコンペ2019",
      round_date: "2019-12-22",
      capacity: "80",
      map_id: "1",
      round_intro: "1ラウンド紹介1ーーーえええええええええええええええええええええええええええええええええええええええええーーーーーーーーーーーーーー",
      recruitment_sex: "3",
    },
    {
      prefecture_id: "6",
      round_title: "打ち納めコンペ",
      round_date: "2019-12-20",
      capacity: "80",
      map_id: "2",
      round_intro: "2ラウンド紹介2ーーーーーーーうううううううううううううううううううういういういううううううううううううううううううううううううううーーーーーーーーーー",
      recruitment_sex: "3",
    },
    {
      prefecture_id: "8",
      round_title: "お正月コンペ2020",
      round_date: "2020-01-03",
      capacity: "40",
      map_id: "3",
      round_intro: "3ラウンド紹介3ーーーーーいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいーーーーーーーーーーーー",
      recruitment_sex: "3",
    },
    {
      prefecture_id: "20",
      round_title: "どなたでも大歓迎！",
      round_date: "2019-12-18",
      capacity: "4",
      map_id: "1",
      round_intro: "4ラウンド紹介4ーーーーーーーあああああああああああああああああああああああああああああああああああああああーーーーーーーーーー",
      recruitment_sex: "3",
    }
  ]
)

User.create!(
  [
    {
      email: "a@a",
      password: "111111",
      prefecture_id: "15",
      user_name: "たろうさん",
      user_image_id: "",
      age: "20代",
      exp_golf: "1~2年",
      av_score: "101~110",
      user_sex: "0",
      user_job: "会社員",
      user_intro: "まだまだ初心者ですが、よろしくおねがいします",
    },
    {
      email: "b@b",
      password: "111111",
      prefecture_id: "21",
      user_name: "ICHIRO",
      user_image_id: "",
      age: "40代",
      exp_golf: "1年未満",
      av_score: "71~80",
      user_sex: "0",
      user_job: "その他",
      user_intro: "引退しました",
    },
    {
      email: "c@c",
      password: "111111",
      prefecture_id: "40",
      user_name: "しぶこ",
      user_image_id: "",
      age: "20代",
      exp_golf: "5年以上",
      av_score: "70以下",
      user_sex: "1",
      user_job: "その他",
      user_intro: "プロゴルファーです",
    },
    {
      email: "d@d",
      password: "111111",
      prefecture_id: "34",
      user_name: "T.Woods",
      user_image_id: "",
      age: "50代",
      exp_golf: "10年以上",
      av_score: "70以下",
      user_sex: "0",
      user_job: "会社員",
      user_intro: "I am regend",
    }
  ]
)

UsersRound.create!(
  [
    {
      user_id: "1",
      round_id: "1",
      approval_flag: "1",
    },
    {
      user_id: "2",
      round_id: "1",
      approval_flag: "1",
    },
    {
      user_id: "1",
      round_id: "2",
      approval_flag: "1",
    },
    {
      user_id: "3",
      round_id: "2",
      approval_flag: "1",
    },
    {
      user_id: "4",
      round_id: "2",
      approval_flag: "1",
    },
    {
      user_id: "2",
      round_id: "3",
      approval_flag: "1",
    },
    {
      user_id: "3",
      round_id: "4",
      approval_flag: "1",
    },
    {
      user_id: "4",
      round_id: "1",
      approval_flag: "0",
    },
    {
      user_id: "3",
      round_id: "1",
      approval_flag: "0",
    },
    {
      user_id: "1",
      round_id: "3",
      approval_flag: "1",
    },
    {
      user_id: "1",
      round_id: "4",
      approval_flag: "0",
    }
  ]
)

Comment.create!(
  [
    {
      user_id: "1",
      round_id: "1",
      comment: "よろしくお願いします",
    },
    {
      user_id: "2",
      round_id: "1",
      comment: "はじめまして、イチローです",
    },
  ]
)
