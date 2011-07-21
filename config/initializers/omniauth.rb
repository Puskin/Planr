Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '235888639776537', 'e36ae695382f960d3334d853c936754c'
end