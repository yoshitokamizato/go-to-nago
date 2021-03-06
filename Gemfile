source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

gem 'carrierwave'
gem 'activeadmin' # 管理者画面作成用
gem 'devise'
gem 'devise-bootstrap-views', '~> 1.0'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'rails-i18n'
gem 'enum_help' #enumの日本語化
gem 'rmagick'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'font-awesome-sass'
gem 'kaminari'
gem 'dotenv-rails'
gem 'sendgrid-ruby'

gem 'omniauth-twitter'
gem 'fog-aws'


# hirb: 出力結果を表形式で出力する
# hirb-unicode: マルチバイト文字の表示を補正する
gem 'hirb'
# gem 'hirb-unicode'
gem 'hirb-unicode-steakknife'

# デバッグ用
gem 'pry-rails'
gem 'pry-byebug'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# パンくずリスト
gem 'gretel'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
  # rubocop
  gem 'rubocop-rails', require: false
  # rubocopをcommit前に実行
  gem 'pre-commit'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

group :production, :staging do
  gem 'unicorn'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
1
