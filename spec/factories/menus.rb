FactoryBot.define do
  factory :menu do
    title { '基本練習' }
    description { 'このメニューでは基本的なテニスの技術を学びます。' }
    video_link { 'https://youtu.be/oU8Zbq0TvGM' }
    difficulty_level_id { 1 } # 難易度レベルを適切に設定
    practice_duration { 30 }
    sets { 3 }
    player_count { 2 }
    player_positions { [] } # 必要に応じて設定
    # user_id { 1 } # 必要に応じて設定
  end
  
  factory :second_menu, class: Menu do
    title { 'アドバンス練習' }
    description { '上級者向けの練習メニューです。' }
    video_link { 'https://youtu.be/oU8Zbq0TvGM' }
    difficulty_level_id { 2 } # 難易度レベルを適切に設定
    practice_duration { 60 }
    sets { 5 }
    player_count { 4 }
    player_positions { [] } # 必要に応じて設定
    # user_id { 2 } # 必要に応じて設定
  end
end
