class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :email, type: String
  field :name, type: String
  field :token, type: String
  field :comment, type: String

  validates :name, presence: true
  validates :name, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :comment, length: { maximum: 500 }
  validates :comment, presence: true, on: :update

  before_save :create_token
  before_update :replace_irrelevant_comment

  private

  def create_token
    self.token = SecureRandom.urlsafe_base64(8).html_safe
  end

  def replace_irrelevant_comment
    self.comment = comment.gsub(/call\/me/, '...')
    self.comment = comment.gsub(/challenge_users/, '...')
  end
end
