DifficultyLevel.create(step: "初級")
DifficultyLevel.create(step: "中級")
DifficultyLevel.create(step: "上級")

labels = ["球出し練習", "ラリー練習","実戦練習","ダブルス練習","シングルス練習"]
labels.each do |label_name|
  Label.create!(name: label_name)
end

5.times do |i|
  User.create!(
    email: "user#{i + 1}@example.com",
    password: "password",
    name: "User #{i + 1}",
    admin: false
  )
end

# 作成したユーザーを取得
users = User.all

# 5件のメニューを作成
5.times do |i|
  Menu.create!(
    title: "Menu Title #{i + 1}",
    description: "Description for Menu #{i + 1}",
    video_link: "",
    difficulty_level_id: 1,
    practice_duration: 30,
    sets: 3,
    player_count: 4,
    player_positions: [{
      "x": 172,
      "y": 314,
      "id": 1
    },
    {
      "x": 179,
      "y": 243,
      "id": 2
    },
    {
      "x": 164,
      "y": 184,
      "id": 3
    },
    {
      "x": 175,
      "y": 119,
      "id": 4
    },
    {
      "x": 186,
      "y": 56,
      "id": 5
    },
    {
      "x": 180,
      "y": 526,
      "id": 6
    },
    {
      "x": 82,
      "y": 632,
      "id": 7
    },
    {
      "x": 275,
      "y": 617,
      "id": 8
    }].to_json, # ここに適切なJSONデータを追加することができます。
    user_id: users[i].id
  )
end

