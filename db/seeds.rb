
10.times do
  Student.create(
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    email: FFaker::Internet.email,
    phone_number: FFaker::PhoneNumber.short_phone_number,
    short_bio: FFaker::BaconIpsum.phrase,
    linkedin_url: "linkedin.com/" + FFaker::Name.first_name,
    twitter_handle: "@" + FFaker::Name.last_name,
    personal_blog: FFaker::Internet.http_url,
    online_resume_url: FFaker::Internet.http_url,
    github_url: "github.com/" + FFaker::Name.first_name,
    photo_url: FFaker::Image.url
    )
end
