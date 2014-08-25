Before do
  p "Initiating scenario..."
end

After do
  # page.driver.browser.window_handles.each do |handle|
  #   page.driver.browser.switch_to.window(handle)
    page.driver.quit
    # page.execute_script "window.close()"
  # end
    sleep 2
  p "After Scenario "
end

at_exit do
  # exec `ruby report.rb`
  # visit 'http://localhost:8080/'
  p "End of Tests "

end