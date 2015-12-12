# Feature: Home page
#   As a visitor
#   I want to visit a home page
#   So I can learn more about the website
feature 'Home page' do

  background do
    sign_up_with('test@example.com', 'please123', 'please123')
    expect(page).to have_content 'Logout'
  end
  scenario 'visit the home page' do
    visit root_path
    expect(page).to have_content 'Be your own hero'
  end

end
