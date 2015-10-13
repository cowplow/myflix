require 'spec_helper'

feature "User interacts with the queue" do
  scenario "user adds and reorders videos in the queue" do
    
    comedies = Fabricate(:category)
    monk = Fabricate(:video, title: "Monk", category: comedies)
    south_park = Fabricate(:video, title: "South Park", category: comedies)
    futurama = Fabricate(:video, title: "Fututrama", category: comedies)

    sign_in

    add_video_to_queue(monk)
    expect_video_to_be_in_queue(monk)
    
    visit video_path(monk)
    expect_link_not_be_seen("+ My Queue")

    add_video_to_queue(south_park)
    add_video_to_queue(futurama)
    
    set_video_position(monk, 3)
    set_video_position(south_park, 1)
    set_video_position(futurama, 2)
    update_queue
    
    expect_video_position(south_park, 1)
    expect_video_position(futurama, 2)
    expect_video_position(monk, 3)

    #= using this line in the queue_item index view
      #= data: {video_id: queue_item.video.id}
    #find("input[data-video-id='#{monk.id}']").set(3)
    #find("input[data-video-id='#{south_park.id}']").set(1)
    #find("input[data-video-id='#{futurama.id}']").set(2)
    #click_button "Update Instant Queue"
    #expect(find("input[data-video-id='#{south_park.id}']").value).to eq("1")
    #expect(find("input[data-video-id='#{futurama.id}']").value).to eq("2")
    #expect(find("input[data-video-id='#{monk.id}']").value).to eq("3")

    #Easiest solution to finding the above items, but sloppy incase designer needed id for css or for java script
    #fill_in "video_#{monk.id}", with: 3
    #fill_in "video_#{south_park.id}", with: 1
    #fill_in "video_#{futurama.id}", with: 2
    #click_button "Update Instant Queue"
    #expect(find("#video_#{south_park.id}").value).to eq("1")
    #expect(find("#video_#{futurama.id}").value).to eq("2")
    #expect(find("#video_#{monk.id}").value).to eq("3")
  end

  def add_video_to_queue(video)
    visit home_path
    find("a[href='/videos/#{video.id}']").click
    click_link "+ My Queue"
  end

  def set_video_position(video, position)
      within(:xpath, "//tr[contains(.,'#{video.title}')]") do
        fill_in "queue_items[][position]", with: position
      end
    end 

    def expect_video_position(video, position)
      expect(find(:xpath, "//tr[contains(.,'#{video.title}')]//input[@type='text']").value).to eq("#{position}")
    end

    def expect_video_to_be_in_queue(video)
      page.should have_content(video.title)
    end

    def expect_link_not_be_seen(link_text)
      page.should_not have_content(link_text)
    end

    def update_queue
      click_button "Update Instant Queue"
    end
end