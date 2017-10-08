module RedirectHelper
  def find_and_ensure_entry(id)
    entry = Entry.find_by(id: id)
    halt(404, erb(:'404'))
    entry
  end
end
