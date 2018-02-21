@user = User.new
@user.name = 'Ryo Suzuki'
@user.username = 'ryooopan'
@user.location = 'Kanagawa, Japan'
@user.about = 'Hello, I am Ryo. I am from database!'
@user.save

@user = User.new
@user.name = 'Shohei Aoki'
@user.username = 'moyahima'
@user.location = 'Tottori, Japan'
@user.about = 'Nice to meet you. I am from database!'
@user.save

(1..100).map(&:to_s).each { |num| Tweet.create(title: "No.#{num}", content: "No.#{num} content") }
