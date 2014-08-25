Then(/^as a staff member, I am able to create an appraisal$/) do

  add_appraisal

  within_window(last_window) do
    $create_property.select_new_appraisal
    $create_property.click_next
  end
end

Then /^as a staff member, I am able to create an appraisal with the following:$/ do |table|
  sleep 3
  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)


    # $appraisal_form.input_phoneAH "0431 200 200"
    # $appraisal_form.input_phoneBH "0431 222 222"

    # $appraisal_form.input_email "test@test.com"
    $appraisal_form.select_agent mapped['agent']
    $appraisal_form.input_street_number @timeStamp
    $appraisal_form.input_street mapped['street']
    $appraisal_form.select_suburb
    $appraisal_form.select_state mapped['state']
    $appraisal_form.confirm_postcode.should == mapped['postcode']
    $appraisal_form.input_bedrooms mapped['bedrooms']
    $appraisal_form.input_bathrooms mapped['bathrooms']
    $appraisal_form.agent_min_price mapped['agent_min_price']
    $appraisal_form.agent_max_price mapped['agent_max_price']
    $appraisal_form.client_min_price mapped['client_min_price']
    $appraisal_form.client_max_price mapped['client_max_price']
    $appraisal_form.land_size mapped['land_size']
    $appraisal_form.land_rates mapped['land_rates']
    $appraisal_form.select_priority mapped['priority']
    $appraisal_form.search_surname mapped['fName']
    $appraisal_form.search_firstName mapped['lName']

    # $appraisal_form.select_vendor
    $appraisal_form.select_post
    $appraisal_form.input_post_street mapped['street']
    $appraisal_form.input_post_suburb mapped['suburb']
    $appraisal_form.input_post_postcode mapped['postcode']
    $appraisal_form.select_email
    $appraisal_form.select_vendor

    $appraisal_form.click_save
  end

  within_window(last_window) do
    click_button("Next")
  end
end

Then /^as a staff member, I am able to create an appraisal for "(.*?)" property for "(.*?)" with the following:$/ do |type, action, table|

  add_appraisal

  within_window(last_window) do
    $create_property.select_new_appraisal
    $create_property.select_property_type type
    $create_property.select_property_action action
    $create_property.click_next
  end
  sleep 3
  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)
    $appraisal_form.select_agent mapped['agent']
    $appraisal_form.input_street_number @timeStamp
    $appraisal_form.input_street mapped['street']
    $appraisal_form.select_suburb
    $appraisal_form.select_state mapped['state']
    $appraisal_form.confirm_postcode.should == mapped['postcode']
    $appraisal_form.agent_min_price mapped['agent_min_price']
    $appraisal_form.agent_max_price mapped['agent_max_price']
    $appraisal_form.client_min_price mapped['client_min_price']
    $appraisal_form.client_max_price mapped['client_max_price']
    $appraisal_form.land_size mapped['land_size']
    $appraisal_form.select_priority mapped['priority']

    $appraisal_form.search_surname mapped['fName']
    $appraisal_form.search_firstName mapped['lName']

    $appraisal_form.select_email
    $appraisal_form.select_vendor
    if type == "Rural"
      $appraisal_form.select_category "Bare Land"
    end
    $appraisal_form.click_save
  end

  within_window(last_window) do
    # attach_file("stillName_1", File.expand_path("features/baseline_screenshots/track.JPG"))
    # analyze
    # img = find(".formfield")
    # img.native.send_keys File.expand_path("features/baseline_screenshots/track.JPG")
    click_button("Next")

  end
end

