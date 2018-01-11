# One Million Pagination

## Getting Setup

Clone the repo and run:

    yarn install && bundle && rails db:setup

Once that runs, you can turn on the rails server by running

    rails s

## Key Files

### Integer.to_words method

[config/initializers/integer.rb](https://github.com/MikeRogers0/OneMillionPagination/tree/master/config/initializers/integer.rb)
[test/lib/integer_test.rb](https://github.com/MikeRogers0/OneMillionPagination/tree/master/test/lib/integer_test.rb)

### Numbers Paginator

[lib/paginators/numbers_paginator.rb](https://github.com/MikeRogers0/OneMillionPagination/tree/master/app/lib/paginators/numbers_paginator.rb)
[lib/paginators/numbers_paginator_test.rb](https://github.com/MikeRogers0/OneMillionPagination/tree/master/test/lib/paginators/numbers_paginator_test.rb)
