FactoryBot.define do
  factory :task do
    sequence(:title, 'title_1')
    content { 'コンテンツ' }
    status { :todo }
    deadline { 1.week.from_now }
    # factoryで定義している名称がモデル名と一致する場合、associationを省略できる。
    user
  end
end
