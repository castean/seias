class NumberOfRoomsController < ApplicationController
  load_and_authorize_resource
  # GET /number_of_rooms
  # GET /number_of_rooms.json
  def index
    @number_of_rooms = NumberOfRoom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @number_of_rooms }
    end
  end

  # GET /number_of_rooms/1
  # GET /number_of_rooms/1.json
  def show
    @number_of_room = NumberOfRoom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @number_of_room }
    end
  end

  # GET /number_of_rooms/new
  # GET /number_of_rooms/new.json
  def new
    @number_of_room = NumberOfRoom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @number_of_room }
    end
  end

  # GET /number_of_rooms/1/edit
  def edit
    @number_of_room = NumberOfRoom.find(params[:id])
  end

  # POST /number_of_rooms
  # POST /number_of_rooms.json
  def create
    @number_of_room = NumberOfRoom.new(params[:number_of_room])

    respond_to do |format|
      if @number_of_room.save
        format.html { redirect_to @number_of_room, notice: 'Number of room was successfully created.' }
        format.json { render json: @number_of_room, status: :created, location: @number_of_room }
      else
        format.html { render action: "new" }
        format.json { render json: @number_of_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /number_of_rooms/1
  # PUT /number_of_rooms/1.json
  def update
    @number_of_room = NumberOfRoom.find(params[:id])

    respond_to do |format|
      if @number_of_room.update_attributes(params[:number_of_room])
        format.html { redirect_to @number_of_room, notice: 'Number of room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @number_of_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /number_of_rooms/1
  # DELETE /number_of_rooms/1.json
  def destroy
    @number_of_room = NumberOfRoom.find(params[:id])
    @number_of_room.destroy

    respond_to do |format|
      format.html { redirect_to number_of_rooms_url }
      format.json { head :no_content }
    end
  end
end
