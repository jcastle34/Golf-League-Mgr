class MatchesController < ApplicationController
  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.includes(:golfers).where('round_id = ?', params[:round_id])
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

  def show_score_card
    @match = Match.find(params[:match_id])
    @scores = Score.where('match_id = ?', @match.id)
    @total_strokes = 0
    @total_par = 0
    @total_handicap_strokes = 0

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scores }
    end
  end

  # GET /matches/new
  # GET /matches/new.json
  def new
    @round = Round.find(params[:round_id])
    @match = Match.new(:round => @round)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/1/edit
  def edit
    @round = Round.find(1)
    @match = Match.find(params[:id])
  end

  def edit_score_card
    @round = Round.find(1)
    @match = Match.find(params[:match_id])
    @scores = Score.where('match_id = ?', @match.id)
    @total_strokes = 0
    @total_par = 0
    @total_handicap_strokes = 0

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scores }
    end
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(params[:match])
    @match.round_id = params[:round_id]
    first_opponent = params[:golfer][:first_opponent]
    second_opponent = params[:golfer][:second_opponent]
    @match.golfers << Golfer.find(first_opponent)
    @match.golfers << Golfer.find(second_opponent)

    respond_to do |format|
      if @match.save
        @match.create_score_card
        format.html { redirect_to round_matches_path, notice: 'Match and Scorecard were successfully created.' }
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
    @match.calculate_handicap_strokes

    respond_to do |format|
      if @match.update_attributes(params[:match])
        format.html { redirect_to round_match_url, notice: 'Match was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_score_card
    @scores = Score.update(params[:scores].keys, params[:scores].values).reject { |s| s.errors.empty? }
    if @scores.empty?
      flash[:notice] = 'Scorecard was successfully updated'
      redirect_to round_match_show_score_card_url
    else
      render :action => 'edit_score_card'
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to round_matches_url }
      format.json { head :no_content }
    end
  end
end
