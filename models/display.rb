class Display

  # def self.amount(amount)
  #   money_array = amount.to_s.split(".")
  #   pounds = money_array[0]
  #   pence = money_array[1]
  #   if pence == nil
  #     pence = "00"
  #   end
  #   if pence.length < 2
  #     pence = pence + "0"
  #   end
  #   if pence.length > 2
  #     pence = pence.round
  #   end
  #   return "#{pounds}.#{pence}"
  # end

  def self.amount(amount)
    sprintf('%.2f', amount)
  end

  # Date::strptime(your_date_string,"%d-%m-%Y") to correctly parse a date string of format dd-mm-yyyy into a ruby date object

  def self.date_dmy(date_string)
    date_object = Date.strptime(date_string, "%Y-%m-%d")
    uk_date = "#{date_object.day}/#{date_object.month}/#{date_object.year}"
    return uk_date
  end
end
