require './lib/questions'

describe Questions do
  describe 'random_question' do
    let(:questions) {described_class.new}
     # it 'returns a random question' do
     #   connection = PG.connect :dbname => 'hp_test'
     #
     #   connection.exec("INSERT INTO questions_test VALUES('Which Harry Potter word is now in the Oxford English Dictionary?');")
     #   connection.exec("INSERT INTO questions_test VALUES('What is  the Animagus form of Rita Skeeter?');")
     #   connection.exec("INSERT INTO questions_test VALUES('How many names does Dumbledore have in his full name?');")
     #   srand(123)
     #  expect(questions.random_question).to eq('How many names does Dumbledore have in his full name?')
    # end
  end
end
