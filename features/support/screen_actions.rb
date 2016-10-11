class ScreenActions

  include RSpec::Matchers


  def error_message(error_message)
    $driver.find_elements(:xpath, "//*[contains(text(),'#{error_message}')]")
  end

  def link_name(link_name)
    $driver.find_element(:link_text, "#{link_name}")
  end

  def message(message)
    $driver.find_elements(:xpath, "//*[contains(text(), '#{message}')]")
  end

  def button_name(button_name)
    begin
      visible_button = []
      buttons = $wait.until { $driver.find_elements(:xpath, "//button[contains(text(),'#{button_name}')]") }
      for i in buttons
        if i.displayed?
          visible_button.push(i)
        end
      end
      return visible_button[0]
    rescue
      raise assets_element_was_not_found
    end
  end

  def button_value(button_value)
    if button_value == 'Search'
      visible_button = []
      buttons = $wait.until { $driver.find_elements(:xpath, "//*[@value = '#{button_value}']") }
      puts buttons.size
      for i in buttons
        if i.displayed?
          visible_button.push(i)
        end
      end
      return visible_button[0]
    else
      begin
        $wait.until { $driver.find_element(:xpath, "//*[@value = '#{button_value}']") }
      rescue
        raise assets_element_was_not_found
      end
    end
  end

  def page_verification(page_name)

    if page_name == "My Account"
      expect(my_account_page.page_title).to eq(page_name.upcase)
      expect(my_account_page.section_titles_act).to eq(my_account_page.section_titles_req)

    elsif page_name == "Home page"
      expect(page_header.logo_image).to be_truthy
      expect(page_header.button_value("Search")).to be_truthy

    elsif page_name == "Sign In"

      expect(sign_in_page.signin_page_title).to be_truthy
      expect(sign_in_page.page_title).to eq(page_name.downcase)

    elsif page_name == "Forgot Password"
      expect(sign_in_page.page_title).to eq(page_name.downcase)
      expect(screen_actions.button_value("Reset Password")).to be_truthy
      screen_actions.link_name("Return to Login")

    elsif page_name == 'Reset Password'
      expect(sign_in_page.page_title).to eq("reset instructions sent")

    elsif page_name == 'Order Details'
      expect().to eq("Cannot find order. Please, try again.")

    end
  end
  def pagetitle
    begin
      $wait.until { $driver.find_element(:xpath, "//div[@class = 'page-title ']/*") }
    rescue
      raise assert_raise_message
    end
  end

  # def header_icon(icon_name)
  #   begin
  #     $wait.until { $driver.find_element(:xpath, "//span[contains(text(), '#{icon_name}')]") }
  #   rescue
  #     raise assets_element_was_not_found + "#{icon_name}"
  #   end
  # end

  def click
    begin
      base_click
    rescue Selenium::WebDriver::Error::ElementNotVisibleError
      location_once_scrolled_into_view
      base_click
    end
  end

  def chat_popup_close
    popup = $driver.find_elements(:xpath, "//div[@class = 'lhnInviteContainer']")
    if popup.count > 0
      $driver.find_element(:xpath, "//a[@class = 'LHNInviteCloseButton']").click
    end
  end

  def expectation_error
    RSpec::Expectations::ExpectationNotMetError
  end

  def assets_element_was_not_found
    Selenium::WebDriver::Error::NoSuchElementError || Selenium::WebDriver::Error::InvalidSelectorError
  end

  def assert_raise_message
    "Can't find element : "
  end


end



