require "test_helper"

class PostTest < ActiveSupport::TestCase
  def post
    @post = Post.new(postbody: "sample text for post test", user_id: "1")
  end

  def test_valid
    assert post.valid?
  end
end
