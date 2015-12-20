require 'rails_helper'
require 'support/controller_macros.rb'
require 'support/factory_girl.rb'


RSpec.describe Users::OmniauthCallbacksController, type: :controller do
 
 describe "Facebook Log in" do
   before do

     Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
     Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
     visit new_user_registration_path
     #stub_env_for_facebook()
     click_link_or_button "Sign in with Facebook"
     @request.session[:facebook_data] = OmniAuth.config.mock_auth[:facebook]
 
   end
     # it {is_expected.to respond_with :ok}
      it {is_expected.to render_with_layout :application}
      it {is_expected.to render_template :new}
 end
 
 describe "Twitter Log in" do
   before do
      Rails.application.env_config["devise.mapping"] = Devise.mappings[:user] # If using Devise
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
      visit new_user_registration_path
      
      #stub_env_for_twitter()

      click_link_or_button "Sign in with Twitter"
      @request.session[:twitter_data] = OmniAuth.config.mock_auth[:twitter]
   end
      #it {is_expected.to respond_with :ok}
      it {is_expected.to render_with_layout :application}
      it {is_expected.to render_template :new}
 end
  
end
