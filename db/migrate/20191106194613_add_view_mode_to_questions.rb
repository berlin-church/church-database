class AddViewModeToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :view_mode, :integer
  end
end
