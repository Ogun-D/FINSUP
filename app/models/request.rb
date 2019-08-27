class Request < ApplicationRecord
  belongs_to :client, class_name: 'User'
  belongs_to :advisor, class_name: 'User', optional: true
  has_one :response, dependent: :destroy
  has_one :review, dependent: :destroy

  TYPES = ['budgeting', 'saving', 'bill paying']

  validates :client, presence: true
  validates :content, presence: true, on: :update
  validates :specialty, inclusion: { in: TYPES }
end
