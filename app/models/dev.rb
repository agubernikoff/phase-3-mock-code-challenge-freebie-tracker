class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one item_name
        if freebies.filter{|f| f.item_name == item_name}.empty?
            false
        else true
        end
    end

    def give_away dev,freebie
        if freebies.include?(freebie)
            f=freebies.find(freebie.id)
            f.dev_id=dev.id
            f.save
            "#{self.name} has given #{freebie.item_name} to #{dev.name}"
        else "ERROR: #{freebie.item_name} doesn't belong to #{self.name}"
        end
    end
end
