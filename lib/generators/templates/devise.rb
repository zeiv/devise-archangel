# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # ==> Archangel
  # Add a new Archangel provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.archangel :github, 'APP_ID', 'APP_SECRET', :scope => 'user,public_repo'
end
