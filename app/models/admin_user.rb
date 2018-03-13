class AdminUser < ApplicationRecord

    # self.table_name = "admin_users"

    has_and_belongs_to_many :pages

    has_many :section_edits
    has_many :sections, :through => :section_edits

    scope :visible, lambda { where :visible => true}
    scope :invisible, lambda {where :visible => false}
    scope :sorted, lambda {order("position ASC")}
    scope :newest_first, lambda { order("created_at DESC")} #newest first
    scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
end
