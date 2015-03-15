require 'spec_helper'

describe Video do
  it "saves itself" do
    video = Video.new(title: "Test title", description: "A fish and ham sandwich", small_cover_url: "/public/tmp/monk.jpg", large_cover_url: "/public/tmp/monk_large.jpg")
    video.save
    #Video.first.title.should == "Test title"
    expect(Video.first).to eq(video)
  end
end

