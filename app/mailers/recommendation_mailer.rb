class RecommendationMailer < ActionMailer::Base
  default from: "no-reply@shopease.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.recommendation_mailer.send_recommendation.subject
  #
  def send_recommendation(id,reciever,account_id)
    @recommendation=ProductRecommendation.find id
    @account=Account.find account_id
    Rails.logger.info "==========Sending Recommendation Email=========="
    mail(:to => reciever, :subject => "#{@recommendation.recommended_by} has made a Recommendation")
  end






end
