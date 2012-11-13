source "http://rubygems.org"

gemspec

gem "rails", "~> 3.2.6"
gem "archangel"
gem "rdoc"

group :test do
  gem "archangel"
  gem "omniauth-openid", "~> 1.0.1"
  gem "webrat", "0.7.2", :require => false
  gem "mocha", "0.10.0", :require => false
end

platforms :jruby do
  gem "activerecord-jdbc-adapter"
  gem "activerecord-jdbcsqlite3-adapter"
  gem "jruby-openssl"
end

platforms :ruby do
  gem "sqlite3"

  group :mongoid do
    gem "mongoid", "~> 3.0"
  end
end
