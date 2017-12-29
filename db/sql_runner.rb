# sql_runner.rb
require('pg')

# class SqlRunner
#   # no initialize method needed as there is only a single class method
#   # commented out local config in order to set up for Heroku deployment
#
#   def self.run(sql, values=[])
#     # need the default argument to avoid having to provide values where none are needed
#     begin
#       db = PG.connect({dbname: 'inab', host: 'localhost'})
#       db.prepare('query', sql)
#       result = db.exec_prepared('query', values)
#     ensure
#       db.close() if db != nil
#     end
#     return result
#     end
#
#   end


  class SqlRunner

    def self.run(sql, values=[])
      begin
        db = PG.connect({dbname: 'd9da040vu3o9u8', host: 'ec2-50-17-234-234.compute-1.amazonaws.com', port: 5432, user: 'ovybmxhzaootiw', password: 'dc52154a19030683506f544123b9cb510c9731ed10b490c24f8e6b525c8c5cc2' })
        db.prepare('query', sql)
        result = db.exec_prepared('query', values)
      ensure
        db.close() if db != nil
      end
      return result
      end

    end


  # sql_runner.rb
