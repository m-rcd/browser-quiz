class Questions
    QUESTIONS = [
      {'Which Harry Potter word is now in the Oxford English Dictionary?' => {correct: 'Muggle', wrong: ['Hogwarts', 'Voldemort', 'Mudblood']}},
      {"What is Rita Skeeter's Animagus form?" =>  {correct: 'Beetle', wrong: ['Frog', 'Mouse', 'Dog']}},
      {'How many names does Dumbledore have in his full name?' => {correct: '5', wrong: ['3','2','4']}}
    ]

  def random_question
    QUESTIONS.sample
  end
end
