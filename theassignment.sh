#!/bin/sh
redo=0
win=0
case $* in
  *-d*) # Debug Mode #
 echo "------------------
DEBUG MODE ENABLED
------------------"
  export debug=1;;
  *) export debug=0 # If no flags are detected, start game normally #
  echo "
                       
   ##   ##             
 ###### ##     ######  
   ##   ###### ##  ##  
   ##   ##  ## ######  
   ##   ##  ## ##      
   #### ##  ## #####   
                       
                                                                         
                        ##                                        ##    
  ##### ###### ######       ######  ###### ##  ## ###### ###### ######  
     ## ##     ##      ###  ##  ##  ##  ## ###### ##  ## ##  ##   ##    
 ###### ###### ######   ##  ##  ##  ##  ## ###### ###### ##  ##   ##    
 ##  ##     ##     ##   ##  ######  ##  ## ## ### ##     ##  ##   ##    
 ###### ###### ###### ######    ##  ##  ## ## ### #####  ##  ##   ####  
                             ######                                      
"
  sleep 1
esac

ask () {
    printf ">> "
    read -r "$1"
}
## GUI ##
_gui () {
    echo
    echo "Good decision. You are now in class sitting next to your friends and your teacher tells you to start researching what program you will use."; echo
    while :; do
    echo "Will you:
[a] Work hard for the entire time and make a good quality interactive fiction game.
[b] Decide to leave it to the last minute and spend your class time playing chess"
    ask re
    case $re in
    a) echo; echo "You made a high quality game with a good story and multimedia elements. You give yourself a pat on the back, and submit it. You are met with 95%, and are very happy with your assignment."; win=1; break;;
    b) _chess; break;;
    *) echo "Invalid response"
    esac
    done
}
    _chess () {
        echo
        echo "It is now the last week, and you realise that you probably need to do something now"; echo
        while :; do
        echo "Will you
[a] Rush through the project
[b] Copy a friend"
        ask re
        case $re in
        a) echo; echo "By Friday, you have a basic interactive fiction complete, and you submit it. You get 80%. While it isnt the best, it is a decent mark and you are happy with it."; win=1; break;;
        b) echo; echo "Bad move. You submit your shamelessly copied assignment, your teacher notices, and you get a fat 0. Should have made something yourself."; break;;
        *) echo "Invalid response"
        esac
        done
    }
_scratch () {
    echo
    echo "Good job, you are an idiot. Now, do you want to make:
    
[a] A traditional text adventure game
[b] A more simple interactive fiction
[c] A full game that still follows the basic structure of a text adventure while being multitudes more complex and difficult yet impressive."
    while :; do
    ask re
    case $re in
    a) echo; echo "You make a cool text adventure game, with commands, movement, items and a working inventory, and you are happy with it. You get a 95%. Good job!"; win=1; break;;
    b) echo; echo "You code a more basic interactive fiction, and get an 80%. You think to yourself 'Solid, but I could have done better'."; win=1; break;;
    c) _game; break;;
    *) echo "Invalid Response"
    esac
    done
}
    _game () {
        echo
        if [ $redo = 0 ]; then
            echo "That was a stupid move. While you are thinking about it, you have an idea to make a life simulation game. Now you need to choose what language you will write it in."
        fi
        echo "
Will you use:
[a] Python (You don't currently know much more than the basics, but to make a game this simple, it will be only a few hours of watching youtube tutorials. It will be easy to compile for Windows as well as your beloved Linux. This is probably the smartest option if you are insistent on making it a proper command line game)

[b] Make a POSIX compliant shell script. This would be an utterly stupid move, with the only benefits being ease (singe you already know how to make them), and compatability with all Unix-like OSes, even those that existed in the 70s and 80s. This notably does not include Windows, so you will need to waste time making a wrapper for Windows.

[c] HTML/CSS (You also already know how to make websites in pure HTML, and you will gain the nice bonus of being able to easy add media elements. It will result in a good looking and fun game while still being manual and somewhat challenging)."
        while :; do
        ask re
        case $re in
        a) _python; break;;
        b) _posix; break;;
        c) _html; break;;
        *) echo "Invalid response, try again"
        esac
        done
    }
        _python () {
            echo
            echo "You choose to make it in Python. Will you work on it during the holidays?

[a] Yes
[b] Nope"
            while :; do
            ask re
            case $re in
            a) echo; echo "Good choice. You continue learning and building during the holidays, and you get the basics of the game done in time for submission. You get a 100%, and are very happy with yourself."; win=1; break;;
            b) echo; echo "You failed to learn Python in time, and you got a 0%. You give up on all your dreams, and run away out of shame. On for first day as a missing person you decide to jog on the side of the highway and are quickly hit by a bus."; break;;
            *) echo; echo "Invalid response"
            esac
            done
        }
        _posix () {
            echo
            echo "Wow, you really do hate yourself. You spend your class time working on the base and then a Windows wrapper made with Git Bash. It is now the last week and you have realised that even though you have put so much time an effort into this project, there is no way to get it done on time. You are also getting an incredibly sore throat.
Will you:
            
[a] Cut your losses and reuse that original base to make a more basic text adventure game
[b] Refuse to go down without a fight and work on the game 24/7 without sleep so you can get it done before the due date of Friday.
[c] Say 'she'll be right' and sit on your butt for the rest of the week, maybe tweak it a little, and then submit the very unfinished game"
            while :; do
            ask re
            case $re in
            a) _bye; break;;
            b) echo; echo "You truly belive in the project, so you skip school and never sleep to spend all of the time until the due date working on it. By Thursday, your brain has completely stopped functioning and you collapse onto the floor. You wake up in a hospital bed, and are told that you have been in a coma for the last decade from the stress that you were under. The doctor tells you that now the Chinese government controls the entire planet, led by their new dictator Elon Musk, America and Russia are nuclear wastelands, and Australia is a warzone. You politely ask the doctor to kill you now, which they refuse on ethical grounds."; break;;
            c) echo; echo "You are unable to finish it in time, and you get a 40%. While it technically fills most of the requirements, there was nothing to do once in a life, it was really just a life creator. You proceed to cry yourself to sleep"; break;;
            *) echo "Invalid reponse"
            esac
            done
        }
            _bye () {
                echo
                echo "You say goodbye to your beloved git repository, vowing to return some day and finish it. You then proceed to stress for the next two days unable to think of a story for your interactive fiction. On Wednesday afternoon, your throat is now so sore that it is painful to talk, so you come to agreement with your parents that you will not go to school on Thursday. You decide that this is a good opportunity to work on your Multimedia assignment, and proceed to procrastinate all afternoon. You are about to fall asleep when some ideas pop into your head. You quickly jump up and boot up your laptop, to map out the story for one of them. 
Do you choose:
[a] A story about a home owner wanting to build a new house on the beach front
[b] Your story of working on this assignment"
                while :; do
                ask re
                case $re in
                a) _blank; break;;
                b) _win; break;;
                *) echo "Invalid response"
                esac
                done
            }
                _blank () {
                    echo 
                    echo "You spend the next hour staring at your computer screen, desperate to make this idea work, but you can't think of enough possible choices and outcomes. You decide to sleep on it, but when you wake up, the writers block returns. 
                    
Do you
[a] Return to the other idea (the story of working on this assignment)
[b] Keep trying to make this one work"
                    while :; do
                    ask re
                    case $re in
                    a) _win; break;;
                    b) echo; echo "You continue to suffer from writers block for the next 2 days, to the extent that you are driven insane. Your parents have taken you to an institution where you will spend the rest of your days staring at a wall"; break;;
                    *) echo; echo "Invalid response"
                    esac
                    done
                }
        _html () {
            echo
            echo "You realise that you cannot make this work well without a web server, and learning a lot of Javascript.

Will you
[a] Decide to choose a different language
[b] Give up
[c] Try to learn it anyway"
            while :; do
            ask re
            case $re in
            a) redo=1; _game; break;;
            b) echo; echo "You get a fat 0%. Your parents disown you, and you drop out of school. You then get a dead-end job where you will work at for the rest of your life"; break;;
            c) echo; echo "You fail to learn it in time and get a 0%. Your parents disown you, and you drop out of school. You turn to a life of crime which quickly catches up with you and you live your remaiing years in jail."; break;;
            esac
            done
        }
