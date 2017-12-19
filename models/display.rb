class Display

  def self.amount(amount)
    money_array = amount.to_s.split(".")
    pounds = money_array[0]
    pence = money_array[1]
    if pence == nil
      pence = "00"
    end
    if pence.length < 2
      pence = pence + "0"
    end
    return "#{pounds}.#{pence}"
  end

# Date::strptime(your_date_string,"%d-%m-%Y") to correctly parse a date string of format dd-mm-yyyy.

end
