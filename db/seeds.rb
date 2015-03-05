seeds_logger = Logger.new(STDOUT)

first_user = User.create(
  name: "jorge",
  provider: "github",
  uid: "203489",
  nickname: "dabomb",
  email: "jorge@example.com",
  thumbnail_url: "http://robohash.org/1"
 )

second_user = User.create(
  name: "horace",
  provider: "github",
  uid: "123456",
  nickname: "speedy",
  email: "horace@example.com",
  thumbnail_url: "http://robohash.org/2"
 )

third_user = User.create(
  name: "steve",
  provider: "github",
  uid: "567890",
  nickname: "javablip",
  email: "steve@example.com",
  thumbnail_url: "http://robohash.org/3"
 )

seeds_logger.info "Users created!"

first_user.goals.create(
  title: "committen with mittens",
  description: "mittens does some commitin'",
  start_date: Date.current,
  end_date: Date.current.advance(days: 5),
  daily_quantity: 2,
  completed: false
 )

first_user.goals.create(
  title: "coding on open source",
  description: "it does the body good",
  start_date: Date.current,
  end_date: Date.current.advance(days: 5),
  daily_quantity: 4,
  completed: false
 )

seeds_logger.info "First user goals created!"

second_user.goals.create(
  title: "gettin my commit on",
  description: "to the moon!",
  start_date: Date.current,
  end_date: Date.current.advance(days: 5),
  daily_quantity: 2,
  completed: true
 )

seeds_logger.info "Second user goals created!"

third_user.goals.create(
  title: "wow such code",
  description: "doing some projamming",
  start_date: Date.current,
  end_date: Date.current.advance(days: 5),
  daily_quantity: 2,
  completed: false
 )

seeds_logger.info "Second user goals created!"

first_user.commits.create(
  message: "create seeds file",
  date: Date.current.advance(days: 10),
  url: "https://github.com/trayo/committen_rails/commit/8a7761",
  sha: "8a77612b1d66ec211d63fe56c24a3afa54a27a87"
 )

first_user.commits.create(
  user_id: first_user,
  message: "create seeds file",
  date: Date.current.advance(days: 10),
  url: "https://github.com/trayo/committen_rails/commit/66fd61",
  sha: "66fd619d53a635aa834d22ec7df243560fd4490f"
 )

seeds_logger.info "First user goals created!"

second_user.commits.create(
  message: "create seeds file",
  date: Date.current.advance(days: 10),
  url: "https://github.com/trayo/committen_rails/commit/880705",
  sha: "88070560d6aaf66859696c54dd01310f73644c66"
 )

seeds_logger.info "Second user goals created!"

third_user.commits.create(
  message: "create seeds file",
  date: Date.current.advance(days: 10),
  url: "https://github.com/trayo/committen_rails/commit/4b14fe",
  sha: "4b14fe7493932c29c0d1b85a3ba120bd22079c3e"
 )

third_user.commits.create(
  message: "create seeds file",
  date: Date.current.advance(days: 10),
  url: "https://github.com/trayo/committen_rails/commit/59968d",
  sha: "59968d1e2579d15da9a8a803c5c586a72b45b5ce"
 )

seeds_logger.info "Third user goals created!"
