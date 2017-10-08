class PostsController < ApplicationController
  def index
    @entries = Entry.all
    render "entries/index"
  end

  def new
    authenticate!
    @entry = Entry.new
    render "entries/new"
  end

  def create
    authenticate!
    @entry = Entry.new(entry_params)
    @entry.user_id = session[:user_id]
    if @entry.save
      redirect_to "/entries"
    else
      @errors = @entry.errors.full_messages
      render "entries/new"
    end
  end

  def show
    @entry = find_and_ensure_entry(params[:id])
    render "entries/show"
  end

  def edit
    authenticate!
    @entry = find_and_ensure_entry(params[:id])
    authorize!(@entry.user)
    render "entries/edit"
  end

  def update
    authenticate!
    @entry = find_and_ensure_entry(params[:id])
    if !authorize!(@entry.user)
      if @entry.update(entry_params)
        redirect_to "/entries/#{@entry.id}"
      else
        @errors = @entry.errors.full_messages
        render "entries/edit"
      end
    end
  end

  def destroy
    authenticate!
    @entry = find_and_ensure_entry(params[:id])
    if !authorize!(@entry.user)
      @entry.destroy
      redirect_to "/users/#{current_user.id}"
    end
  end

  def entry_params
    params.require(:entry).permit(:title, :body)
  end
end
