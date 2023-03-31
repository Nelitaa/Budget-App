class GroupsController < ApplicationController
  before_action :set_user

  def index
    @groups = @user.groups.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user = @user
    if @group.save
      redirect_to groups_path, notice: 'Category added successfully!.'
    else
      flash.now[:alert] = @group.errors.full_messages.first if @group.errors.any?
      render :new, status: 400
    end
  end

  def show
    @group = Group.find(params[:id])
    return unless @group.user == current_user

    @movements = @group.movements.order(created_at: :desc)
    @total = @movements.sum(:amount)
  end

  private

  def set_user
    @user = current_user
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
