require 'rails_helper'
require 'support/controller_macros.rb'
require 'support/factory_girl.rb'

RSpec.describe HomeController, type: :controller do
  login_user
 
  describe 'GET front' do
    with :user
    before do
      get :front
    end
      it {is_expected.to respond_with :ok}
      it {is_expected.to render_with_layout :application}
  end

=begin
  As a user,
  I want to see less than five posts at a time
  So that I don't get overwhelemed
=end
  
end