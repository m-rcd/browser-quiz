require './lib/questions'

describe Questions do
  describe 'random_question' do
    let(:questions) {described_class.new}
     it 'returns a random question' do
       srand(123)
      expect(questions.random_question).to eq({'How many names does Dumbledore have in his full name?' => {correct: '5', wrong: ['3','2','4']}})
    end
  end
end
