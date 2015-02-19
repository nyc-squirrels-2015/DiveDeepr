require_relative './spec_helper.rb'

class DiveLogsSpec
  describe 'dive_logs' do
    let(:dive_log) { DiveLog.create(
                                    date: "11/14/1989",
                                    visibility: "10ft",
                                    location: "GBR",
                                    temperature: "70",
                                    exposure_protection: "3mm Wetsuit",
                                    start_psi: 4000,
                                    end_psi: 700,
                                    depth: 30,
                                    time_in: Time.parse("11:00"),
                                    time_out: Time.parse("11:45"),
                                    comment: "Visibility was not as great today due to the storm from the night before",
                                    user_id: 1
                                    )
                    }


    it 'should respond to /dive_logs/all' do
      get '/dive_logs/all'
      expect(last_response).to be_ok
    end

    it 'should respond to /dive_logs/new' do
      get '/dive_logs/new'
      expect(last_response).to be_ok
      expect(last_response.body).to include "comment"
    end

    it 'should respond to /dive_logs/:id/show' do
      get "/dive_logs/#{dive_log.id}/show"
      expect(last_response).to be_ok
      expect(last_response.body).to include "update"
      expect(last_response.body).to include "photos"
    end

    it 'should respond to /dive_logs/new' do
      post "/dive_logs/new", params={log: {
                                           date: "11/1/1944",
                                           visibility: "100ft",
                                           location: "GBR",
                                           temperature: "76",
                                           exposure_protection: "3mm Wetsuit",
                                           start_psi: 4000,
                                           end_psi: 1000,
                                           depth: 30,
                                           time_in: Time.parse("13:00"),
                                           time_out: Time.parse("13:45"),
                                           comment: "It was a great dive over all. I saw tons of colorful fish and a SHARK!!!!!",
                                           user_id: 1
                                                  }
                                        }
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_response.body).to include "11/1/1944"
    end

    after do
      DiveLog.destroy_all
    end

  end

end