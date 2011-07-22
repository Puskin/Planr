Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '235888639776537', 'e36ae695382f960d3334d853c936754c', {:scope => 'read_friendlists,offline_access,email'}
end