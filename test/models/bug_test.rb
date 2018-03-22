require 'test_helper'

class BugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @bug = Bug.create(title: "bug title", description: "Test bug description", issue_type:2, priority:1, status:1)
  end

  test "Bug must be valid" do
    assert @bug.valid?
  end

  test "title must be present" do
    @bug.title = ""
    assert_not @bug.valid?
  end

  test "description must be present" do
    @bug.description = ""
    assert_not @bug.valid?
  end

  test "issue type must be valid" do
    invalid_issuetypes = [-10, 4, 15, 8]
    invalid_issuetypes.each do |ii|
      begin
        @bug.issue_type ii
        assert false, "#{ii} should be invalid}"
      rescue
        assert true
      end
    end
  end

  test "priority must be valid" do
    valid_priority = [:low, :medium, :high]
    valid_issuetypes.each do |vp|
      begin
        @bug.priority vp
        assert true
      rescue
        assert false, "#{vp} should be invalid}"
      end
    end
  end

  test "status must be valid" do
    valid_statuses = [:open, :closed, :monitor]
    valid_statuses.each do |vs|
      begin
        @bug.status vs
        assert true
      rescue
        assert false, "#{vs} should be invalid}"
      end
    end
  end


end
