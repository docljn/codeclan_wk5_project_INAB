# sql_runner.rb
require('pg')

class SqlRunner
  # no initialize method needed as there is only a single class method

  def self.run(sql, values=[])
    # need the default argument to avoid having to provide values where none are needed
    begin
      db = PG.connect({dbname: 'inab', host: 'localhost'})
      db.prepare('query', sql)
      result = db.exec_prepared('query', values)
    ensure
      db.close() if db != nil
    end
    return result
    end

  end



  # sql_runner.rb
