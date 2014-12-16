class Task < ActiveRecord::Base
	enum priority: %w(high medium low)
end
