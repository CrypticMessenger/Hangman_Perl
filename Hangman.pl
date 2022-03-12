#!/usr/local/bin/perl

sub render_man{#rendering based on number of lifes left
(my $state) = @_;
if($state == 6){
    print '
    _________           
    |     |
    |   (^_^)
    |    
    |    
    -----------
';
}
elsif($state == 5){
    print '
    _________           
    |     |
    |   (-_-)
    |    
    |     
    -----------
';
}
elsif($state == 4){
    print '
    _________           
    |     |
    |   (O_O)
    |     |
    |     
    -----------
';
}
elsif($state == 3){
    print '
    _________           
    |     |
    |  (。_。)
    |    /|
    |     
    -----------
';
}
elsif($state == 2){
    print '
    _________           
    |     |
    |   (ಠ_ಠ)
    |    /|\
    |     
    -----------
';
}
elsif($state == 1){
    print '
    _________           
    |     |
    |   (T_T)
    |    /|\
    |    / 
    -----------
';
}
elsif($state == 0){
    print '
    _________           
    |     |
    |   (X_X)
    |    /|\
    |    / \
    -----------
';
}
elsif($state == -1){
    print '
             
     /|THANKS|\
    /__(^3^)___\
         |
        / \
    -----------
';
}
}

sub extract_words{
    (my $fileName,)=@_;
    open ( $fh, "<", $fileName );

    while ( $line = <$fh> ) { 
        chomp($line);
        $words=$words.$line;
    }
    close($fh);
    $words =~ s/[;""]//g ;
    $words =~ tr/|/ /;
    @dataBase = split(" ",$words);
}


$words="";
@dataBase=();
extract_words("database.txt");

#calculates number of words
$length = @dataBase;

#chooses a word randomly
$choose_word = int(rand($length));
$word = $dataBase[$choose_word];

#calculates length of word
$n =  length($word);

#answer is the word with corectly guessed characters
@answer = ("_") x $n;

#In hangman we have 6 lives
$life =6;

#total number of correctly guessed characters
$guessed = 0;

#all characters guessed by now.
$guesses = "";
print "Here is your Word : @answer \n";

#Game Starts
while($life>=0 && $guessed<$n){  
    if($life==0){
        print "The correct word was $word\n";
        render_man($life);
        last;
    }
    #renders image of hangman based on lives left.
    render_man($life);

    print "Guesses so far: $guesses \n";
    print "Lives left : $life\n";
    print "Make a guess: ";

    #input character
    $c = <STDIN>;
    $c = lc $c;
    chomp($c);
    if(length($c)>1){
        if($c eq $word){
            print "You got it!! You Won!! \n";
            render_man(-1);
            last;#ends game
        }
        else{
            print "Wrong guess!!\n";
            $life--;
            print "@answer \n";#penalize 1 life
        }
    }

    else{
        #loop to avoid entering a letter or a character that has already been entered.
        if(index($guesses,$c )!= -1){
            print "You have already guessed this character!!\n";
            print "Enter new valid character: ";
            print "@answer \n";
            next;#angain enter the character!!
        }

        $guesses =$guesses.$c;

        #decrease life by 1 if answer is incorrect
        if(index($word , $c)==-1){
            $life--;
        }

        #find all positions of the character input in the word and replace them by the character itself in answer array.
        else{
            while($word =~ m/[$c]/g)
            {
                # using pos() function
                $position = pos($word);
                $answer[$position -1 ] = $c;
                $guessed++;
            }
        }
        print "@answer \n";
        
        if($guessed == $n){
            print "You got it!! You Won!! \n";
            render_man(-1);
        }
        elsif($life == 0){
            print "HAHA!! You Lose!!\n";
            print "The word was $word\n";
        }
    }


}