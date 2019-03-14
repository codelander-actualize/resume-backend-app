
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


10.times do
Education.create(
    start_date: FFaker::Time.date,
    end_date: FFaker::Time.date,
    degree: FFaker::Education.degree,
    university_name: FFaker::Education.school_name,
    details: FFaker::DizzleIpsum.phrases,
    student_id: rand(1..10)
    )
end

20.times do
    Experience.create(
        start_date: FFaker::Time.date,
        end_date: FFaker::Time.date,
        job_title: FFaker::Job.title,
        company_name: FFaker::Company.name,
        details: FFaker::Company.catch_phrase,
        student_id: rand(1..10)
        )
end


20.times do
    Capstone.create(
        name: FFaker::Product.product,
        description: FFaker::Company.bs,
        url: FFaker::Internet.domain_name,
        image_url: FFaker::Image.url,
        student_id: rand(1..10)
        )
end

40.times do
Skill.create(
    skill_name: FFaker::Skill.tech_skill,
    student_id: rand(1..10)
)
end