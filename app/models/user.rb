# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  department             :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  grade                  :integer          not null
#  image                  :string
#  language               :string           default("ro")
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  phone                  :string
#  position               :integer          default("team_member"), not null
#  preferences            :hstore
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_preferences           (preferences) USING gist
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :purchases, foreign_key: :operator_id
  has_many :operated_stands, class_name: :Stand, foreign_key: :operator_id
  has_and_belongs_to_many :stands
  store_accessor :preferences, :theme

  def name
    "#{first_name} #{last_name}"
  end

  def name_grade
    "#{name}, #{I18n.t('grades.with_prefix.' + grade)}"
  end

  def self.today
    User.all.filter { |p| p.created_at.to_date.today? }
  end

  enum grade: {
    grade_12:   0,
    grade_11:   1,
    grade_10a:  2,
    grade_10d:  3,
    grade_10o:  4,
    grade_9a:   5,
    grade_9o:   6
  }

  enum department: {
    logistics:      0,
    communication:  1,
    finance:        2,
    hr:             3,
    design:         4,
    photography:    5,
    no_department:  6
  }

  enum position: {
    team_member:      0,
    co_ordinator:     1,
    project_manager:  2,
    special_member:   3,
    no_position:      4
  }
end
