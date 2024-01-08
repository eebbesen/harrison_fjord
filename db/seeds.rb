# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w[https://tse3.mm.bing.net/th?id=OIP.c-qlgHW8qgh62XQuVA7M4wHaL3
   https://upload.wikimedia.org/wikipedia/en/b/be/Han_Solo_depicted_in_promotional_image_for_Star_Wars_%281977%29.jpg
   https://lumiere-a.akamaihd.net/v1/images/han-solo-main_a4c8ff79.jpeg?region=0%2C0%2C1920%2C1080
   https://compote.slate.com/images/2b6fb34a-8047-4e17-b3d5-64987519657d.jpg?crop=1180%2C842%2Cx0%2Cy0&amp;width=480
   https://cdn.vox-cdn.com/uploads/chorus_asset/file/11415473/HS_FF_000068.jpg
   https://www.hasbro.com/common/productimages/en_CA/6B57734244EB4196B2F84316D5DA4975/40A370C6A6834E8280B99DD11FF06A25.jpg].each do |l|
  Link.create!(url: l, thumbnail_url: l)
end
