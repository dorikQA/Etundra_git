class OrderTrack< ScreenActions
  include RSpec::Matchers

  #
  # def cantfindorder_message(message)
  # $driver.find_elements(:xpath,"//span[contains(text(), '#{message}')]")
  # end
  # def provideallinfo_message
  #   $driver.find_element(:xpath,"//span[contains(text(), 'Please provide all information')]")
  # end
  # def enterpostal_message
  #   $driver.find_element(:xpath,"//div[contains(text(), 'Enter Destination Postal Code')]")
  # end
  # def enterorder_message
  #   $driver.find_element(:xpath,"//div[contains(text(), 'Enter Destination Postal Code')]")
  # end
  # def track_page_title
  #   $driver.find_element(:xpath,"//h1[contains(text(), 'Track Order')]")
  # end


  def page_name(title)
    $driver.find_elements(:xpath,"//h1[contains(text(), '#{title}')]")
  end

  end