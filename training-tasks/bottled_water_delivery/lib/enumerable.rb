# frozen_string_literal: true

module Enumerable
  def count_by(&block)
    list =
      group_by(&block)
      .map { |key, items| [key, items.count] }
      .sort_by(&:first)

    Hash[list]
  end
end

# Returns a Hash of { key => count } pairs (see below)

# > Array#count_by { |user| user.email }
# => { "sina.cn"=>2, ..., "hotmail.com"=>128, "gmail.com"=>153}
