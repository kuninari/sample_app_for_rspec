require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  describe 'ログイン前' do
    describe 'ページ遷移' do
      context 'タスクの新規登録ページへの遷移' do
        it '新規登録ページに遷移できない'
      end
      context 'タスクの編集ページへの遷移' do
        it '編集ページへの遷移ができない'
      end
      context 'タスクの詳細ページに遷移' do
        it '詳細ページに遷移できる'
      end
    end
      context 'タスクの一覧ページに遷移' do
        it '一覧ページに遷移できる'
      end
    end

  describe 'ログイン後' do
    describe 'タスクの新規作成' do
      context 'フォームの入力値が正常' do
        it 'タスクの新規作成が成功する'
      end
      context 'タイトルが未入力' do
        it 'タスクの新規作成が失敗する'
      end
      context '登録済のメールアドレスを使用' do
        it 'ユーザーの編集が失敗する'
      end
      context '登録済みのタイトルを入力' do
        it 'タスクの新規作成が失敗する'
      end
    end

    describe 'タスクの編集' do
      context 'フォームの入力値が正常' do
        it 'タスクの編集が成功する'
      end
      context 'タイトルが未入力' do
        it 'タスクの編集が失敗する'
      end
      context '登録済みのタイトルを入力' do
        it 'タスクの編集が失敗する'
      end
    end

    describe 'タスクの削除' do
      it 'タスクの削除が成功する'
    end
  end
end