class PeopleByRoomsController < ApplicationController
  # GET /people_by_rooms
  # GET /people_by_rooms.json
  def index
    @people_by_rooms = PeopleByRoom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people_by_rooms }
    end
  end

  # GET /people_by_rooms/1
  # GET /people_by_rooms/1.json
  def show
    @people_by_room = PeopleByRoom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @people_by_room }
    end
  end

  # GET /people_by_rooms/new
  # GET /people_by_rooms/new.json
  def new
    @people_by_room = PeopleByRoom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @people_by_room }
    end
  end

  # GET /people_by_rooms/1/edit
  def edit
    @people_by_room = PeopleByRoom.find(params[:id])
  end

  # POST /people_by_rooms
  # POST /people_by_rooms.json
  def create
    @people_by_room = PeopleByRoom.new(params[:people_by_room])

    respond_to do |format|
      if @people_by_room.save
        format.html { redirect_to @people_by_room, notice: 'People by room was successfully created.' }
        format.json { render json: @people_by_room, status: :created, location: @people_by_room }
      else
        format.html { render action: "new" }
        format.json { render json: @people_by_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people_by_rooms/1
  # PUT /people_by_rooms/1.json
  def update
    @people_by_room = PeopleByRoom.find(params[:id])

    respond_to do |format|
      if @people_by_room.update_attributes(params[:people_by_room])
        format.html { redirect_to @people_by_room, notice: 'People by room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @people_by_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people_by_rooms/1
  # DELETE /people_by_rooms/1.json
  def destroy
    @people_by_room = PeopleByRoom.find(params[:id])
    @people_by_room.destroy

    respond_to do |format|
      format.html { redirect_to people_by_rooms_url }
      format.json { head :no_content }
    end
  end
end
