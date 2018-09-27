require './lib/questions'

describe Questions do
  describe '.all' do
    let(:questions) {described_class.new}
    it 'returns a list of questions' do
      connection = PG.connect :dbname => 'hp_test'

        connection.exec("INSERT INTO questions_test VALUES('Which Harry Potter word is now in the Oxford English Dictionary?');")
        connection.exec("INSERT INTO questions_test VALUES('What is  the Animagus form of Rita Skeeter?');")
        connection.exec("INSERT INTO questions_test VALUES('How many names does Dumbledore have in his full name?');")
        questions = Questions.all
        expect(questions).to include('Which Harry Potter word is now in the Oxford English Dictionary?')
        expect(questions).to include('What is  the Animagus form of Rita Skeeter?')
        expect(questions).to include('How many names does Dumbledore have in his full name?')
    end
  end
end
