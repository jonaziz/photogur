class Picture < ActiveRecord::Base
  # Rails knows this is a model (activerecord base subclass)
  # It knows there must be a db with the same title as this
  # so it looks for 'pictures' (plural). This is why the
  # Pictures.new command worked in rails console.

  # Also created an id. All models need some kind of id. Rails
  # made a number column automatically.

end