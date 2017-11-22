defmodule Learningai.Repo.Migrations.AddAddCheckboxForChoices do
  use Ecto.Migration

  def change do
    alter table(:contents) do
        add :answer_box, :text, default: nil
        add :is_choice1_correct, :boolean, default: false, null: false
        add :is_choice2_correct, :boolean, default: false, null: false
        add :is_choice3_correct, :boolean, default: false, null: false
        add :is_choice4_correct, :boolean, default: false, null: false
    end
  end
end
