FactoryBot.define do
  factory :task do
    title { 'タイトル' }
    content { 'コンテンツ' }
    status { 0 }
    # factoryで定義している名称がモデル名と一致する場合、associationを省略できる。
    user
  end
end
