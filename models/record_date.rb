require('date')

class RecordDate

  def self.today
    Date.today.strftime("%d/%m/%Y")
  end

  def self.dmy(date)
    date.strftime("%d/%m/%Y")
  end

end
