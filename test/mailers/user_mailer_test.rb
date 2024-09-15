require "test_helper"

class UserMailerTest < ActionMailer::TestCase
<<<<<<< HEAD
  # test "the truth" do
  #   assert true
  # end
=======
  test "new_user_email" do
    mail = UserMailer.new_user_email
    assert_equal "New user email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

>>>>>>> 971f24985a6ceac6209dea3aecf3bf93b63a5c73
end
