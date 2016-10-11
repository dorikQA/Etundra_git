class HomePage < ScreenActions

  def trending_items_list
    list = $driver.find_elements(:xpath, "//div[@class = 'list-overlay addtocart']")
   end

  def trendingitem_addtocart
    buttons = $wait.until { buttons = $driver.find_elements(:xpath, "//div[@class = 'slick-list draggable']//button") }
  end

  def trending_items_header
    $driver.find_element(:xpath, "//h2[contains(text(),'Trending Items')]")
  end
###########
end