source "http://rubygems.org"

gemspec

gem "rails", "~> 3.2.6"
gem "archangel"
gem "rdoc"
gem "devise"

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
