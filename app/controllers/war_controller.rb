class WarController < ApplicationController
  def list

    @player_id = params[:player_id]

    @enemylist = UserMaster.where.not("user_id = ?" , @player_id)

  end

  def confirm

    player_id = params[:player_id]
    enemy_id = params[:enemy_id]

    @player = UserMaster.find_by("user_id = ?" , player_id)
    @enemy = UserMaster.find_by("user_id = ?" , enemy_id)

    #攻めるのに必要なコスト（金：兵力の10%換算、兵糧：兵力の20%換算）
    money_cost = @player.army * 0.1
    food_cost = @player.army * 0.2
    @attack_cost = { food: food_cost.to_i, money: money_cost.to_i }

  end

  def attack

    player_id = params[:player_id]
    enemy_id = params[:enemy_id]

    @player = UserMaster.find_by("user_id = ?" , player_id)
    @enemy = UserMaster.find_by("user_id = ?" , enemy_id)

    #出兵コストをplayer資産から引く
    money_cost = @player.army * 0.1
    food_cost = @player.army * 0.2

    @player.money -= money_cost
    @player.food -= food_cost
    @player.save

    @win_flag = 0

    if @player.army > @enemy.army
      @win_flag = 1

      #player側の勝利処理
      win_army = @player.army * 0.2
      win_money = @enemy.money * 0.5
      win_food = @enemy.food * 0.5
      @win_cost = {army: win_army.to_i, money: win_money.to_i, food: win_food.to_i}

      @player.army -= win_army.to_i
      @player.money += win_money.to_i
      @player.food += win_food.to_i
      @player.save

      #enemy側の敗戦処理
      lose_army = @enemy.army * 0.8

      @enemy.army -= lose_army.to_i
      @enemy.money -= win_money.to_i
      @enemy.food -= win_food.to_i
      @enemy.save

    elsif @player.army < @enemy.army
      @win_flag = 0

      #player側の敗戦処理
      lose_army = @player.army * 0.8

      @player.army -= lose_army.to_i
      @player.save

      #enemy側の勝利処理
      win_army = @enemy.army * 0.2

      @enemy.army -= win_army.to_i
      @enemy.save

    end


  end

end
