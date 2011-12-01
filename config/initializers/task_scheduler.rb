require 'classifier'
require 'twitter'

scheduler = Rufus::Scheduler.start_new

scheduler.every '20m' do
  train
end


scheduler.every '30m' do

  puts "classifying...."
  game = Game.where(:team1_name => 'Miami Dolphins').first

  classifier1 = game.team1_classifier
  classifier2 = game.team2_classifier


  team1_tweet_set = Twitter.search("#{game.team1_name}")
  team2_tweet_set = Twitter.search("#{game.team2_name}")

  team1_tweet_set.each{|tweet|
          text = tweet.text.encode!("UTF-8")
          text.gsub! /#{game.team1_name}/, ''
          text.gsub!(/(?:f|ht)tps?:\/[^\s]+/, '')
          if(classifier1.classify(text) == "Positive")
            game.team1_pos = game.team1_pos + 1
          else
            game.team1_neg = game.team1_neg + 1
          end
  }

  team2_tweet_set.each{|tweet|
          text = tweet.text.encode!("UTF-8")
          text.gsub! /#{game.team2_name}/, ''
          text.gsub!(/(?:f|ht)tps?:\/[^\s]+/, '')
          if(classifier2.classify(text) == "Positive")
            game.team2_pos = game.team2_pos + 1
          else
            game.team2_neg = game.team2_neg + 1
          end
  }

  game.update_attributes game

  puts "done classifying."
end

def train
  puts "training..."

  game = Game.where(:team1_name => 'Miami Dolphins').first

  classifier1 = game.team1_classifier
  classifier2 = game.team2_classifier


  team1_pos_tweet_set = Twitter.search("#{game.team1_name} :)")
  team2_pos_tweet_set = Twitter.search("#{game.team2_name} :)")

  team1_neg_tweet_set = Twitter.search("#{game.team1_name} :(")
  team2_neg_tweet_set = Twitter.search("#{game.team2_name} :(")

  team1_pos_tweet_set.each {|pos|
    text = pos.text.encode!("UTF-8")
    text.gsub! /#{game.team1_name}/, ''
    text.gsub!(/(?:f|ht)tps?:\/[^\s]+/, '')
    classifier1.train_positive text
  }

  team1_neg_tweet_set.each {|neg|
    text = neg.text.encode!("UTF-8")
    text.gsub! /#{game.team1_name}/, ''
    text.gsub!(/(?:f|ht)tps?:\/[^\s]+/, '')
    classifier1.train_negative (text)}

  team2_pos_tweet_set.each {|pos|
    text = pos.text.encode!("UTF-8")
    text.gsub! /#{game.team2_name}/, ''
    text.gsub!(/(?:f|ht)tps?:\/[^\s]+/, '')
    classifier2.train_positive (text)}

  team2_neg_tweet_set.each {|neg|
    text = neg.text.encode!("UTF-8")
    text.gsub! /#{game.team2_name}/, ''
    text.gsub!(/(?:f|ht)tps?:\/[^\s]+/, '')
    classifier2.train_negative (text)}

  game.team1_classifier = classifier1
  game.team2_classifier = classifier2

  game.update_attributes game

  puts "done training."
end

def sanitize_tweet(tweet, team)
  puts tweet
  tweet.encode!("UTF-8")
  tweet.gsub! /#{team}/, ''
  tweet.gsub!(/(?:f|ht)tps?:\/[^\s]+/, '')

  puts tweet
end