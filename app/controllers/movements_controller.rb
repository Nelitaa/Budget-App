class MovementsController < ApplicationController
  def new
    @movement = Movement.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @movement = Movement.new(movement_params)
    @movement.user = current_user

    if @movement.save
      flash[:notice] = 'Transaction created successfully!.'
      redirect_to @group
    else
      flash[:alert] = @movement.errors.full_messages.first if @movement.errors.any?
      render :new, status: :unprocessable_entity
    end
  end

  private

  def movement_params
    params.require(:movement).permit(:name, :amount, group_ids: [])
  end
end
