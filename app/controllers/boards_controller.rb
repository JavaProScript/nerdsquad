class BoardsController < ApplicationController
  before_action :set_game, only: %i[new create show update]
  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.game = @game
    if @board.save
      redirect_to game_board_path(params[:game_id],@board.id)
    else
      render 'games/new'
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @game.board = @board
    @board.update!(board_params)
    if @board.game.gamerooms.last
      GameroomChannel.broadcast_to(
        @board.game.gamerooms.last,
        "moved"
      )
    else
      redirect_to game_path(params[:game_id])
    end
    redirect_back(fallback_location: gameroom_path(@board.game.gamerooms.last)) if @board.game.gamerooms.last
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def board_params
    params.require(:board).permit(:photo, :posX, :posY)
  end
end


