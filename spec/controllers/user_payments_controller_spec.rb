require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe UserPaymentsController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # UserPayment. As you add validations to UserPayment, be sure to
  # adjust the attributes here as well.
  before do
    @space = create :space
    request.env["HTTP_REFERER"] = space_path(@space)
    sign_in :user, user
  end

  describe 'GET #new' do
    it "should be success" do
      get :new, space_id: @space.id
      expect(response).to be_success
    end

    it "should have correct assigns" do
      get :new, space_id: @space.id
      expect(assigns[:space_membership]).to be_instance_of(SpaceMembership)
      expect(assigns[:space_membership]).to be_new_record
    end
  end

end
