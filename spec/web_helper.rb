def sign_up_user
  visit '/restaurants'
click_link('Sign up')
fill_in('Email', with: 'test@example.com')
fill_in('Password', with: 'testtest')
fill_in('Password confirmation', with: 'testtest')
click_button('Sign up')
end

def sign_up_another_user
  visit '/restaurants'
click_link('Sign up')
fill_in('Email', with: 'text2@example.com')
fill_in('Password', with: 'test223')
fill_in('Password confirmation', with: 'test223')
click_button('Sign up')
end