_win () {
    echo
    echo "This is a brilliant idea! Truly A grade worthy. You begin mind mapping the story of making your assignment, including all the decisions that you made, and include the endings that you think would have happened if you chose them at the time. You spend all of Thursday working on it, and then fill out the portfolio. You submit the assignment on Friday and are met with the praise and admiration of all of your classmates as well as your teacher. You get a 100%!"
    win=1
}

echo
while :; do
echo "You are sitting in your Multimedia classroom. Your teacher is standing up the front explaining your new assignment. 'You are going to have to make an interactive fiction game'. Ideas start rushing through your head. You always want to make projects in a way that are impressive and advanced, so you are imagining yourself coding the project from scratch. Now it is time for you to choose what you will do."
echo "
Will you:
[a] Start working on a simple interactive fiction game using a recommended, graphical program
[b] Do the 300 times harder option and code it yourself from scratch so its more impressive."
ask re
case $re in 
a) _gui; break ;;
b) _scratch; break ;;
*) echo "invalid response, try again"
esac
done

if [ "$win" = 1 ]; then
echo "
                                                           
                       #                            ###    
 ##   ## ####### ##   ##   ##   ## ###### ###  ##   ###    
 ##   ##      ## ##   ##   ## # ##   ##   #### ##   ###    
 ####### ##   ## ##   ##   #######   ##   ## ####   ###    
      ## ##   ## ##   ##   ### ###   ##   ##  ###          
 ####### ####### #######   ##   ## ###### ##   ##   ###    
"
else
echo "
'||' '|'  ..|''||   '||'  '|'    '||'       ..|''||    .|'''.|  |''||''| 
  || |   .|'    ||   ||    |      ||       .|'    ||   ||..  '     ||    
   ||    ||      ||  ||    |      ||       ||      ||   ''|||.     ||    
   ||    '|.     ||  ||    |      ||       '|.     || .     '||    ||    
  .||.    ''|...|'    '|..'      .||.....|  ''|...|'  |'....|'    .||.   
                                                                         
                                                                         
|''||''| '||'  '||' '||''''|      ..|'''.|      |     '||    ||' '||''''|  .|. 
   ||     ||    ||   ||  .       .|'     '     |||     |||  |||   ||  .    ||| 
   ||     ||''''||   ||''|       ||    ....   |  ||    |'|..'||   ||''|    '|' 
   ||     ||    ||   ||          '|.    ||   .''''|.   | '|' ||   ||        |  
  .||.   .||.  .||. .||.....|     ''|...'|  .|.  .||. .|. | .||. .||.....|  .  
                                                                           '|' 
                                                                               
"
fi
