require 'test_helper'

class AttemptAnswersControllerTest < ActionController::TestCase
  setup do
    @attempt_answer = attempt_answers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attempt_answers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attempt_answer" do
    assert_difference('AttemptAnswer.count') do
      post :create, attempt_answer: { answer_id: @attempt_answer.answer_id, attempt_id: @attempt_answer.attempt_id, chosen: @attempt_answer.chosen }
    end

    assert_redirected_to attempt_answer_path(assigns(:attempt_answer))
  end

  test "should show attempt_answer" do
    get :show, id: @attempt_answer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attempt_answer
    assert_response :success
  end

  test "should update attempt_answer" do
    patch :update, id: @attempt_answer, attempt_answer: { answer_id: @attempt_answer.answer_id, attempt_id: @attempt_answer.attempt_id, chosen: @attempt_answer.chosen }
    assert_redirected_to attempt_answer_path(assigns(:attempt_answer))
  end

  test "should destroy attempt_answer" do
    assert_difference('AttemptAnswer.count', -1) do
      delete :destroy, id: @attempt_answer
    end

    assert_redirected_to attempt_answers_path
  end
end
