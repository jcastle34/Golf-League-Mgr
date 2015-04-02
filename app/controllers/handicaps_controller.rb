class HandicapsController < ApplicationController
  # GET /handicaps
  # GET /handicaps.json
  def index
    @handicaps = Handicap.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @handicaps }
    end
  end

  # GET /handicaps/1
  # GET /handicaps/1.json
  def show
    @handicap = Handicap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @handicap }
    end
  end

  # GET /handicaps/new
  # GET /handicaps/new.json
  def new
    @handicap = Handicap.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @handicap }
    end
  end

  # GET /handicaps/1/edit
  def edit
    @handicap = Handicap.find(params[:id])
  end

  # POST /handicaps
  # POST /handicaps.json
  def create
    @handicap = Handicap.new(params[:handicap])

    respond_to do |format|
      if @handicap.save
        format.html { redirect_to @handicap, notice: 'Handicap was successfully created.' }
        format.json { render json: @handicap, status: :created, location: @handicap }
      else
        format.html { render action: "new" }
        format.json { render json: @handicap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /handicaps/1
  # PUT /handicaps/1.json
  def update
    @handicap = Handicap.find(params[:id])

    respond_to do |format|
      if @handicap.update_attributes(params[:handicap])
        format.html { redirect_to @handicap, notice: 'Handicap was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @handicap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /handicaps/1
  # DELETE /handicaps/1.json
  def destroy
    @handicap = Handicap.find(params[:id])
    @handicap.destroy

    respond_to do |format|
      format.html { redirect_to handicaps_url }
      format.json { head :no_content }
    end
  end
end
