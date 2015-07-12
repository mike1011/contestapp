class NewOffer < ActiveRecord::Base

 validates_presence_of :name

 ##defining constants
 ACTIVE="ACTIVE"
 INACTIVE="INACTIVE"
 DELAY="DELAY"

 belongs_to :account

 scope :active, -> { where("status == ?", NewOffer::ACTIVE) }
 scope :inactive, -> { where("status == ?", NewOffer::INACTIVE) }
 scope :delay, -> { where("status == ?", NewOffer::DELAY) }

validates_presence_of :image
validates_presence_of :video

##has image
has_attached_file :image,
 :styles => 
 {
  :medium => "x300",
  :small => "150x150>",
  :thumb => "90x90>",
  },
:storage => :s3,
:s3_permissions => :private,
:s3_credentials => S3_CREDENTIALS


##has video
  has_attached_file :video,
 :styles => {
    :mp4video => { :geometry => "640x480", :format => 'mp4', :convert_options => {:output => {:ar => 44100}} },
    :webmvideo =>{ :geometry => "1024x576", :format => 'webm', :convert_options => {:output => {:ar => 44100}} },
    :oggvideo => { :geometry => "1024x576", :format => 'ogg', :convert_options => {:output => {:ar => 44100}} },
    :preview => { :geometry => '300x300>', :format => 'jpg', :time => 5 }
  },
    processors: [:ffmpeg],
    :max_size => 25.megabytes,  
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename"

end
