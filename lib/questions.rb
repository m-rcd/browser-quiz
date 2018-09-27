require 'pg'

class Questions
  def self.all
    connection = PG.connect(dbname: 'hp_test')
    result = connection.exec('SELECT * FROM questions_test')
    result.map do |question|
      question['questions']
    end
  end
end
