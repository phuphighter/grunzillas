class GamesController < ApplicationController
  before_filter :require_user, :only => [:new, :destroy]

  # GET /games
  # GET /games.xml
  def index
    @games = Game.all
    @statistics = Statistic.will_sort(params[:sort_by])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @games }
    end
  end

  def games
    @games = Game.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @games }
    end
  end

  def statistics
    @statistics = Statistic.will_sort(params[:sort_by])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @statistics }
    end
  end

  # GET /games/1
  # GET /games/1.xml
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/new
  # GET /games/new.xml
  def new
    @game = Game.new
    @game.statistics.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.xml
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        Game.update_stats
        Game.update_record
        flash[:notice] = 'Game was successfully created.'
        format.html { redirect_to(@game) }
        format.xml  { render :xml => @game, :status => :created, :location => @game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.xml
  def update
    params[:game][:existing_statistic_attributes] ||= {}
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        Game.update_stats
        Game.update_record
        flash[:notice] = 'Game was successfully updated.'
        format.html { redirect_to(@game) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.xml
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to(games_url) }
      format.xml  { head :ok }
    end
  end
end
