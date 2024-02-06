def rank
    @eco_like_ranks = Eco.find(Like.group(:eco_id).order('count(eco_id) desc').pluck(:eco_id))
  end