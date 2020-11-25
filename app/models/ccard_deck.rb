class CcardDeck < ApplicationRecord
  belongs_to :clone
  has_many :ccards, dependent: :destroy

  def draw!
    temp = CcardDeck.new(game: clone.game, name: 'temp', blind?: true)
    drawn_ccard = ccards.pop
    drawn_ccard.deck = temp
    drawn_ccard.save
    temp.save
  end

  def shuffle!
    range = Range.new(0...ccards.size)
    ccards.each do |ccard|
      ccard.update position: range.to_a.sample
    end
    flash.now "Deck shuffled!"
  end
end
