class ScoreCardsController < ApplicationController
  def show
    raise 'What'
    @match_id = params[:match_id]
    @scores = Score.where('match_id = ?', @match_id)
    @total_strokes = 0
    @total_par = 0

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scores }
    end
  end

  def edit
    @match_id = params[:match_id]
    @scores = Score.where('match_id = ?', @match_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scores }
    end
  end

  def update
    @scores = Score.update(params[:scores].keys, params[:scores].values).reject { |s| s.errors.empty? }
    if @scores.empty?
      flash[:notice] = "Scores updated"
      redirect_to matches_url
    else
      render :action => "show_score_card"
    end
  end
end
