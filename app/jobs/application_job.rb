class ApplicationJob < ActiveJob::Base
  belongs_to :user
  belongs_to :post
end
