class Game < ActiveRecord::Base

  serialize :team1_classifier, Classifier::Bayes
  serialize :team2_classifier, Classifier::Bayes
  before_create :initialize_classifier
  before_update :remove_stemmer

  private

  def initialize_classifier
    self.team1_classifier = Classifier::Bayes.new(
      :categories => ['Positive', 'Negative']
    )

    self.team2_classifier = Classifier::Bayes.new(
      :categories => ['Positive', 'Negative']
    )

    remove_stemmer
  end

  def remove_stemmer
    self.team1_classifier.remove_stemmer
    self.team2_classifier.remove_stemmer
  end

end
