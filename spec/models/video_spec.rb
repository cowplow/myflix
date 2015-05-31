require 'spec_helper'

describe Video do
  it { should belong_to(:category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should have_many(:reviews).order("created_at DESC") }

  describe ".search_by_title" do
    it "returns an empty array if there is no match" do
      futurama = Video.create(title: "Futurama", description: "The crab with the jab")
      back_to_the_future = Video.create(title: "Back to the Future", description: "Biff")
      expect(Video.search_by_title("Cat")).to eq([])
    end
    it "returns an array of 1 video for an exact match" do
      futurama = Video.create(title: "Futurama", description: "The crab with the jab")
      back_to_the_future = Video.create(title: "Back to the Future", description: "Biff")
      expect(Video.search_by_title("Futurama")).to eq([futurama])
    end
    it "returns an array of 1 video for a partial match" do
      futurama = Video.create(title: "Futurama", description: "The crab with the jab")
      back_to_the_future = Video.create(title: "Back to the Future", description: "Biff")
      expect(Video.search_by_title("urama")).to eq([futurama])
    end
    it "returns an array of all matches ordered by created_at" do
      futurama = Video.create(title: "Futurama", description: "The crab with the jab", created_at: 1.day.ago)
      back_to_the_future = Video.create(title: "Back to the Future", description: "Biff")
      expect(Video.search_by_title("Futur")).to eq([back_to_the_future, futurama])
    end
    it "returns an empty array if the user doesn't enter a search term" do
      futurama = Video.create(title: "Futurama", description: "The crab with the jab")
      back_to_the_future = Video.create(title: "Back to the Future", description: "Biff")
      expect(Video.search_by_title("")).to eq([])
    end
  end

end

