class WelcomeController < ApiController
  def index
    render json: {
        success: true,
        endpoints: [{
                        '/v1/actors?' => [{
                                             '&first' => 'input of first name. Case insensitive.',
                                             '&last' => 'input of last name. Case insensitive.',
                                             '&sex' => 'Male or Female',
                                             '&dod' => 'Date of birth',
                                             '&dod' => 'date of Death',
                                             '&movies' => 'boolean. true to list of movies the actor is in.'
                                         }]
                    },
                    {
                        '/v1/directors?' => [{
                                                '&first' => 'input of first name. Case insensitive.',
                                                '&last' => 'input of last name. Case insensitive.',
                                                '&dod' => 'Date of birth',
                                                '&dod' => 'date of Death',
                                                '&movies' => 'boolean. true to list of movies the director is in.'
                                            }]
                    },
                    {
                        '/v1/movies?' => [{
                                                '&title' => 'input of movie title. Case insensitive.',
                                                '&year' => 'input of movie year.',
                                                '&rating' => 'input of movie rating.',
                                                '&company' => 'input of company',
                                                '&genre' => 'list of genre'
                                            }]
                    }
        ]
    }
  end
end
