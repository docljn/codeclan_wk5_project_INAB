require('date')

class RecordDate

  def self.today
    Date.today.strftime("%d/%m/%Y")
  end

end
