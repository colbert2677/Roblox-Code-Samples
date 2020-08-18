-- Example code utilising Human class to show how it inherits from Animal.
-- @author colbert2677

local Human = require("Human")

local Neighbour = Human.new("foobar", "Prefer not to say")

-- ChangeName comes from Animal, yet the object was created from the Human class.
Neighbour:ChangeName("Person")

-- Destroy also comes from Animal, not Human. Still valid.
Neighbour:Destroy()
