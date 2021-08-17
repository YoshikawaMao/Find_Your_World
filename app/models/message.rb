class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :admin, optional: true
  validate :id_present?

  def id_present?
    if self.user_id.nil? &&  self.admin_id.nil?
      errors.add(:user_id, "入力してください")
      errors.add(:admin_id, "入力してください")
    end
  end
  # id.present?=>idがあるか確認するためのif文
  # selfにはcurrent_user/current_adminが入る
  # ユーザーも管理者もidがnillだった場合ターミナルにエラーが出るようになっている

end
