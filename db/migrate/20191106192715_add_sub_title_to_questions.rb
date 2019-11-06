class AddSubTitleToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :sub_title, :text
  end
end
