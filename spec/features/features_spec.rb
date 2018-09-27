require 'pg'
feature 'testing homepage' do
  scenario 'displays title' do
    visit('/')
    expect(page).to have_content('WELCOME TO HARRY POTTER QUIZ')
  end

  scenario 'user can enter name' do
    visit('/')
    expect(page).to have_field('name')
  end
end

feature 'testing question page' do
  scenario 'displays question' do
    visit('/')
    fill_in 'name', with: 'Hermione'
    connection = PG.connect :dbname => 'hp_test'

    connection.exec("INSERT INTO questions_test VALUES('Which Harry Potter word is now in the Oxford English Dictionary?');")
    connection.exec("INSERT INTO questions_test VALUES('What is  the Animagus form of Rita Skeeter?');")
    connection.exec("INSERT INTO questions_test VALUES('How many names does Dumbledore have in his full name?');")

    allow_any_instance_of(Array).to receive(:sample) {'How many names does Dumbledore have in his full name?'}
    click_button 'Start Quiz!'
    expect(page).to have_content('How many names does Dumbledore have in his full name?')
  end

  # scenario 'displays correct if user selects correct answer' do
  #   visit('/')
  #   fill_in 'name', with: 'Hermione'
  #   connection = PG.connect :dbname => 'hp_test'
  #
  #   connection.exec("INSERT INTO questions_test VALUES('Which Harry Potter word is now in the Oxford English Dictionary?');")
  #   connection.exec("INSERT INTO questions_test VALUES('What is  the Animagus form of Rita Skeeter?');")
  #   connection.exec("INSERT INTO questions_test VALUES('How many names does Dumbledore have in his full name?');")
  #
  #   allow_any_instance_of(Array).to receive(:sample) {'How many names does Dumbledore have in his full name?'}
  #   click_button 'Start Quiz!'
  #   choose('correct')
  #   click_button 'Submit'
  #   expect(page).to have_content 'CORRECT!!'
  # end

  # scenario 'displays wrong if user selects wrong answer' do
  #   visit('/')
  #   fill_in 'name', with: 'Hermione'
  #   connection = PG.connect :dbname => 'hp_test'
  #
  #   connection.exec("INSERT INTO questions_test VALUES('Which Harry Potter word is now in the Oxford English Dictionary?');")
  #   connection.exec("INSERT INTO questions_test VALUES('What is  the Animagus form of Rita Skeeter?');")
  #   connection.exec("INSERT INTO questions_test VALUES('How many names does Dumbledore have in his full name?');")
  #
  #   allow_any_instance_of(Array).to receive(:sample) {'How many names does Dumbledore have in his full name?'}
  #   click_button 'Start Quiz!'
  #   choose('wrong1')
  #   click_button 'Submit'
  #   expect(page).to have_content 'WRONG!!'
  # end
end
