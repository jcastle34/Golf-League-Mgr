class LeaguesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @my_leagues = []
    golfer = Golfer.find_by_id(current_user)
    if golfer
      @my_leagues = League.joins(:golfers).where('golfer_id = ?', golfer.id)
    end
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
    @league = League.find(params[:id])
    @current_league = @league
    @members = Golfer.joins(:leagues).where('league_id = ?', @league.id)
    @teams = Team.where('league_id = ?', @league.id).includes(:golfers)
    @upcoming_matches = Match.where('league_id = ?', @league.id).includes(:golfers)
    @rounds = Round.where('rounds.league_id = ?', @league.id).order(date: :asc)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @league }
    end
  end

end