require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "send_results" do
    mail = UserMailer.send_results
    assert_equal "Send results", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