Then /^as a staff member, I am able to create an appraisal for "(.*?)" rental property for "(.*?)" with the following:$/ do |type, action, table|

  add_appraisal

  within_window(last_window) do
    $create_property.select_new_appraisal
    $create_property.select_property_type type
    $create_property.select_property_action action
    $create_property.click_next
  end
  sleep 3
  within_window(last_window) do

    mapped = Hash.new
    mapped = table_transpose(table)
    $appraisal_form.select_rental_agent mapped['agent']
    $appraisal_form.input_street_number @timeStamp
    $appraisal_form.input_street mapped['street']
    $appraisal_form.select_suburb
    $appraisal_form.select_state mapped['state']
    $appraisal_form.confirm_postcode.should == mapped['postcode']
    $appraisal_form.weekly_rental mapped['weekly']
    $appraisal_form.select_priority mapped['priority']
    # $appraisal_form.monthly_rental.should == mapped['monthly']
    # $appraisal_form.rental_bond mapped['bond']
    # $appraisal_form.display_price.should == mapped['display']

    if type == "Residential"
      $appraisal_form.input_bedrooms mapped['bedrooms']
      $appraisal_form.input_bathrooms mapped['bathrooms']
      $appraisal_form.input_garages mapped['garages']
      $appraisal_form.input_carports mapped['carports']
    end
    # $appraisal_form.search_surname mapped['fName']
    # $appraisal_form.search_firstName mapped['lName']
    #
    # $appraisal_form.select_email
    # $appraisal_form.select_vendor
    if type == "Rural"
      $appraisal_form.select_category "Bare Land"
    end

    $appraisal_form.click_save
  end

  within_window(last_window) do
    # attach_file("stillName_1", File.expand_path("features/baseline_screenshots/track.JPG"))
    # analyze
    # img = find(".formfield")
    # img.native.send_keys File.expand_path("features/baseline_screenshots/track.JPG")
    click_button("Next")

  end
end

Then(/^as a staff member, I apply business rules to the appraisal$/) do
  # if $brw == "chrome" #BUG: in chrome that window can't be dragged
  wait_for_window("span.ui-icon.ui-icon-closethick")
  within_window(last_window) do
    if has_css? "span.ui-icon.ui-icon-closethick"
      $appraisal_rules.close_window
      sleep 1
    end
  end
  #   else
  #     analyze
  #   within_window(last_window) do
  #     $appraisal_rules.select_first_job
  #     $appraisal_rules.approve_selected
  #     $appraisal_rules.close_window
  #     sleep 1
  #   end
  # end
end

And(/^as a staff member, I select to edit an appraisal$/) do
  within_window(last_window) do
    $appraisal_page.edit_all
  end
end

And(/^as a staff member, I select to edit appraisal status$/) do
  within_window(last_window) do
    $appraisal_page.edit_status
  end
end

Then(/^as a staff member, I can "(.*?)" the appraisal details with the following:$/) do |action, table|

  table.hashes.each do |mapped|

    if action == "edit"
      steps %{ And as a staff member, I select to edit an appraisal
  }
      wait_for_window("#propStreetName")
      within_window(last_window) do
        $appraisal_form.input_street_number @timeStamp
        $appraisal_form.input_street mapped['street']

        # $appraisal_form.select_suburb
        $appraisal_form.select_state mapped['state']
        $appraisal_form.input_bedrooms mapped['bedrooms']
        $appraisal_form.input_bathrooms mapped['bathrooms']
        $appraisal_form.click_save
        sleep 1
      end

    else

      within_window(last_window) do
        confirm_appraisal(@timeStamp, mapped)
      end
    end
  end
  sleep 2
end

Then(/^as a staff member, I confirm my appraisal is "(.*?)"$/) do |status|
  sleep 2
  within_window(last_window) do
    $appraisal_page.check_display.should == status
  end
end

Then(/^as a staff member, I change the appraisal status to "(.*?)"$/) do |status|
  steps %{ And as a staff member, I select to edit appraisal status
  }
  within_window(last_window) do
    $appraisal_status.select_status status
    $appraisal_status.click_save
    sleep 1
  end
end

Then(/^as a staff member, I confirm the appraisal status to "(.*?)"$/) do |status|
  sleep 5
  within_window(last_window) do
    $appraisal_page.check_status.downcase.should include(status.downcase)
  end
end

Then(/^as a staff member, I set the appraisal display to "(Active|Inactive)"$/) do |show|
  steps %{ And as a staff member, I select to edit appraisal status
  }
  if show == "Inactive"
    within_window(last_window) do
      $appraisal_status.set_display '0'
      $appraisal_status.click_save
    end
  else
    within_window(last_window) do
      $appraisal_status.set_display '1'
      $appraisal_status.click_save
    end
  end
end

#Helpers method
def confirm_appraisal(timeStamp, mapped)
  within_window(last_window) do
    $appraisal_page.get_address.downcase.should include (timeStamp + " " + mapped['street'].downcase)
  end
end

def add_appraisal
  within_window(last_window) do
    $control_panel.page_loaded
    $control_panel.add_property
  end
end