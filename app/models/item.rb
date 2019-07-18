class Item < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :category, optional: true

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
     indexes :title, analyzer: 'english'
     indexes :description, analyzer: 'english'
    end
   end   

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title', 'description']
          }
        }
      }
    )
  end
end
Item.import
