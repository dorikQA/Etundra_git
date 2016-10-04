class CenPos < ScreenActions

  def cenposframe
    $driver.switch_to.frame("cenposPayIFrameId")

  end
  def cenposout
    $driver.switch_to.frame("cenposPayIFrameId")
  end

  def card_number(card_name)
    if card_name == 'VISA'
      card_number = "4011111111111"
     end
    @@card_number = card_number

end

def card_month
  @@card_month = "12"

end
  def card_year
    @@card_year = "18"
  end
def cardholder
  @@card_holder_name = "Tester Tester"

end

def card_cvv
  @cvv = '567'
end
  ##css cenpos fields
def card_number_field
 $wait.until {$driver.find_element(:xpath, "//div[@class = 'row rowcardNumber']//input") }

end
def card_month_field
  $wait.until {$driver.find_element(:css, "input[name = 'month']")}
end
def card_year_field
  $driver.find_element(:css,"input[name = 'year']")
end
def cardholder_name_field
  $driver.find_element(:css, "input[name = 'cardName']")
  end
def card_cvv_field
  $driver.find_element(:css, "input[name = 'cvv']")
end

end
# $driver.find_element(:id, "dialog-4109")
# $driver.execute_script("arguments[0].style.display='block'", $driver.find_element(:id, "dialog-4109"))

##xpaths cenposfields

# def card_number_field
#   $driver.find_element(:xpath, "//div[@class = 'row rowcardNumber']//input")
# end
#
# def card_month_field
#   $driver.find_element(:xpath, "//div[@class = 'row rowmonth']//input[@name = 'month']")
# end
# def card_year_field
#   $driver.find_element(:xpath, "//div[@class = 'row rowmonth']//input[@name = 'year']")
#   # end
# def cardholder_name_field
#   $driver.find_element(:xpath, "//div[@class = 'row rowcardName']//input[@name = 'cardName']")
#   # end
# def card_cvv_field
#   $driver.find_element(:xpath, "//div[@class = 'row rowcvv']//input[@name = 'cvv']")
# end