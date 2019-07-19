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
          query_string: {
            query: "*#{query}*",
            fields: ['title^2', 'description^1'],
            type:   'phrase_prefix'
          }
        }
      }
    )
  end
end
# Item.import
