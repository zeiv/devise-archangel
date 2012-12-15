source "http://rubygems.org"

gem "devise-archangel", :path => ".."

gem "rails", "~> 3.1.0"
gem "devise"
gem "archangel"
gem "rdoc"

group :test do
  gem "archangel"
  gem "omniauth-openid", "~> 1.0.1"
  gem "webrat", "0.7.2", :require => false
  gem "mocha", :require => false

  platforms :mri_18 do
    gem "ruby-debug", ">= 0.10.3"
  end
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
