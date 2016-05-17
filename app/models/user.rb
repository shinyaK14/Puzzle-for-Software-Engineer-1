class User < ActiveRecord::Base
  validates :name, presence: true
  validates :name, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :comment, length: { maximum: 500 }
  validates :comment, presence: true, on: :update

  before_save :create_token
  before_update :replace_irrelevant_comment
  before_update :set_seq

  private

  def create_token
    self.token = SecureRandom.urlsafe_base64(20).html_safe
  end

  def replace_irrelevant_comment
    self.comment = comment.gsub(/call\/me/, '...')
    self.comment = comment.gsub(/challenge_users/, '...')
  end

  def set_seq
    self.seq = User.where.not(comment: nil).count + 1
  end
end
