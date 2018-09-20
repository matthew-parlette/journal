require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @note = notes(:one)
    @unowned_note = notes(:three)
    sign_in users(:one)
  end

  test "should get index" do
    get notes_url
    assert_response :success
    assert_equal 2, assigns(:notes).count
  end

  test "should get new" do
    get new_note_url
    assert_response :success
  end

  test "should create note" do
    assert_difference('Note.count') do
      post notes_url, params: { note: { category_id: @note.category_id, date: @note.date, name: @note.name } }
    end

    assert_redirected_to note_url(Note.last)
  end

  test "should show note" do
    get note_url(@note)
    assert_response :success
  end

  test "should get edit" do
    get edit_note_url(@note)
    assert_response :success
  end

  test "should update note" do
    patch note_url(@note), params: { note: { category_id: @note.category_id, date: @note.date, name: @note.name } }
    assert_redirected_to note_url(@note)
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete note_url(@note)
    end

    assert_redirected_to notes_url
  end

  test "should not show unowned note" do
    get note_url(@unowned_note)
    assert_response 403
  end

  test "should not delete unowned note" do
    assert_no_difference('Note.count') do
      delete note_url(@unowned_note)
    end
  end

  test "should not update unowned note" do
    patch note_url(@unowned_note), params: { note: { category_id: @unowned_note.category_id, date: @unowned_note.date, name: @unowned_note.name } }
    assert_response 403
  end

  test "user cannot create note for unowned category" do
    assert_no_difference('Note.count') do
      post notes_url, params: { note: { category_id: @unowned_note.category_id, date: @unowned_note.date, name: @unowned_note.name } }
    end
  end
end
