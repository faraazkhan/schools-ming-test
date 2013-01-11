class HomeRoomsController < ApplicationController
  # GET /home_rooms
  # GET /home_rooms.json
  def index
    @home_rooms = HomeRoom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @home_rooms }
    end
  end

  # GET /home_rooms/1
  # GET /home_rooms/1.json
  def show
    @home_room = HomeRoom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @home_room }
    end
  end

  # GET /home_rooms/new
  # GET /home_rooms/new.json
  def new
    @home_room = HomeRoom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @home_room }
    end
  end

  # GET /home_rooms/1/edit
  def edit
    @home_room = HomeRoom.find(params[:id])
  end

  # POST /home_rooms
  # POST /home_rooms.json
  def create
    @teacher_id = Teacher.find_by_name(params[:home_room][:teacher_id]).id
    @home_room = HomeRoom.new(:teacher_id => @teacher_id, :homeroom_number => params[:home_room][:homeroom_number])

    respond_to do |format|
      if @home_room.save
        format.html { redirect_to @home_room, notice: 'Home room was successfully created.' }
        format.json { render json: @home_room, status: :created, location: @home_room }
      else
        format.html { render action: "new" }
        format.json { render json: @home_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /home_rooms/1
  # PUT /home_rooms/1.json
  def update
    @teacher_id = Teacher.find(params[:home_room][:teacher_id]).id
    @home_room = HomeRoom.find(params[:id])

    respond_to do |format|
      if @home_room.update_attributes(params[:home_room])
        format.html { redirect_to @home_room, notice: 'Home room was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @home_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_rooms/1
  # DELETE /home_rooms/1.json
  def destroy
    @home_room = HomeRoom.find(params[:id])
    @home_room.destroy

    respond_to do |format|
      format.html { redirect_to home_rooms_url }
      format.json { head :no_content }
    end
  end
end
