require 'pg'
def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'hp_test')

  connection.exec('TRUNCATE questions_test;')
end
