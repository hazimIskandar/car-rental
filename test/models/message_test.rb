require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'respond to name, email, subject and content' do
  	msg = Message.new
  	[:name, :email, :subject, :content].each do |attr|
  		assert msg.respond_to? attr
  	end
  end
  test 'should accept valid atributes' do
  	valid_attrs = {
  		name: 'hazim',
  		email: 'hazim@example.com',
  		subject: 'hi',
  		content: 'thisdasda'
  	}
  	msg = Message.new valid_attrs
  	assert msg.valid?
  end
  
  test 'should get new' do
  	get :new
  	assert_response :success
  end
end
