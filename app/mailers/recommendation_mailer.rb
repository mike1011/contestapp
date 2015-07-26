class RecommendationMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.recommendation_mailer.send_recommendation.subject
  #
  def send_recommendation(id)
    @recommdation=ProductRecommendation.find id
    Rails.logger.info "==========Sending Recommendation Email=========="
    @greeting = "Hi"
     mailers_count=@Recommendation.recommend_to
     mailers_count.split(",").each do |reciever|
      mail(:to => reciever.to_s, :subject => "#{@recommdation.recommended_by} has made a Recommendation")
    end


  end






end
