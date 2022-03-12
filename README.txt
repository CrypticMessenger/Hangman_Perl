- To run the program use following command in terminal:
    - perl Hangman.pl

- you can guess a whole word(if it matches well and good and game ends), else hangman will lose one life as penalty.

- I have added above feature because in an example given by prof in lab assignment, this feature is allowed.

- You can guess numbers as well because there is a word in database i.e. "virus25".

-Special characters are allowed to provide flexibility, since you can add words and even sentences in database.txt.

- Other words can be added in database by just adding '|' and your word in database. for example adding "|smirk" to database.txt includes "smirk" as a word.

- don't repeat the already guesssed characters, else you have to reenter the character till you make 
a different guess.

-To provide more interactibility, hangman changes expression everytime you do a wrong guess.

-database.txt file contains all the words, it's copy-pasted as it was given in question paper,
I have used RegEx to convert it in usable form.

-Comments are given inside the code to explain the functionality of each line of code.

- "ENJOY THE GAME!!" ~ author

.
├── Hangman.pl
├── README.txt
└── database.txt