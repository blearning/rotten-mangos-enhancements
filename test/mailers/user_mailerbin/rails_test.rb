require 'test_helper'

class UserMailerbin::RailsTest < ActionMailer::TestCase
  test "generate" do
    mail = UserMailerbin::Rails.generate
    assert_equal "Generate", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "mailer" do
    mail = UserMailerbin::Rails.mailer
    assert_equal "Mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "UserMailer" do
    mail = UserMailerbin::Rails.UserMailer
    assert_equal "Usermailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
