# initialize nokogiri
nokogiri = Nokogiri.HTML(content)

# get the seller username
seller = nokogiri.at_css('.seller-persona a')&.text
seller = nokogiri.at_css('.ux-seller-section__item--seller > a:nth-child(1) > span:nth-child(1)')&.text if seller.nil?

# get the seller's feedback
feedback = nokogiri.at_css('.seller-persona span[3]')&.text
feedback = nokogiri.at_css('div.ux-seller-section:nth-child(2) > div:nth-child(1) > div:nth-child(2) > span:nth-child(1)')&.text if feedback.nil?

# save it into outputs
outputs << {
    _collection: 'products',
    title: page['vars']['title'],
    price: page['vars']['price'],
    seller: seller,
    feedback: feedback
}