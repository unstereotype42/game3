# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
NaiseiMaster.create(:naisei_id => 1, :naisei_name => "kaikon", :naisei_name_j => "開墾")
NaiseiMaster.create(:naisei_id => 2, :naisei_name => "syougyou", :naisei_name_j => "商業")
NaiseiKaikonMaster.create(:level => 1, :cost => 100, :time => 60)
NaiseiKaikonMaster.create(:level => 2, :cost => 200, :time => 120)
NaiseiKaikonMaster.create(:level => 3, :cost => 300, :time => 180)
NaiseiSyougyouMaster.create(:level => 1, :cost => 150, :time => 90)
NaiseiSyougyouMaster.create(:level => 2, :cost => 250, :time => 150)
NaiseiSyougyouMaster.create(:level => 3, :cost => 350, :time => 210)
UserMaster.create(:user_id => 1, :user_name => "八幡", :money => 5000, :food => 5000, :army => 3000, :kaikon_lv => 0, :syougyou_lv => 0)
UserMaster.create(:user_id => 2, :user_name => "伊藤", :money => 3000, :food => 3000, :army => 1500, :kaikon_lv => 0, :syougyou_lv => 0)
UserMaster.create(:user_id => 3, :user_name => "馬場園", :money => 2000, :food => 2000, :army => 1000, :kaikon_lv => 0, :syougyou_lv => 0)
NaiseiJob.create(:user_id => 1, :run_flag => 0)
NaiseiJob.create(:user_id => 2, :run_flag => 0)
