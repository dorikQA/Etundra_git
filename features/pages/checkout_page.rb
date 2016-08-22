class CheckoutPage < ScreenActions

  def checkout_headers
  titles = $driver.find_elements(:xpath,"//span[@class= 'panel-title checkout-panel-header']")
  titles.map! {|x| x.text}
   titles.each do |x|
     puts x
   end
  end

  def placeorder_buttons
  $driver.find_elements(:xpath,"//button[contains(text(), 'PLACE YOUR ORDER')]")
  end

  def whathappens_text_req
    "Please ensure all information is correct before submitting. By clicking \"Place Your Order\" your order will be submitted and you will receive a confirmation message on the following page."
  end
  def whathappens_text_act
    $driver.find_element(:xpath, "//span[@class = 'checkout-summary-body']").text

  end


end