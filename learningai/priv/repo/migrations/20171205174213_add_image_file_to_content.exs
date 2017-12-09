defmodule Learningai.Repo.Migrations.AddImageFileToContent do
  use Ecto.Migration

  def change do
    alter table(:contents) do
        add :explanation_image_file, :text, default: nil
    end

  end
end
