class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end

  def new
    authenticate!
    @entry = Entry.new
  end

  def show
    @entry = find_and_ensure_entry(params[:id])
  end

  def edit
    @entry = Entry.find(params)
  end
end
