def stub_env_for_facebook(provider = "facebook", uid = "1234567", email = "bob@contoso.com", name = "John Doe")
  env = { "omniauth.auth" => { "provider" => provider, "uid" => uid, "info" => { "email" => email, "name" => name } } }
  @controller.stub!(:env).and_return(env)
  env
end

def stub_env_for_twitter(provider = "twitter", uid = "1234567", email = "bob@contoso.com", name = "John Doe")
  env = { "omniauth.auth" => { "provider" => provider, "uid" => uid, "info" => { "email" => email, "name" => name } } }
  @controller.stub!(:env).and_return(env)
  env
end

def set_invalid_omniauth_facebook(opts = {})

  credentials = { :provider => :facebook,
                  :invalid  => :invalid_crendentials
                 }.merge(opts)

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]

end

def set_invalid_omniauth_twitter(opts = {})

  credentials = { :provider => :twitter,
                  :invalid  => :invalid_crendentials
                 }.merge(opts)

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]

end

