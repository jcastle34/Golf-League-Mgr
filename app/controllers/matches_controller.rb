class MatchesController < ApplicationController
  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.includes(:golfers)
    @total_strokes = 0

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matches }
    end
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @match = Match.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match }
    end
  end

  def show_scores_for_match
    @match_id = params[:match_id]
    @scores = Score.where('match_id = ?', @match_id)
    @total_strokes = 0
    @total_par = 0

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scores }
    end
  end

  # GET /matches/new
  # GET /matches/new.json
  def new
    @match = Match.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/1/edit
  def edit
    @match = Match.where('id = ?', params[:id]).includes(:golfers).first
  end

  def edit_scores_for_match
    @match_id = params[:match_id]
    @scores = Score.where('match_id = ?', @match_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scores }
    end
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(params[:match])
    first_opponent = params[:golfer][:first_opponent]
    second_opponent = params[:golfer][:second_opponent]
    @match.golfers << Golfer.find(first_opponent)
    @match.golfers << Golfer.find(second_opponent)

    respond_to do |format|
      if @match.save
        Match.create_score_card_for_match(@match)
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render json: @match, status: :created, location: @match }
      else
        format.html { render action: "new" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /matches/1
  # PUT /matches/1.json
  def update
    @match = Match.find(params[:id])

    respond_to do |format|
      if @match.update_attributes(params[:match])
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_scores_for_match
    @scores = Score.update(params[:scores].keys, params[:scores].values).reject { |s| s.errors.empty? }
    if @scores.empty?
      flash[:notice] = "Scores updated"
      redirect_to matches_url
    else
      render :action => "edit_scores_for_match"
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :no_content }
    end
  end
end
