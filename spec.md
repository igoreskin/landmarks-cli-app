# Specifications for the CLI Assessment

Specs:

- [x] Have a CLI for interfacing with the application

The CLI interfaces with the application by interacting with the Landmarks::Landmark class, whereas
all the logic of the interaction between the Landmarks::Landmark class and Landmarks::Scraper class
is fully encapsulated in the instance and class methods of the Landmarks::Landmark class. First the CLI
assigns a property of the Landmark class called scraper (which is essentially a newly instantiated
object of the Scraper class, and we only need one object of this class) to a variable called scraper,
which then allows us to call an instance method of the Scraper class directly on this variable and to
scrape and print a numbered list of all our landmarks. After that, inside of the #start method defined
below, which contains the entire logic of the interaction between the program and the user, the CLI
is then calling reader instance methods of the Landmark class to display landmarks' properties at the user's
request. This design actually allows us to adhere to the principle of single responsibility in terms of
the CLI only interacting with the Landmark class - even the one and only object of the Scraper class is,
from the point of view of the CLI, just a property of the Landmark class.

- [x] Pull data from an external source

The first instance method in the Landmarks::Scraper class called #get_page returns the contents of the website
we are scraping in the form of a set of nested nodes. The following method in the same class called #scrape_landmarks_index
iterates through the return value of the previous method, instantiates new objects of the Landmarks::Landmark class
and uses the appropriate CSS selectors to scrape the data, which is then assigned to these objects as their properties.
It is worth noting that the principle of single responsibility is being adhered to here as well, since each method
in the Scraper class is on responsible for a single clearly defined action.

- [x] Implement both list and detail views

The logic of implementation of the list view is contained inside of the method called #call in the CLI class, where
the #print_the_title method is called on the scraper variable, which, being a property of the Landmark class,
actually is a newly instantiated object of the Scraper class assigned to the Landmark class as its property
in the form of a class variable and a reader method. The next method, #print_landmarks_index, is also called on the
same variable to print the numbered list of the landmarks. Although both #print_the_title and #print_landmarks_index
methods are instance methods of the Scraper class, from the point of view of the CLI they are called on the variable
representing a property of the Landmark class.

The detailed view of each landmark is implemented through two instance methods of the Landmark class, #description
(which provides a detailed description of the landmark selected by the user) and, if the user chooses so, #directions
(which in turn displays some useful information about the landmark, such as directions, business hours, possible
admission fees etc., if available). The entire logic of this process is encapsulated in the #start method of the CLI
class. The #start method then calls itself twice (if, after displaying either the description or the details of the
selected landmark, the user wishes to find out more about another landmark), and is therefore recursive.
