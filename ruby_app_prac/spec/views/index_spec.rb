# frozen_string_literal: true

require 'rails_helper'

describe 'タスク管理機能', type: :system do
  let!(:task) { FactoryBot.create(:task) }

  describe '一覧表示' do
    before do
      visit tasks_path
    end

    it '作成したタスクが表示される' do
      expect(page).to have_content 'test'
    end
  end

  describe '詳細表示' do
    before do
      visit task_path(task)
    end

    it '作成したタスクの詳細が表示される' do
      expect(page).to have_content 'test contents'
    end
  end
end