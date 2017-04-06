require 'rails_helper'

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaunt' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end
  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'KFC')
    end
    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('KFC')
      expect(page).not_to have_content('No restaurants yet')
    end
  end
  context ' creating a restaurant' do
    scenario 'prompts the user to fill in the form and then displays the restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      expect(page).to have_content('KFC')
      expect(current_path).to eq '/restaurants'
    end

    context 'an invalid restaurant' do
      scenario 'does not let you submit a name that is too short' do
        visit '/restaurants'
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'kf'
        click_button 'Create Restaurant'
        expect(page).not_to have_css 'h2', text: 'kf'
        expect(page).to have_content 'error'
      end
    end

  end
  context 'view restaurants' do
    let!(:kfc){Restaurant.create(name: 'KFC')}
    scenario 'lets the user go to the specifc restaurants page' do
      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content('KFC')
      expect(current_path). to eq "/restaurants/#{kfc.id}"

    end
  end
  context 'editing restaurants' do
      let!(:kfc){Restaurant.create(name: 'KFC')}
    scenario 'allows the user to edit information about the restaurant' do
      visit '/restaurants'
      click_link 'Edit KFC'
      fill_in 'Name', with: 'Nando'
      fill_in 'Description', with: 'Tasty chicken'
      click_button 'Update'
      expect(page).to have_content('Nando')
      expect(current_path).to eq '/restaurants'
    end
  end

  context 'deleting restaurants' do
    let!(:kfc){Restaurant.create(name: 'Absurb Bird')}
    scenario 'allows the user to delete a restaurant' do
      visit '/restaurants'
      click_link 'Delete Absurb Bird'
      expect(page).not_to have_content("Absurb Bird")
      expect(page).to have_content('Restaurant deleted successfully!')
      expect(current_path).to eq '/restaurants'
    end
  end

end
