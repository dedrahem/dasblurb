require "test_helper"

class RelationshipTest < ActiveSupport::TestCase
  def relationship
    @relationship ||= Relationship.new
  end

  def test_valid
    assert relationship.valid?
  end
end
