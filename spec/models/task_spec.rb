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
          task_1 = build(:task, title: task.title)
          expect(task.title).to eq(task_1.title)
        end
        it "エラーメッセージが表示されること" do
          task_1 = create(:task, title: task.title)
          task.valid?
          expect(task.errors[:title]).to include("has already been taken")
        end
      end
    end
  end
end
