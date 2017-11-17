defmodule LearningaiWeb.ContentControllerTest do
  use LearningaiWeb.ConnCase

  alias Learningai.Instructors

  @create_attrs %{answer: "some answer", answer_box: "some answer_box", data_file: "some data_file", explanation: "some explanation", hint: "some hint", is_multiple_choice: true, leadership_points: 42, num_choices: 42, objective: "some objective", question: "some question", question_nature: "some question_nature", solution_code: "some solution_code"}
  @update_attrs %{answer: "some updated answer", answer_box: "some updated answer_box", data_file: "some updated data_file", explanation: "some updated explanation", hint: "some updated hint", is_multiple_choice: false, leadership_points: 43, num_choices: 43, objective: "some updated objective", question: "some updated question", question_nature: "some updated question_nature", solution_code: "some updated solution_code"}
  @invalid_attrs %{answer: nil, answer_box: nil, data_file: nil, explanation: nil, hint: nil, is_multiple_choice: nil, leadership_points: nil, num_choices: nil, objective: nil, question: nil, question_nature: nil, solution_code: nil}

  def fixture(:content) do
    {:ok, content} = Instructors.create_content(@create_attrs)
    content
  end

  describe "index" do
    test "lists all contents", %{conn: conn} do
      conn = get conn, content_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Contents"
    end
  end

  describe "new content" do
    test "renders form", %{conn: conn} do
      conn = get conn, content_path(conn, :new)
      assert html_response(conn, 200) =~ "New Content"
    end
  end

  describe "create content" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, content_path(conn, :create), content: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == content_path(conn, :show, id)

      conn = get conn, content_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Content"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, content_path(conn, :create), content: @invalid_attrs
      assert html_response(conn, 200) =~ "New Content"
    end
  end

  describe "edit content" do
    setup [:create_content]

    test "renders form for editing chosen content", %{conn: conn, content: content} do
      conn = get conn, content_path(conn, :edit, content)
      assert html_response(conn, 200) =~ "Edit Content"
    end
  end

  describe "update content" do
    setup [:create_content]

    test "redirects when data is valid", %{conn: conn, content: content} do
      conn = put conn, content_path(conn, :update, content), content: @update_attrs
      assert redirected_to(conn) == content_path(conn, :show, content)

      conn = get conn, content_path(conn, :show, content)
      assert html_response(conn, 200) =~ "some updated answer"
    end

    test "renders errors when data is invalid", %{conn: conn, content: content} do
      conn = put conn, content_path(conn, :update, content), content: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Content"
    end
  end

  describe "delete content" do
    setup [:create_content]

    test "deletes chosen content", %{conn: conn, content: content} do
      conn = delete conn, content_path(conn, :delete, content)
      assert redirected_to(conn) == content_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, content_path(conn, :show, content)
      end
    end
  end

  defp create_content(_) do
    content = fixture(:content)
    {:ok, content: content}
  end
end
