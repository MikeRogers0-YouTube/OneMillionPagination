# One Million Pagination

## Getting Setup

Clone the repo and run:

    yarn install && bundle && rails db:setup

Once that runs, you can turn on the rails server by running

    rails s

## Key Files


### Integer.to_words method

config/initializers/integer.rb
test/lib/integer_test.rb

### 

app/lib/paginators/numbers_paginator.rb
test/lib/paginators/numbers_paginator_test.rb
