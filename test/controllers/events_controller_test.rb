require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
    @unowned_event = events(:three)
    sign_in users(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
    assert_equal 2, assigns(:events).count
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: { event: { category_id: @event.category_id, date: @event.date, name: @event.name } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { category_id: @event.category_id, date: @event.date, name: @event.name } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end

  test "should not show unowned event" do
    get event_url(@unowned_event)
    assert_response 403
  end

  test "should not delete unowned event" do
    assert_no_difference('Event.count') do
      delete event_url(@unowned_event)
    end
  end

  test "should not update unowned event" do
    patch event_url(@unowned_event), params: { event: { category_id: @unowned_event.category_id, date: @unowned_event.date, name: @unowned_event.name } }
    assert_response 403
  end

  test "user cannot create event for unowned category" do
    assert_no_difference('Event.count') do
      post events_url, params: { event: { category_id: @unowned_event.category_id, date: @unowned_event.date, name: @unowned_event.name } }
    end
  end

  test "should get events index through category" do
    get category_events_url(categories(:one))
    assert_response :success
    assert_equal 1, assigns(:events).count
  end

  test "should show event through category" do
    get category_event_url(categories(:one), @event)
    assert_response :success
  end

  test "should not get events index through unowned category" do
    get category_events_url(categories(:three))
    assert_response 403
  end
end
