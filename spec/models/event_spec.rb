require 'rails_helper'

RSpec.describe Event, :type => :model do
  describe "#active?" do
    it "returns ture when the end time dose not be reached" do
      event = Fabricate(:event, end_time: 1.day.from_now)
      expect(event.active?).to be_truthy
    end
    it "returns false when reached the end time" do
      event = Fabricate(:event, end_time: 1.day.ago)
      expect(event.active?).to be_falsey
    end
  end

  describe "default_scope order" do
    it "always sort by end_time DESC" do
      event1 = Fabricate(:event, end_time: 1.day.from_now)
      event2 = Fabricate(:event, end_time: 2.day.from_now)
      event3 = Fabricate(:event, end_time: 1.day.ago)

      expect(Event.all).to eq([event2, event1, event3])
    end
  end
end
