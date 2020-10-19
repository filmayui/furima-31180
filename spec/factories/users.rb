FactoryBot.define do
  factory :user do
    nickname              {"spec"}
    email                 {"ab@cd"}
    password              {"1234abcd"}
    password_confirmation {password}
    last_name             {"沼"}
    first_name            {"島"}
    last_name_kana        {"アンダーグラウンド"}
    first_name_kana       {"シー"}
    birth_date            {"1930-01-01"}
  end
end
