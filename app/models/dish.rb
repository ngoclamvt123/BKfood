class Dish < ApplicationRecord
  has_many :detail_orders

  # has_attached_file :img, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/missing.png"
  # validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

  if Rails.env.development?
    has_attached_file :img, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "missing.png"
    validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
  else
      has_attached_file :img, styles: { medium: "200x200>", thumb: "100x100>" }, default_url: "missing.png",
                :storage => :dropbox,
                :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
                :path => ":style/:id_:filename"
      validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
    end
end
