class Item < ActiveRecord::Base
  belongs_to :list
  validates_presence_of :list, :description
  validates_length_of :description, minimum: 2
  validates_uniqueness_of :description, scope: :list
  validate :due_date_cannot_be_in_the_past

  private

  def due_date_cannot_be_in_the_past
    if due_date.present? && due_date < Date.today
      errors.add :due_date, "can't be in the past"
    end
  end
end
