defmodule Learningai.Repo.Migrations.AddAnswerChoicesToContents do
  use Ecto.Migration

  def change do
    alter table(:contents) do
        add :choice1, :text
        add :choice2, :text
        add :choice3, :text
        add :choice4, :text
    end
  end
end
