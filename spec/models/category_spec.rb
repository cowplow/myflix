require 'spec_helper'

describe Category do
  it {should have_many(:videos)}

  describe "recent_videos" do
    it "returns an array of 6 videos in this category" do
      test = Category.create(name:"Test")
      Video.create(title: "First", description: "1", category: test)
      Video.create(title: "Two", description: '2', category: test)
      Video.create(title: "Three", description: '3', category: test)
      Video.create(title: "Four", description: '4', category: test)
      Video.create(title: "Five", description: '5', category: test)
      Video.create(title: "Six", description: '6', category: test)
      expect(test.recent_videos.length).to eq(6)
    end
    it "returns an array of six videos if more than six videos" do
      test = Category.create(name:"Test")
      Video.create(title: "First", description: "1", category: test)
      Video.create(title: "Two", description: '2', category: test)
      Video.create(title: "Three", description: '3', category: test)
      Video.create(title: "Four", description: '4', category: test)
      Video.create(title: "Five", description: '5', category: test)
      Video.create(title: "Six", description: '6', category: test)
      Video.create(title: "Seven", description: '7', category: test)
      expect(test.recent_videos.length).to eq(6)
    end
    it "returns an array with all videos in this category if less than 6" do
      test = Category.create(name:"Test")
      Video.create(title: "First", description: "1", category: test)
      Video.create(title: "Two", description: '2', category: test)
      Video.create(title: "Three", description: '3', category: test)
      Video.create(title: "Four", description: '4', category: test)
      expect(test.recent_videos.length).to eq(4)
    end
    it "returns the six most recent videos" do
      test = Category.create(name:"Test")
      one = Video.create(title: "First", description: "1", category: test, created_at: 6.hours.ago)
      two = Video.create(title: "Two", description: '2', category: test, created_at: 5.hours.ago)
      three = Video.create(title: "Three", description: '3', category: test, created_at: 4.hours.ago)
      four = Video.create(title: "Four", description: '4', category: test, created_at: 3.hours.ago)
      five = Video.create(title: "Five", description: '5', category: test, created_at: 2.hours.ago)
      six = Video.create(title: "Six", description: '6', category: test, created_at: 1.hour.ago)
      seven = Video.create(title: "Seven", description: '7', category: test)
      expect(test.recent_videos).to eq([seven, six, five, four, three, two])
      #expect(test item).not_to include(some thing) 
    end
  end
end

