class EventsController < ApplicationController
  include SessionsHelper
  before_action :set_event, only: %i[show edit update destroy attend unattend]
  before_action :require_login, except: %i[all show]

  def all
    @upcoming_events = Event.upcoming.includes('creator', 'attendees')
    @past_events = Event.past.includes('creator', 'attendees')
    render 'events/index'
  end

  def attend
    @event.attendees << logged_user unless @event.attendees.exists?(logged_user.id)

    redirect_to events_all_path
  end

  def unattend
    @event.attendees.delete(logged_user)

    redirect_to events_all_path
  end

  # GET /events
  # GET /events.json
  def index
    @upcoming_events = logged_user.events.upcoming.includes('attendees')
    @past_events = logged_user.events.past.includes('attendees')
  end

  # GET /events/1
  # GET /events/1.json
  def show; end

  # GET /events/new
  def new
    @event = logged_user.events.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
  def create
    @event = logged_user.events.build(event_params)

    if @event.save
      redirect_to events_path
    else
      redirect_to event_path(@event)
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:description, :title, :date)
  end
end
