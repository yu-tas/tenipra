DifficultyLevel.create(step: "初級")
DifficultyLevel.create(step: "中級")
DifficultyLevel.create(step: "上級")

labels = ["球出し練習", "ラリー練習","実戦練習"]
labels.each do |label_name|
  Label.create!(name: label_name)
end