class StacksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_stack, only: %i[ show edit update destroy ]

  # GET /stacks or /stacks.json
  def index
    @stacks = Stack.all
  end

  # GET /stacks/1 or /stacks/1.json
  def show
  end

  # GET /stacks/new
  def new
    @stack = Stack.new
  end

  # GET /stacks/1/edit
  def edit
  end

  # POST /stacks or /stacks.json
  def create
    @stack = Stack.new(stack_params)
    @stack.user = current_user


      if @stack.save
        redirect_to stack_url(@stack), notice: "Stack was successfully created."
      else
        render :new, status: :unprocessable_entity
      
    end
  end

  # PATCH/PUT /stacks/1 or /stacks/1.json
  def update
    if @stack.update(stack_params)
     redirect_to stack_url(@stack), notice: "Stack was successfully updated." 
    else
     render :edit, status: :unprocessable_entity 
    end
  end

  # DELETE /stacks/1 or /stacks/1.json
  def destroy
    @stack.destroy

    redirect_to stacks_url, notice: "Stack was successfully destroyed." 
  end

  private

    def set_stack
      @stack = Stack.find_by(share_link: params[:share_link]) ||  Stack.find_by(id: params[:id])
    end

    def stack_params
      params.require(:stack).permit(:title)
    end
end
