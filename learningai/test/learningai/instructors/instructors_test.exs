defmodule Learningai.InstructorsTest do
  use Learningai.DataCase

  alias Learningai.Instructors

  describe "courses" do
    alias Learningai.Instructors.Course

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def course_fixture(attrs \\ %{}) do
      {:ok, course} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Instructors.create_course()

      course
    end

    test "list_courses/0 returns all courses" do
      course = course_fixture()
      assert Instructors.list_courses() == [course]
    end

    test "get_course!/1 returns the course with given id" do
      course = course_fixture()
      assert Instructors.get_course!(course.id) == course
    end

    test "create_course/1 with valid data creates a course" do
      assert {:ok, %Course{} = course} = Instructors.create_course(@valid_attrs)
      assert course.name == "some name"
    end

    test "create_course/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Instructors.create_course(@invalid_attrs)
    end

    test "update_course/2 with valid data updates the course" do
      course = course_fixture()
      assert {:ok, course} = Instructors.update_course(course, @update_attrs)
      assert %Course{} = course
      assert course.name == "some updated name"
    end

    test "update_course/2 with invalid data returns error changeset" do
      course = course_fixture()
      assert {:error, %Ecto.Changeset{}} = Instructors.update_course(course, @invalid_attrs)
      assert course == Instructors.get_course!(course.id)
    end

    test "delete_course/1 deletes the course" do
      course = course_fixture()
      assert {:ok, %Course{}} = Instructors.delete_course(course)
      assert_raise Ecto.NoResultsError, fn -> Instructors.get_course!(course.id) end
    end

    test "change_course/1 returns a course changeset" do
      course = course_fixture()
      assert %Ecto.Changeset{} = Instructors.change_course(course)
    end
  end

  describe "coursecontents" do
    alias Learningai.Instructors.CourseContent

    @valid_attrs %{answer: "some answer", answer_box: "some answer_box", data_file: "some data_file", explanation: "some explanation", hint: "some hint", is_multiple_choice: true, leadership_points: 42, num_choices: 42, objective: "some objective", question: "some question", question_nature: "some question_nature", solution_code: "some solution_code"}
    @update_attrs %{answer: "some updated answer", answer_box: "some updated answer_box", data_file: "some updated data_file", explanation: "some updated explanation", hint: "some updated hint", is_multiple_choice: false, leadership_points: 43, num_choices: 43, objective: "some updated objective", question: "some updated question", question_nature: "some updated question_nature", solution_code: "some updated solution_code"}
    @invalid_attrs %{answer: nil, answer_box: nil, data_file: nil, explanation: nil, hint: nil, is_multiple_choice: nil, leadership_points: nil, num_choices: nil, objective: nil, question: nil, question_nature: nil, solution_code: nil}

    def course_content_fixture(attrs \\ %{}) do
      {:ok, course_content} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Instructors.create_course_content()

      course_content
    end

    test "list_coursecontents/0 returns all coursecontents" do
      course_content = course_content_fixture()
      assert Instructors.list_coursecontents() == [course_content]
    end

    test "get_course_content!/1 returns the course_content with given id" do
      course_content = course_content_fixture()
      assert Instructors.get_course_content!(course_content.id) == course_content
    end

    test "create_course_content/1 with valid data creates a course_content" do
      assert {:ok, %CourseContent{} = course_content} = Instructors.create_course_content(@valid_attrs)
      assert course_content.answer == "some answer"
      assert course_content.answer_box == "some answer_box"
      assert course_content.data_file == "some data_file"
      assert course_content.explanation == "some explanation"
      assert course_content.hint == "some hint"
      assert course_content.is_multiple_choice == true
      assert course_content.leadership_points == 42
      assert course_content.num_choices == 42
      assert course_content.objective == "some objective"
      assert course_content.question == "some question"
      assert course_content.question_nature == "some question_nature"
      assert course_content.solution_code == "some solution_code"
    end

    test "create_course_content/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Instructors.create_course_content(@invalid_attrs)
    end

    test "update_course_content/2 with valid data updates the course_content" do
      course_content = course_content_fixture()
      assert {:ok, course_content} = Instructors.update_course_content(course_content, @update_attrs)
      assert %CourseContent{} = course_content
      assert course_content.answer == "some updated answer"
      assert course_content.answer_box == "some updated answer_box"
      assert course_content.data_file == "some updated data_file"
      assert course_content.explanation == "some updated explanation"
      assert course_content.hint == "some updated hint"
      assert course_content.is_multiple_choice == false
      assert course_content.leadership_points == 43
      assert course_content.num_choices == 43
      assert course_content.objective == "some updated objective"
      assert course_content.question == "some updated question"
      assert course_content.question_nature == "some updated question_nature"
      assert course_content.solution_code == "some updated solution_code"
    end

    test "update_course_content/2 with invalid data returns error changeset" do
      course_content = course_content_fixture()
      assert {:error, %Ecto.Changeset{}} = Instructors.update_course_content(course_content, @invalid_attrs)
      assert course_content == Instructors.get_course_content!(course_content.id)
    end

    test "delete_course_content/1 deletes the course_content" do
      course_content = course_content_fixture()
      assert {:ok, %CourseContent{}} = Instructors.delete_course_content(course_content)
      assert_raise Ecto.NoResultsError, fn -> Instructors.get_course_content!(course_content.id) end
    end

    test "change_course_content/1 returns a course_content changeset" do
      course_content = course_content_fixture()
      assert %Ecto.Changeset{} = Instructors.change_course_content(course_content)
    end
  end

  describe "contents" do
    alias Learningai.Instructors.Content

    @valid_attrs %{answer: "some answer", answer_box: "some answer_box", data_file: "some data_file", explanation: "some explanation", hint: "some hint", is_multiple_choice: true, leadership_points: 42, num_choices: 42, objective: "some objective", question: "some question", question_nature: "some question_nature", solution_code: "some solution_code"}
    @update_attrs %{answer: "some updated answer", answer_box: "some updated answer_box", data_file: "some updated data_file", explanation: "some updated explanation", hint: "some updated hint", is_multiple_choice: false, leadership_points: 43, num_choices: 43, objective: "some updated objective", question: "some updated question", question_nature: "some updated question_nature", solution_code: "some updated solution_code"}
    @invalid_attrs %{answer: nil, answer_box: nil, data_file: nil, explanation: nil, hint: nil, is_multiple_choice: nil, leadership_points: nil, num_choices: nil, objective: nil, question: nil, question_nature: nil, solution_code: nil}

    def content_fixture(attrs \\ %{}) do
      {:ok, content} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Instructors.create_content()

      content
    end

    test "list_contents/0 returns all contents" do
      content = content_fixture()
      assert Instructors.list_contents() == [content]
    end

    test "get_content!/1 returns the content with given id" do
      content = content_fixture()
      assert Instructors.get_content!(content.id) == content
    end

    test "create_content/1 with valid data creates a content" do
      assert {:ok, %Content{} = content} = Instructors.create_content(@valid_attrs)
      assert content.answer == "some answer"
      assert content.answer_box == "some answer_box"
      assert content.data_file == "some data_file"
      assert content.explanation == "some explanation"
      assert content.hint == "some hint"
      assert content.is_multiple_choice == true
      assert content.leadership_points == 42
      assert content.num_choices == 42
      assert content.objective == "some objective"
      assert content.question == "some question"
      assert content.question_nature == "some question_nature"
      assert content.solution_code == "some solution_code"
    end

    test "create_content/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Instructors.create_content(@invalid_attrs)
    end

    test "update_content/2 with valid data updates the content" do
      content = content_fixture()
      assert {:ok, content} = Instructors.update_content(content, @update_attrs)
      assert %Content{} = content
      assert content.answer == "some updated answer"
      assert content.answer_box == "some updated answer_box"
      assert content.data_file == "some updated data_file"
      assert content.explanation == "some updated explanation"
      assert content.hint == "some updated hint"
      assert content.is_multiple_choice == false
      assert content.leadership_points == 43
      assert content.num_choices == 43
      assert content.objective == "some updated objective"
      assert content.question == "some updated question"
      assert content.question_nature == "some updated question_nature"
      assert content.solution_code == "some updated solution_code"
    end

    test "update_content/2 with invalid data returns error changeset" do
      content = content_fixture()
      assert {:error, %Ecto.Changeset{}} = Instructors.update_content(content, @invalid_attrs)
      assert content == Instructors.get_content!(content.id)
    end

    test "delete_content/1 deletes the content" do
      content = content_fixture()
      assert {:ok, %Content{}} = Instructors.delete_content(content)
      assert_raise Ecto.NoResultsError, fn -> Instructors.get_content!(content.id) end
    end

    test "change_content/1 returns a content changeset" do
      content = content_fixture()
      assert %Ecto.Changeset{} = Instructors.change_content(content)
    end
  end

  describe "cont" do
    alias Learningai.Instructors.Conts

    @valid_attrs %{objective: "some objective"}
    @update_attrs %{objective: "some updated objective"}
    @invalid_attrs %{objective: nil}

    def conts_fixture(attrs \\ %{}) do
      {:ok, conts} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Instructors.create_conts()

      conts
    end

    test "list_cont/0 returns all cont" do
      conts = conts_fixture()
      assert Instructors.list_cont() == [conts]
    end

    test "get_conts!/1 returns the conts with given id" do
      conts = conts_fixture()
      assert Instructors.get_conts!(conts.id) == conts
    end

    test "create_conts/1 with valid data creates a conts" do
      assert {:ok, %Conts{} = conts} = Instructors.create_conts(@valid_attrs)
      assert conts.objective == "some objective"
    end

    test "create_conts/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Instructors.create_conts(@invalid_attrs)
    end

    test "update_conts/2 with valid data updates the conts" do
      conts = conts_fixture()
      assert {:ok, conts} = Instructors.update_conts(conts, @update_attrs)
      assert %Conts{} = conts
      assert conts.objective == "some updated objective"
    end

    test "update_conts/2 with invalid data returns error changeset" do
      conts = conts_fixture()
      assert {:error, %Ecto.Changeset{}} = Instructors.update_conts(conts, @invalid_attrs)
      assert conts == Instructors.get_conts!(conts.id)
    end

    test "delete_conts/1 deletes the conts" do
      conts = conts_fixture()
      assert {:ok, %Conts{}} = Instructors.delete_conts(conts)
      assert_raise Ecto.NoResultsError, fn -> Instructors.get_conts!(conts.id) end
    end

    test "change_conts/1 returns a conts changeset" do
      conts = conts_fixture()
      assert %Ecto.Changeset{} = Instructors.change_conts(conts)
    end
  end
end
