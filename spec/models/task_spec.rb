require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "バリデーションテスト" do
    let (:task) { build(:task) }

    describe "バリデーションが正しい場合" do
      context "タイトルとステータスがある場合" do
        it "有効であること" do
          expect(task).to be_valid
        end
      end
    end

    describe "バリデーションが正しくない場合" do
      context "タイトルが空の場合" do
        it "無効であること" do
          task.title = ""
          expect(task).to be_invalid
        end
        it "エラーメッセージが表示されること" do
          task.title = ""
          task.valid?
          expect(task.errors[:title]).to include("can't be blank")
        end
      end

      context "ステータスが空の場合" do
        it "無効であること" do
          task.status = ""
          expect(task).to be_invalid
        end
      end

      context "タイトルが重複している場合" do
        it "無効であること" do
          task_with_duplicated_title = build(:task, title: create(:task).title)
          expect(task_with_duplicated_title).to be_invalid
        end
        it "エラーメッセージが表示されること" do
          task_with_duplicated_title = create(:task, title: create(:task).title)
          task.valid?
          expect(task.errors[:title]).to include("has already been taken")
        end
      end
    end
  end
end
