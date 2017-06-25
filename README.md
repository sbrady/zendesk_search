--ZenDesk Search--

to get started:
1) install ruby, see the `Gemfile` fo the correct version

2) `gem install bundler`

3) `bundle` - this should install the required gems

4) `rake` - this will run all the tests, if it passes you are read.

5) `./bin/zendesk_search.rb` to start the program


I approached the problem by breaking it down into smaller deliverable features (User stories).
The overall design approach is to apply Domain Driven Design.
Using entities(models) to represent the problem domain. Services and repositories to add some layers.
I have also applied design patterns, such as FrontController, Repository, and Model view controller.
I drove the design using BDD and TDD. Starting with feature specs, and moving down into unit tests.
I have applied the Dependency Inversion Principle by using dependency injection.
The approach to TDD mostly follows the Chicago school, I tend to think that Chicago style of TDD is 
best suited to dynamic languages.


--things to fix ---

Currently the user will be stuck at the end of the program. 
It would be possible to use DI here to inject the `splash_screen_controller`, as the `next_controller` 
to allow the program to restart.


I should probably break the `SearchScreenController` to two controllers.


I've partly violated layered architecture. As the `FrontController` interacts with stdout, 
I'd prefer if this was pushed further out.
This would allow the core of the application to be used in another input/output environment e.g. http. 


The `FrontController` and the `SearchScreenController` has state. 
This would need to change in a multithreaded environment, or when restarting the program.
It could be dealt with by re initialising the Dependency Injector.


I made my very own hand crafted object mapper. 
While it was interesting, I probably could have just used `ActiveModel` or other libraries.
