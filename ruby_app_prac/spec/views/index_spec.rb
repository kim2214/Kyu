# frozen_string_literal: true

require 'rails_helper'

describe 'Task controll', type: :system do
  let!(:task) { FactoryBot.create(:task) }

  describe 'visit index page' do
    before do
      visit tasks_path
    end

    it 'maked task(Factory) is successfully output' do
      expect(page).to have_content 'test'
    end
  end

  describe 'print task contents' do
    before do
      visit task_path(task)
    end

    it 'maked task(Factory)s contents successfully output' do
      expect(page).to have_content 'test contents'
    end
  end

  describe 'create new task' do
    before do
      visit new_task_path
      fill_in 'task_title', with: 'this is new task'
      click_button 'Create Task'
    end

    it 'maked task(Factory) is successfully output' do
      expect(page).to have_content 'this is new task'
      expect(Task.count).to eq 1
    end
  end

  describe 'update task' do
    before do
      visit edit_task_path(task)
      fill_in 'task_title', with: 'update task'
      click_button 'Update Task'
    end

    it 'updated task(Factory) is successfully output' do
      expect(page).to have_content 'update task'
    end
  end

  describe 'delete task' do
    before do
      visit tasks_path
      click_link '削除'
      page.driver.browser.switch_to.alert.accept
    end

    it 'タスクが削除される' do
      expect(page).to have_no_content task[:title]
      expect(Task.count).to eq 0
    end
  end
end