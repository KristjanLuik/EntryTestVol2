require 'test_helper'

class AttemptQuestionsControllerTest < ActionController::TestCase
  setup do
    @attempt_question = attempt_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attempt_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attempt_question" do
    assert_difference('AttemptQuestion.count') do
      post :create, attempt_question: { attempt_id: @attempt_question.attempt_id, question_id: @attempt_question.question_id }
    end

    assert_redirected_to attempt_question_path(assigns(:attempt_question))
  end

  test "should show attempt_question" do
    get :show, id: @attempt_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attempt_question
    assert_response :success
  end

  test "should update attempt_question" do
    patch :update, id: @attempt_question, attempt_question: { attempt_id: @attempt_question.attempt_id, question_id: @attempt_question.question_id }
    assert_redirected_to attempt_question_path(assigns(:attempt_question))
  end

  test "should destroy attempt_question" do
    assert_difference('AttemptQuestion.count', -1) do
      delete :destroy, id: @attempt_question
    end

    assert_redirected_to attempt_questions_path
  end
end
