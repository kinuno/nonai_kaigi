class Color < ActiveHash::Base
  self.data = [
    { id: 1, name: 'black' },
    { id: 2, name: 'red' },
    { id: 3, name: 'pink' },
    { id: 4, name: 'blue' },
    { id: 5, name: 'lightblue' },
    { id: 6, name: 'green' },
    { id: 7, name: 'purple' },
    { id: 8, name: 'orange' },
    { id: 9, name: 'gray' },
    { id: 10, name: 'lightgreen' }
  ]

  include ActiveHash::Associations
  has_many :characters
end