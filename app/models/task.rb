class Task < ActiveRecord::Base
	enum priority: %w(High Medium Low)
end
