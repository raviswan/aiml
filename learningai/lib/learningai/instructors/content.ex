defmodule Learningai.Instructors.Content do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset
  alias Learningai.Instructors.Content


  schema "contents" do
    field :answer, :string
    field :data_file, :string
    field :data_file_name, :string, default: nil
    field :explanation, :string
    field :hint, :string
    field :is_multiple_choice, :boolean, default: false
    field :leadership_points, :integer
    field :objective, :string
    field :question, :string
    field :question_nature, :string
    field :solution_code, :string
    field :c_id, :id
    field :title, :string
    field :choice1, :string, default: nil
    field :choice2, :string, default: nil
    field :choice3, :string, default: nil
    field :choice4, :string, default: nil
    field :is_choice1_correct, :boolean, default: false
    field :is_choice2_correct, :boolean, default: false
    field :is_choice3_correct, :boolean, default: false
    field :is_choice4_correct, :boolean, default: false
    field :answer_box, :string, default: nil
    field :use_existing_file, :boolean, default: true
    field :explanation_image_file, Learningai.ImageUploader.Type
    timestamps()
  end

  @doc false
  def changeset(%Content{} = content, attrs) do
    content
    |> cast(attrs, [:objective, :question, :question_nature, :leadership_points, :is_multiple_choice, :hint,
     :answer, :explanation, :solution_code, :data_file, :c_id, :title, :choice1, :choice2, :choice3, :choice4,
     :is_choice1_correct, :is_choice2_correct, :is_choice3_correct, :is_choice4_correct, :answer_box, :use_existing_file, :data_file_name,
     :explanation_image_file])
    |> cast_attachments(attrs, [:explanation_image_file])
    |> foreign_key_constraint(:c_id)
    |> validate_required([:objective, :question, :question_nature, :leadership_points, :c_id, :title])
  end
end
