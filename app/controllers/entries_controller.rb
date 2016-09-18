class EntriesController < ApplicationController
  def index
    @websites = [
      ["http://railsgirls.com", "Rails Girls"],
      ["https://en.wikibooks.org/wiki/Ruby_Programming", "Wikibooks"],
      ["http://guides.rubyonrails.org", "Ruby on Rails Guides"],
    ]
    @entries = Entry.all
  end

  def show
    @entry = Entry.find_by_id(params["id"])
  end

  def new

  end
  def create
    entry_params = params["entry"].permit("title", "contents")
    entry=Entry.create(entry_params)
    redirect_to(entry_path(entry))
  end
  def edit
    @entry = Entry.find_by_id(params['id'])
  end
  def update
  entry_params = params["entry"].permit("title", "contents")
  entry = Entry.find(params["id"])
  entry.update(entry_params)
  redirect_to(entry_path(entry))
  end
  def destroy
    dupa=Entry.find_by_id(params["id"])
    dupa.destroy
    redirect_to(entries_path)
  end
end
