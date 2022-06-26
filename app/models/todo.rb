class Todo < ApplicationRecord
      belongs_to :user  #table called users & will contain user_id => Automatically interprets

      def self.overdue
        where("due_date < ?", Date.today)
      end
      def self.duetoday
        where(due_date: Date.today)
      end
      def self.duelater
        where("due_date > ?", Date.today)
      end
      def self.completed
        where(completed: 1)
      end
end
