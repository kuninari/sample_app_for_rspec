# ヘッドレスドライバで、ブラウザの表示有無を切り替える設定
RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium, using: :headless_chrome
  end
end