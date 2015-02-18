User.create(name: "james", email: "james@email.com", certification: "Dive Master", password: "123", password_confirmation: "123")

DiveLog.create(date: "11/1/1989", visibility: "100ft", location: "GBR", temperature: "76", exposure_protection: "3mm Wetsuit", start_psi: 4000, end_psi: 1000, depth: 30, time_in: Time.parse("13:00"), time_out: Time.parse("13:45"), comment: "It was a great dive over all. I saw tons of colorful fish and a SHARK!!!!!", user_id: 1)
DiveLog.create(date: "11/14/1989", visibility: "10ft", location: "GBR", temperature: "70", exposure_protection: "3mm Wetsuit", start_psi: 4000, end_psi: 700, depth: 30, time_in: Time.parse("11:00"), time_out: Time.parse("11:45"), comment: "Visibility was not as great today due to the storm from the night before", user_id: 1)

Photo.create(url: "http://www.teachoceanscience.net/images/carousel_eel_lge.jpg", log_i: 1)