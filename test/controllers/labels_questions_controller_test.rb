require 'test_helper'

class LabelsQuestionsControllerTest < ActionController::TestCase
  setup do
    @labels_question = labels_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:labels_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create labels_question" do
    assert_difference('LabelsQuestion.count') do
      post :create, labels_question: { label_id: @labels_question.label_id, question_id: @labels_question.question_id }
    end

    assert_redirected_to labels_question_path(assigns(:labels_question))
  end

  test "should show labels_question" do
    get :show, id: @labels_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @labels_question
    assert_response :success
  end

  test "should update labels_question" do
    patch :update, id: @labels_question, labels_question: { label_id: @labels_question.label_id, question_id: @labels_question.question_id }
    assert_redirected_to labels_question_path(assigns(:labels_question))
  end

  test "should destroy labels_question" do
    assert_difference('LabelsQuestion.count', -1) do
      delete :destroy, id: @labels_question
    end

    assert_redirected_to labels_questions_path
  end
end
