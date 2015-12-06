require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "message me" do
    msg = Message.new(
      name: 'cornholio',
      email: 'cornholio@example.com',
      content: 'Hello from the internet'
    )

    email = MessageMailer.message_me(msg).deliver_now

    refute ActionMailer::Base.deliveries.empty?

    assert_equal ['zim1994.hi@gmail.com'], email.to
    assert_equal ['cornholio@example.com'], email.from
    assert_equal 'Contact Car rental', email.subject
    assert_equal 'Hello from the internet', email.body.to_s
  end
  test "succesful post" do
  assert_difference 'ActionMailer::Base.deliveries.size', 1 do
    post :create, message: {
      name: 'cornholio',
      email: 'cornholio@example.com',
      subject: 'hi',
      content: 'bai'
    }
  end

  assert_redirected_to new_message_path
  last_email = ActionMailer::Base.deliveries.last

  assert_equal "hContact Car rental", last_email.subject
  assert_equal 'zim1994.hi@gmail.com', last_email.to[0]
  assert_equal 'cornholio@example.com', last_email.from[0]
  assert_match(/bai/, last_email.body.to_s)

  ActionMailer::Base.deliveries.clear
end
end
