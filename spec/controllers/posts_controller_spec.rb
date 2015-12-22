require 'rails_helper.rb'
require 'support/controller_macros.rb'
require 'support/factory_girl.rb'

RSpec.describe PostsController, type: :controller do
    login_user
    describe 'GET #new' do
    with :post
       context "with valid attributes" do
                before do
                post :create, post: FactoryGirl.attributes_for(:post)
                end
            #it { is_expected.to change(Post,:count).by(1) }
            #it {is_expected.to respond_with :redirect}
            #it {is_expected.to last_request.path.should == '/'}
            it "should be successful" do
               # response.code.should == "302"
                #response.should redirect_to(ho)    
            end
           # end
        end
    end
end