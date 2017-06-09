# Ruby 101

* [Overview](#overview)
* [A bit about Ruby](#a-bit-about-ruby)
* [Warm up](#warm-up)
* [Data types](#data-types)
* [Variables](#variables)
* [Control Flow](#control-flow)
  * [Loops](#loops)
  * [Conditionals](#conditionals)
* [Functions](#functions)
* [Arrays and Hashes](#arrays-and-hashes)
* [Class-based Object Oriented Programming (OOP)](#class-based-object-oriented-programming-oop)

## Overview

Ruby 101 will cover the following topics:

* A short introduction to Ruby
* Using the `ruby` and `irb` commands to execute Ruby code
* Arithmetic operations
* Data Types
* Variables
* Control Flow
* Functions
* Arrays and Hashes
* Class-based Object Oriented Programming (OOP)

## A bit about Ruby

Ruby is a high-level, general-purpose programming language. High-level means it doesn't require programmers to worry about low-level details of the machine (eg. things like memory access), so it's much easier for humans to read and write and understand. In other words, it abstracts away a lot of hardware-specific details that people who write software shouldn't have to care about (of note: abstraction is another favourite term of programmers). General-purpose means, you can use it to write programs across alot of different application domains, such as web applications, graphics programs, games, scripts, automation tools etc. This is in contrast to a language like Bash, which is used only to interact with the Bash shell.

Ruby is also an interpreted language, which means that whatever programs that you write in Ruby are run directly by the Ruby interpreter (the Ruby interpreter itself is just another program, again written by a bunch of smart people). You may have read about other languages (eg. C, or Java) that first need to be *compiled* to a lower-level code (byte code or machine code) before they can be executed.

One nice thing about Ruby is that it is very human-readable. Sometimes you can write Ruby code that even reads like English, and they say that Ruby is optimized for programmer happiness. All in all, this makes Ruby an ideal language for beginners.

Here is what Yukihiro Matsumoto, aka Matz, the creator of Ruby, [has to say](http://www.artima.com/intv/rubyP.html):

>Instead of emphasizing the what, I want to emphasize the how part: how we feel while programming. That's Ruby's main difference from other language designs. I emphasize the feeling, in particular, how I feel using Ruby. I didn't work hard to make Ruby perfect for everyone, because you feel differently from me. No language can be perfect for everyone. I tried to make Ruby perfect for me, but maybe it's not perfect for you. The perfect language for Guido van Rossum is probably Python.

Ruby ain't perfect, but it sure feels good to me :D

## Warm up

Okay, enough talking about Ruby, let's *do* some Ruby. Again, we start with the traditional Hello World. Open up a new file in your text editor (you can use Cloud9's graphical interface to create the new file. Or, even better, use the commandline ;)). Add the following:

```ruby
puts "Hello World"
```

and save the file as `hello_world.rb`. We just wrote a Ruby program!
Now how do we run it?

From the commandline, check that your current working directory is the same as the directory you saved `hello_world.rb` in. If it isn't, you should know how to change it! Then:

```bash
$ ruby hello_world.rb
```

You should see `Hello World` output on your screen. Not bad, eh? Note that we invoked the `ruby` command to run our program. Remember, commands are just a bunch of programs (sometimes also called *binaries*, or *executables*. All this terminology is confusing, I know!) sitting somewhere on your computer. If you're wondering where they're located, you can use the `which` command:

```bash
$ which ruby
```

While we're at it, why not check out `ruby`'s manpage? It gives you a nice and concise introduction to the Ruby language too:

```bash
$ man ruby
```

> **Extras**
> You can play around with the `whereis` command too
> Try `whereis ruby`. Compare the results with `which ruby`
> Try and read the manpages of `whereis` and `which` and see if you can understand the difference

Writing your code to a file and using the `ruby` command to run it isn't the only way to execute Ruby code though. We can also play around with Ruby inside it's *interactive shell*. This shell is slightly different from the Bash shell we've been learning however (confusing terminology again, I know; remember that at the end of the day *shell* is just a generic term for a user interface to the computer). It is also called a *Read Evaluate Print Loop*, or REPL for short. As the name suggests, it reads whatever input you give it (some Ruby code, which we call an **expression**, say `1 + 1`), evaluates it (say, to `2`), prints that value to screen, then repeats this over and over again....FOREVAAAA (ok, ok, until you choose to close it).

Let's fire up Ruby's interactive shell:

```bash
$ irb
```

You should now see the `irb` prompt, something like:

```
2.3.0 :001 >
```
The number `2.3.0` in front is actually your Ruby *version number* (programs like Ruby are improved upon over time, and are released at various stages and given a version number). Let's try the `1 + 1` example I gave:

```
2.3.0 :001 > 1 + 1
```

Notice how Ruby prints the result after a `=>`.

Now let's try Hello World in `irb`:

```
2.3.0 :001 > puts "Hello World"
```

Oooh, what happened here? We got `Hello World` printed to screen like when we ran `ruby hello_world.rb`, but `irb` also seems to give us a `nil`. What does this mean? This example actually illustrates the important difference between *the value of an expression* and *printing things to screen (STDOUT)*. I find this to be a very common point of beginner confusion, so pay attention!

When we typed `puts "Hello World"` into `irb`, it evaluates this line of code. What exactly does `puts "Hello World"` do? Well, it looks almost exactly like the `echo "Hello World"` Bash command we used before, and indeed, conceptually it is similar. Except in Ruby, and most other programming languages, we don't call them commands, we call them *functions*. While in Bash we invoked the `echo` command and passed it a `"Hello World"` argument, in Ruby we invoke the `puts` function and pass it the `"Hello World"` argument. The `puts` function, like the `echo` command, takes this argument and prints it to screen. Which is why when `irb` evaluates our `puts "Hello World"`, we get `Hello World` printed to screen.

But what about the extra `nil`? Now, *every expression in Ruby is evaluated to some value*, and *this is different from the value that `puts` outputs to the screen*. The value of `puts "Hello World"` turns out to be `nil`, which is why we see the `nil` being printed in `irb`. When we ran `ruby hello_world.rb`, we didn't see any `nil` printed to screen, because while the `ruby` command evaluates your code, it doesn't print anything unless you specifically ask it to print something, by using the `puts` function. Remember, the reason why `irb` prints the `nil` is that it is a Read Evaluate **Print** Loop.

Okay, maybe you just got more confused. But the key takeaway is this: *the value that a line of code (expression) evaluates to is different from whatever you print to screen*. Keep this in mind for now, it will become clearer when we talk about functions (and write some of our own!)

> **Sidenote: function vs command**
> From my description above, you may think that functions and commands are no different.
> Not quite. Typically Bash commands are separate programs that are executed by your shell as another process.
> (of course some commands are shell builtins, in which case they are not executed in another process)
> Functions, on the other hand, are just blocks of code, identified by a name, that can be reused in your program.
> We do this by *invoking* a function, using its name like we did with `puts`.
> Functions are not separate programs that are run as separate processes like external Bash commands.
> You use them in your own program, and your whole program runs as a single process.

Okay, before we get ahead of ourselves with functions and everything, let's play around with `irb` a little more. `irb` is a very handy learning tool, because it allows you execute little snippets of Ruby code and get immediate feedback on what they do. At the end of the day, when you write a proper Ruby program, you will invariably write it in a file and execute it with `ruby`, but `irb` is still very useful for when you're not sure about the behaviour of a bit of code and want to test it out quickly.

In other words, as a beginner, `irb` is your friend. Learn to use it and love it!

Let's explore some of Ruby's arithmetic operators. We use `*` for multiplication:

```
2.3.0 :001 > 5 * 4
```

`**` for taking powers:

```
2.3.0 :001 > 5 ** 2
```

`/` for integer division:

```
2.3.0 :001 > 5 / 2
```

Note how I said *integer* division. What we get is basically the quotient. What if we want the "exact" value? We have to make sure our operands are not all integers:

```
2.3.0 :001 > 5.0 / 2
```

When we put the `.0` after the `5`, it becomes something called a *float*. A float is a *data type* that allows us to store numbers with decimal places (more on data types later!).

Of course we can use `-` for subtraction:

```
2.3.0 :001 > 5 - 2
2.3.0 :001 > 5.0 - 2
```

Note the slight difference in the result of the two lines. For one of them we got `3` (an integer), for the other we got `3.0` (a float), because we used `5.0` which is also a float. You can see that the result returned is the more "general" of the two number types (floats are more general than integers).

You can sort of "add" and "multiply" strings like `"Hello World"` as well (more strictly, it's called string concatenation):

```
2.3.0 :001 > "Hello World!" + " TechLadies is fun!"
2.3.0 :001 > "I love Ruby <3 " * 5
```

It doesn't work the other way, however:

```
2.3.0 :001 > 5 * "I love Ruby <3 "
```

You just saw your first error in Ruby! Remember it well, because part of being a good programmer involves knowing how to debug (root out and fix the errors in) your code. Debugging is a skill, and part of that skill involves knowing how to read error messages.

Alright, that's enough for warmup. To quit `irb`, use `Ctrl-D`. (Why not `Ctrl-C`, you may wonder? Well, I guess the people who wrote `irb` decided to *trap* the SIGINT (interrupt signal, remember!) that `Ctrl-C` issues, and overwrite the default behaviour of exiting the process)


## Data types

Computer programs need to store and manipulate data. Utlimately, all data is stored on disk as a bunch of 1's and 0's. How is your program supposed to know what those 1's and 0's mean? In other words, how does your program know how to interpret that bunch of 1's and 0's?

It does this by using data types. Some basic data types in Ruby include:

* Integers (eg. `5`)
* Floats (eg. `5.0`)
* Strings (eg. `"Hello"`)
* Symbols (eg. `:Hello`)
* Arrays (eg. `[1, 2, 3]`)
* Hashes (eg. `{"a" => 1, "b" => 2}`)
* Nil (ie. `nil`)
* Booleans (eg. `true` and `false`)

Try playing around with different data types in `irb`. Familiarize yourself with the syntax used to represent these *literals* (a notation for representing a fixed value, like a number, or a sequence of characters in a string).

You may be wondering, is there a way I can check what type my literal values are, instead of just having to remember that "a string must be surrounded by double quotes, or arrays must have two square brackets, or floats must have a decimal point"? Yes! We do this with something called the *`class` method*:

```
2.3.0 :001 > "Hello".class
2.3.0 :002 > 5.0.class
2.3.0 :003 > 5.class
2.3.0 :004 > true.class
2.3.0 :005 > ["a", "b", "c"].class
2.3.0 :006 > {a: 2}.class
2.3.0 :007 > :hello.class
```

(Note: with `5.class` you will get `Fixnum`. This is a bit of an implementation detail, but at the end of the day `Fixnum` basically means an integer type)

Play around with various literals and use the `class` method to inspect their type!

## Variables

Okay, we've got an overview of the basic data types, but how do we store data and manipulate them in our programs? Enter *variables*. The analogy I like to use is that these things are pet octopuses (or octopi, whichever you prefer) with names, and one of their tentacles is gasping some value. So for instance:

```
2.3.0 :001 > x = 10
```

[!variable octopus](./images/variable-as-octopus.jpeg)

What this does is ask octopus `x` to hold on to the value `10`. The `=` sign here is different from the `=` sign in math, which indicates *equality*. In math we write things like `1 + 9 = 10` which means that the left-hand side and the right-hand side have the same value. Not so in programming. In virtually all common programming languages, the `=` sign is an *assignment operator*. We read `x = 10` not as "x equals 10" but as "assign the value 10 to the variable x" or "assign the variable x with the value 10", or, to repeat my analogy, "ask octopus x to hold onto the value 10".

So now if you type `x` into `irb`, `irb` will print the value stored in the variable:

```
2.3.0 :002 > x
=> 10
```

What happens if you try typing in some other random name?

```
2.3.0 :002 > y
=> NameError: undefined local variable or method `y' for main:Object
n>'
```

You get this error because you never before defined a variable named `y` and assigned it any value. As far as Ruby is concerned, it knows only of one octopus, and that octopus is called `x`. To remedy this, you can assign something to `y`:

```
2.3.0 :002 > y = "Variables are fun!"
```

If you check the value of `y`, you will get `"Variables are fun!"`

Now you can use your variables to do stuff with the values:

```
2.3.0 :003 > x + 5
=> 15
2.3.0 :003 > x / 5
=> 2
2.3.0 :003 > x += 1
=> 11
2.3.0 :003 > y * 3
=> "Variables are fun!Variables are fun!Variables are fun!"
```

Seems simple enough, but variable assignment is actually more tricky than it looks. With your mental imagery of how variable assignment works (as octopuses grabbing onto values), think about what the following means:

```
2.3.0 :001 > x = 15
```

Here is what happens graphically:

[!variable octopus](./images/variable-reassignment.jpeg)

Now we reassign `x`, and assign `x` to `y`:

```
2.3.0 :001 > x = "Hello World"
2.3.0 :002 > y = x
```

Again, here it is graphically:

[!variable octopus](./images/variable-reference-2.jpeg)

Pay attention, there's something very subtle but important going on here. Notice how I didn't draw two `"Hello World"` strings for octopuses `x` and `y` to hold on to. There is only *one* `"Hello World"` string, and both octopuses **are holding on to the same one**.

This is a very important thing to get right in your mental model of variables. Why? The explanation is going to get a bit involved, so bear with me.

Now, Ruby has two ways of making a string lowercase: `downcase` and `downcase!`. The only difference is the exclamation mark. How confusing! You might think at first glance that they do exactly the same thing:

```
2.3.0 :001 > "Hello World".downcase
=> "hello world"
2.3.0 :002 > "Hello World".downcase!
=> "hello world"
```

Looks exactly the same here. But there is actually a very important difference: `downcase` creates a *new string*, copied from the original string, but makes all the letters lower case, while `downcase!` *changes, or mutates, the original string in place*. Not concrete enough? Imagine: your string is just a bunch of 1's and 0's somewhere in your computer memory. With `downcase`, your computer finds another place in memory, copies that bunch of 1's and 0's there, then changes them so that the new string is all lowercase. Your original string is *left untouched*. With `downcase`, your computer finds your original string, and *modifies its bunch of 1's and 0's directly*.

[!downcase!](variable-downcase-2.jpeg)
[!downcase](variable-downcase-1.jpeg)

We can see the difference most clearly when we assign our string to variables:

```
2.3.0 :001 > x = "Hello World"
2.3.0 :002 > y = x
```

Remember, this is the picture we had:

[!downcase](variable-reference-2.jpeg)

Now, remember we can use our variables to refer to the values we assigned them, so let's try making our `"Hello World"` string lowercase. Let's try it with `downcase`

```
2.3.0 :003 > x = x.downcase
2.3.0 :004 > x
2.3.0 :005 > y
```

[!downcase octopuses](variable-downcase-3.jpeg)

Now with `downcase!`:

```
2.3.0 :003 > x.downcase!
2.3.0 :004 > x
2.3.0 :005 > y
```

[!downcase! octopuses](variable-downcase-4.jpeg)

See the difference? If you understood that easily, congrats! If not, mull it over, practice programming some more, return to this section, and see if you can make sense of it. It's a tricky concept.


> **Extras**
> If you really understood what was going on, you should be able to  explain this:
> What if, in the first example using `downcase`, we didn't do `x = x.downcase`, but just `x.downcase`?
> What would be the value of `x`? Or `y`?

One last thing before we end this section of variables. **Choosing good variable names is a very important part of programming**. Naming your variables well can make your code much more clear and understandable to other people (including your future self). So far I've been using very generic variable names like `x` and `y` but that's because we're only toying around with the language and not writing anything substantial. When we start writing more complex programs, we must start naming our variables sensibly. No one wants to deal with code that has a bunch of `x`, `y`, `z`'s or `a`, `b`, `c`'s all over the place. Those names tell you *absolutely nothing* about what the variable is supposed to store, and make debugging your code significantly harder. Good programming is about good communication, and you communicate through your code.

## Control Flow

Consider a game of TicTacToe. How would you write a program to play the game? You have to somehow formulate the rules of the game into programming constructs. You know that players take turns, so somehow your program has to alternate between accepting input from one player to the other. You know you should keep accepting player input until the game ends, so that suggests your program has to loop somehow. You know you need to check whether the game has ended (either the win condition has been met, or all the slots are filled up), so your program knows when to stop.

What I've outlined here is how to take a big problem (program a game!) and break it down into smaller, more manageable components (accept player input in a loop, check for end game condition). Programming involves a lot of this kind of problem-solving ability. Once you've broken down your problem, you realize that what you want to do is basically *control the flow of your program*. Graphically, you want something like this:

How do we translate this flowchart into a Ruby program? Ruby gives us several control flow structures, which map to the two main control flow structures which we've identified from the flowchart -- loops and conditionals. Let's take a look at them in detail.

### Loops


What can be slightly confusing is that Ruby often offers different ways of doing the exact same thing. Sometimes one of the ways may prove to be more flexible than the other, or more suitable under the given circumstance, but a lot of times it also boils down to personal taste. For example, we can write a program that loops indefinitely (you can try this out directly in `irb`, or save it to a file and execute it with `ruby`):

```ruby
loop do
  puts "Infinite loop MUAHAHHAHHAHA!"
end
```

(Yay! You just wrote a program that never ends!!! Uh-oh, but how do you quit? Well, `Ctrl-C` to tame the beast.)

And this is a completely equivalent way of writing an infinite loop:

```ruby
while true do
  puts "Inifinite loop MUAHAHAHAHAHA!"
end
```

Now consider the general form of a `while` loop (this is pseudocode; it won't run properly):

```ruby
while some_condition do
  # do some stuff
end
```

A `while` loop means you loop while `some_condition` is `true` (that's a Boolean value, remember? `some_condition` evaluates to a Boolean value). If do `while true`, `some_condition` is always `true`, so it loops forever.

Usually, however, we don't want to loop forever. Imagine the drudgery of a TicTacToe game that never ends! Which is why we will usually specify some *condition* for *breaking* out of the loop. Say we are writing a program for a super simple game called Roll the Die (yes, it's way more boring than TicTacToe, and yes, I just made that up). Here is how the game is played:

* Every turn the player rolls a die
* If she rolls a 6, she wins and the game ends

Okay, it's a pretty lame game, the player can never lose, but let's see how we can program it (note, in Ruby, comments are started with a `#`. Any words behind the `#` are not evaluated/ignored by the interpreter):

```ruby
# with `loop`
loop do
  num = Random.rand(6) + 1
  puts "You rolled #{num}"
  break if num == 6
end

puts "You won!"
```

Let's tackle that line by line.

1. We start with the `loop do` statement
2. We generate a random number between 1 and 6 inclusive. We are using the `rand` method from Ruby's `Random` class to this for us. But `Random.rand(6)` generates random numbers from 0 to 5 (we give it the argument 6 to specify the max, but the range *does not* include the max), so we need to add 1
3. That line looks a bit strange. We seem to be printing a string with `puts`, but there's the funny `#{num}` thing in there. What you're looking at is something called *string interpolation*. The variable `num` stores some value, and I want to construct a string with that value in it. The `"You rolled #{num}"` syntax interpolates the variable `num` into the string, so that if, say, `num` has the value of `2`, the string would evaluate to `"You rolled 2"`. and that is what would be printed to screen
4. This line actually reads a lot like English doesn't it? Basically it says: "Break out of the loop if my `num` variable has the value `6`". Note how we are using the `==` sign. Beginners always tend to confuse `=` and `==`. These are very different things. `=`, as we have learnt, is an *assignment operator*, while `==` is an *equality comparison operator*. (It is part of a class of operators that return a Boolean value. These are variously called boolean, comparison, or logic operators)

How would this look with a `while` loop?

```ruby
# with `while`
# remember we need to define the `num` variable first
# so we just initialize to some number that is not 6
num = -1

while num == 6 do
  num = Random.rand(6) + 1
  puts "You rolled #{num}"
end

puts "You won!"
```

It's almost exactly the same, except we need to define `num` before we execute the loop (you can try and see what would happen if you didn't), and the looping condition is in a different position.

That's the most important thing about `loop` and `while` loops, really: the looping condition. How does it know when to stop? If you can grasp this logical flow, you've got loops under your belt.

But other than looping indefinitely and stopping on some condition,  we often want to loop a fixed number of times. For example, I want to write a program that will simulate every pariticipant in this workshop playing Roll a Die (yes, as a workshop instructor it is my prerogative to torture attendees ;)). We can do this with the `times` method. Say there are 60 of you:

```ruby
num_participants = 60

num_participants.times do |i|
  loop do
    num = Random.rand(6) + 1
    puts "Participant #{i} #{num}"
    break if num == 6
  end

  puts "Participant #{i} won!"
end
```

Basically, this says, for 60 times, play a Roll the Die game (notice, it's a loop within a loop, because the Roll a Die game involves a loop itself).

Note how we have the funny `|i|` thing there. Actually the `do...end` construct in Ruby is something called a *block*. These blocks sometimes take arguments (just like how the function `puts` takes the argument `"Participant #{i} rolled #{num}"`), and we put these arguments between the `|`. In this case our block only takes one argument `i`. What exactly is this `i`? Whenever you're not sure, always test things out. Let's simplify things a little:

```ruby
10.times do |i|
  puts i
end
```

We see that in each *iteration* of the loop `i` takes a different value, going from `0` to `9`. Why not `1` to `10` you may ask? Well, it just happens to be a convention in most programming languages to start at 0 and end *just before* the value specified, ie. non-inclusive (same thing as the `Random.rand(6)` we saw just now)

One last comment before we move on from loops: what we've worked through is a miniature example of how we build up more complex programs from smaller components. It's like piecing together lego bricks to form a column, and then putting four lego columns and a roof together to form a house. You will be doing this all the time when programming.

### Conditionals

We actually jumped ahead of ourselves just now and already looked at conditionals in loops. But let's treat them more thoroughly here. We already saw the `if` statement. There are actually two ways of writing it:

```ruby
enjoying_myself = true

# First way
puts "Awesome workshop!" if enjoying_myself

# Second way
if enjoying_myself
  puts "Awesome workshop!"
end
```

When to use one over the other? The first one is more concise, but sometimes we need to execute more than one statement after that condition. That's when we would use the second form:

```ruby
num_enjoyed_workshops = 1
enjoying_myself = true

if enjoying_myself
 num_enjoyed_workshops += 1
 puts "Awesome workshop no. #{num_enjoyed_workshops}!"
end
```

Other than `if`, Ruby also gives us `unless`. Again, it's behaves pretty much the way you use it in English -- it's the logical opposite of `if`:

```ruby
not_enjoying_myself = false

puts "Awesome workshop!" unless not_enjoying_myself

unless not_enjoying_myself
  puts "Awesome workshop!"
end
```

When to use one over another? Again, it's sometimes really up to personal taste, and which one you think reads more nicely.

Let's look at one more control flow structure: the `if...elsif...else` tree:

```ruby
x = 10

if x > 10
  puts "x is greater than 10"
elsif x == 10
  puts "x is equal to 10"
else
  puts "x is less than 10"
end
```

Here is how it looks like graphically:

[!if-elsif flowchart](./images/if-elsif-complete.png)

Notice there are three *conditional branches*, that's why I call it a tree. In this case, our tree covers the space of all possible outcomes (whatever the value of `x`, our program will always go into one of the branches). This is because the `else` clause captures all the other cases of `x` that don't fulfill the first two conditions.

Our conditional tree may not always cover the space of all possible outcomes, however:

```ruby
x = 10

if x > 10
  puts "x is greater than 10"
elsif x < 10
  puts "x is less than 10"
end
```

[!if-elsif flowchart](./images/if-elsif-incomplete.png)

Now let's use our fancy new knowledge to spruce up Roll a Die a little. Well-designed games should have just the right amount of uncertainty to keep players excited. No one wants to play a game that they know they will always win. With that in mind, let's make sure our players will lose the game if they roll a 4 (in deference to Chinese superstition, since 4 in most Chinese languages is a homophone of the word for 'die'. Guess it's time to rename our game....Roll, and DIE ;) ):

```ruby
loop do
  num = Random.rand(6) + 1
  puts "You rolled #{num}"

  if num == 6
    puts "You win!"
    break
  elsif num == 4
    puts "You DIE...!!!!"
    break
  end
end
```

> **Extras**
> Try to spice things up even more.
> Modify the code so that players have to proclaim their love for Ruby to world if they roll a 2 (but the game should go on)

## Functions

With our basic knowledge of variables and control flow structures, we're ready to start writing functions. What are functions? They're just several lines of code grouped together under one name, which we can later *call* from anywhere. Try running the following:

```ruby
def add_one(x)
  result = x + 1
  return result
end

puts add_one(10)
```

Basically, we defined a function named `add_one` which contains two lines. Take note of the syntax: we start with a `def`, then the function name, and brackets containing the function *parameters*. Finally we denote the end of the function body with `end`. After defining our function, in the last line of the snippet, we are *calling*, or *invoking*, the function, using its name, and passing it an *argument*. When you call a function, it *returns* a value. In this case, it returns the value `11`, so the `puts add_one(10)` statement becomes `puts 11`, and we see `11` printed to screen.

What happens when you call a function, is that whatever is inside the function body gets executed. The parameters that a function take are just variables, so when you called the function, you passed the value 10 to octopus x, and inside the function, you do something with octopus x.

> **Sidenote: the `return` statement**
> Yes, of course, that function could really just have had one line.
> But I wanted to break it down bit by bit.
> Also, in Ruby, the `return` statement isn't actually necessary in this case, because Ruby implicitly returns the value the last line of the function evaluates to.

Why do we need functions? Because they allow us to group logical units of computation together and reuse them elsewhere, reducing duplication in our code. The function name also serves to describe what the bunch of code contained in it does, making your code more readable. In other words, functions allow us to create *abstractions*.

Okay, that might have been a bit too abstract. How about this: let's try to use functions to *refactor* our Roll, and DIE game ("refactor" is just a fancy term for "modify our code to make it better"). Looking at it now, the loop is getting slightly bulky. Let's see how we can break it down into smaller components. When I think about it, the `if..elsif` part looks like a prime candidate for moving into a function. What that part basically does is check for the end game condition, so let's name our function accordingly:

```ruby
def game_end?(num)
  if num == 6
    puts "You win!"
    return true
  elsif num == 4
    puts "You DIE...!!!!"
    return true
  end

  return false
end

loop do
  num = Random.rand(6) + 1
  puts "You rolled #{num}"
  break if game_end?(num)
end
```

You may be thinking, "Okay, so you just moved a bunch of code to another place. But you still ended up with more lines. How is that an improvement?" Well, we actually gained quite a bit by *encapsulating that conditional logic in a function* -- the end game logic is now reusable, and our program is now *more descriptive*. Instead of just seeing a bunch of `if...elsif` statements, we can very clearly see the *semantics*, or the *meaning* of our program -- we roll a dice, then check for the end game condition. Furthermore, isolating that logic in a function of its own makes it easier for us to improve our program in the future. For instance, say now I want to write variations of the game which have different win and lose conditions. We can modify our `check_end_game` function like so:

```ruby
def game_end?(num, win_num, lose_num)
  if num == win_num
    puts "You win!"
    return true
  elsif num == lose_num
    puts "You DIE...!!!!"
    return true
  end

  return false
end
```

Then we can write two different games with different end game conditions:

```ruby
# Game 1
loop do
  num = Random.rand(6) + 1
  puts "You rolled #{num}"
  break if game_end?(num, 6, 4)
end

# Game 2
loop do
  num = Random.rand(6) + 1
  puts "You rolled #{num}"
  break if game_end?(num, 1, 2)
end
```

> **Sidenote: naming functions**
> Notice how we name the function `game_end?` with the question mark behind.
> This is a Ruby convention to indicate that the function returns a boolean value (true or false).
> We usually do this when we expect to use the function in an `if` or `unless` condition, to make it read like English.

Now, if I want to make all of you play multiple variations of Roll, and DIE, maybe I should put the whole game into its own function:

```ruby
def roll_and_die(win_num, lose_num)
  loop do
    num = Random.rand(6) + 1
    puts "You rolled #{num}"
    break if game_end?(num, win_num, lose_num)
  end
end

num_participants.times do |i|
  roll_and_die(6, 4)
  roll_and_die(1, 5)
  roll_and_die(2, 3)
end
```

This is much better then repeating that big fat loop three times! In the end, with some more small improvements, we might end up with something like this:

```ruby
# a function to roll a die with `n` sides
def roll_die(n)
  Random.rand(n) + 1
end

# note: the if..elsif..end statement evaluates to `nil`
# so if we neither win nor lose, the function will return `nil`
# `nil` acts like `false` in conditional expressions
# it is a so-called "falsey" value
# that is why we can omit the `return false` from the last line
def game_end?(num, win_num, lose_num)
  if num == win_num
    puts "You win!"
    return true
  elsif num == lose_num
    puts "You lose!"
    return true
  end
end

def roll_and_die(n, win_num, lose_num, name)
  loop do
    num = roll_die(n)
    puts "#{name} rolled #{num}"
    break if game_end?(num, win_num, lose_num)
  end
end

num_participants = 60

num_participants.times do |i|
  roll_and_die(6, 6, 4, i)
  roll_and_die(20, 15, 9, i)
  roll_and_die(30, 21, 17, i)
end
```

> **Extras**
> Now that you know about functions, and you know that functions always return some value, you may want to return to that question of `puts "Hello World"` in `irb`.
> You should understand now why `irb` prints a `nil` for us. Even though `"Hello World"` is printed to screen, the `puts` function *returns* `nil`.
> `irb` is printing this return value

## Arrays and Hashes

We encountered arrays and hashes very briefly in the data types section. These are actually very useful and important data structures that deserve a bit more of our attention. We use arrays to store a sequence of values. The values can be of any type:

```ruby
# array of all strings
cast = ["Jun Qi", "Ruby", "Terminal", "Bash", "cat", "curl", "variable octopus"]

# access array elements with the array[index] syntax
# note that arrays are zero-indexed!
puts "Your coach today is #{cast[0]}"

# you can use negative indices to start counting from the end
puts "I'm sure you've met #{cast[-1]}"

# array of arrays
# we can use this to represent points on a graph
# where each point has (x, y) coordinates and a color
points = [[1, 2, "red"], [4, 4, "blue"], [3, 7, "yellow"]]

# we can access nested arrays too
puts points[1][2]
```

We can loop over arrays:

```ruby
players = ["Jun Qi", "Kate", "Elisha", "Wei-liang", "Michael", "Daniel", "Tong Wei"]

players.each do |player|
  roll_and_die(6, 6, 4, player)
  roll_and_die(20, 15, 9, player)
  roll_and_die(30, 21, 17, player)
end
```

Hashes allow you to store *key-value pairs*:

```ruby
# a hash to store the color name
# and its corresponding hexadecimal value
# the keys of this hash are symbols
colors = {
  red: "#ff0000",
  green: "#00ff00",
  blue: "#0000ff",
}

# we can use numbers as hash keys too
weekdays = {
  1 => "Monday",
  2 => "Tuesday",
  3 => "Wednesday",
  4 => "Thursday",
  5 => "Friday"
}

# you cannot have duplicate keys, but you can have duplicate values
prices = {
  milk: 3,
  bread: 3,
  butter: 2
}

# we access hash values by the hash[key] syntax
puts prices[:milk]
puts weekdays[1]
```

Just as we can have arrays of arrays, we can have hashes of hashes! For example, let's say we not only want to store our player names, but also messages when they win and lose:

```ruby
players = {
  "Jun Qi" => {win: "...", lose: ";("},
  "Kate" => {win: "Aha!!!", lose: "Adoh!"},
  "Elisha" => {win: "Cats!", lose: "Rats!"},
  "Wei-liang" => {win: "Yesss", lose: "Nooo"},
}

# modify our game_end? function
def game_end?(num, win_num, lose_num, msgs)
  if num == win_num
    puts msgs[:win]
    return true
  elsif num == lose_num
    puts msgs[:lose]
    return true
  end
end

def roll_and_die(n, win_num, lose_num, name, msgs)
  loop do
    num = roll_die(n)
    puts "#{name} rolled #{num}"
    break if game_end?(num, win_num, lose_num, msgs)
  end
end
```

## Class-based Object Oriented Programming (OOP)

This is a GIGANTIC topic which I can hardly do any justice to in the space of this workshop. I can only hope to impart onto you a basic familiarity, and even if you struggle with the syntax a little, I hope I can get the fundamental concept across.

Other than being interpreted, general-purpose, high-level, optimized for programmer happiness etc., Ruby is also a highly **object-oriented** language. What does that mean? Object orientation is a *programming paradigm*, a way of thinking about programming, a way of modelling our problems.

We treat the world as a bunch of objects. Objects have two important things: *attributes and methods*. Or you can think of them as *state and actions*. For example, a dog has several attributes like hair color, weight, and fur length, and it can do things like bark, and eat food.

Now here's how we represent this in Ruby code:

```ruby
class Dog
  # we define are attiributes, also called instance variables,
  # in the `initialize` function
  def initialize(fur_color, weight, fur_length)
    @fur_color = fur_color
    @weight = weight
    @fur_length = fur_length
  end

  def bark
    puts "Woof, woof! I'm a dog with #{@fur_length} #{@fur_color} fur. I weigh #{@weight}kg."
  end

  def eat(amount)
    @weight += amount
  end
end
```

Ruby's object-orientation is *class-based*. Meaning, we use classes to define the attributes and methods that our objects have. What is a class? You can think of it as a *data type*, a category of things. While Ruby already defines basic types like `String`, `Array`, `NilClass` and so on, you can add your own *custom types*, or classes, to this list. In the snippet above, we defined a new class called `Dog`.

Inside the class body (between the `class Dog` and `end` lines), we specify the attributes and methods that dogs should have. Let's talk about methods first -- *methods are just functions, but they are functions that belongs to an object*. Or, they are *functions defined inside a class body*. Which means we have three methods here: `initialize`, `bark`, and `eat`.

We know we should have `bark` and `eat`, but what's with `initialize`? `initialize` is a special method we define to *set up (initialize) the state, or attributes, of our object*. `initialize` is taking some arguments, and setting the attributes `@fur_color`, `@weight`, and `@fur_length` to the values passed in as arguments. Note that you must have the `@` sign in front of your attribute names. Attributes here are more specifically called **instance variables**. These instance variables store the state of our object, so we can access them in any of our methods. So, for example, when our dog eats something, we increase `@weight` by the amount it eats.

Now that we have defined our class, how do we use it? We use our class to *instantiate* an object. Remember, `Dog` is a general category, some abstract thing in the clouds. We want to create a living, breathing **instance** of a dog. We do that with the `new` method:

```ruby
doge = Dog.new("orange", 8, "short")

# doge will tell us about himself
doge.bark

# doge will eat foodz
doge.eat(1)

# doge will show us how he gained weight
doge.bark
```

We just created a new `Dog` instance and assigned it to the variable `doge`. Now we can use *dot notation* to *call methods on doge*.

Of course, we can create another instance of dog, with different attributes:

```ruby
chihuahua = Dog.new("white", 2, "long")

# all instances of Dog have the same methods!
chihuahua.bark
chihuahua.eat(0.2)
chihuahua.bark
```

Now, what if we want to access the individual attributes of a dog? Right now, we only can see their values when we use the `bark` method. To do this, we can define methods that return the value of the attribute:

```ruby
class Dog
  # all the stuff we wrote just now...

  def fur_color
    @fur_color
  end

  def weight
    @weight
  end

  def fur_length
    @fur_length
  end
end
```

These methods are generally called *getters*, because we are getting the value of the object's attributes. Now we can do:

```ruby
puts doge.fur_color
puts doge.fur_length
puts doge.weight
```

Another thing we might want to do is change the value of the attributes directly. We can define special methods for this, called *setters* (because we are setting the value of the attribute):

```ruby
class Dog
  # all the stuff we wrote just now...

  def fur_color=(new_color)
    @fur_color = new_color
  end
end
```

Notice how we must have `=` at the end of the method name. Now we can do:

```ruby
# yes, one can only imagine how the poor doge would look
doge.fur_color = "blue"
puts doge.fur_color
```

> **Extras**
> Writing getter and setter methods are such common patterns that RUby gives us a shortcut for doing this
> Go and read up on `attr_reader`, `attr_writer` and `attr_accessor`

Okay, that's enough about basic syntax and concepts. Let's return to our Roll, and DIE game, and see how we can refactor it using classes and OOP!

It may not be as obvious as the `Dog` example what our attributes and methods should be. But let's just think a little -- first of all how would we model our game program in terms of objects? It seems like a player should be an object. We know that the Roll, and DIE game can have different variations, with different end game conditions and different-sided dice. Maybe we can model the game itself as an object.

> **Exercise**
> Before moving on, take a look at the skeleton code under `exercises/roll_and_die_oop.rb` and see if you can complete the `RollAndDie` class

```ruby
class RollAndDie
  def initialize(num_dice_sides, win_num, lose_num, player)
    @num_dice_sides = num_dice_sides
    @win_num = win_num
    @lose_num = lose_num
    @player = player
  end

  def roll_dice
    Random.rand(@num_dice_sides) + 1
  end

  def game_end?(num)
    if num == @win_num
      return @player.win_game
    elsif num == @lose_num
      return @player.lose_game
    end
  end

  def play
    loop do
      num = roll_dice
      puts "#{@player.name} rolled #{num}"
      break if game_end?(num)
    end
  end
end
```

You see that our `RollAndDie` object needs to be initialized with a player, in the last argument. The way we want to instantiate the object is something like this:

```ruby
# assume we have defined a Player class
player = Player.new("Jun Qi", "...", ";(")

game = RollAndDie.new(6, 6, 4, player)
game.play

puts player.wins
puts player.losses
```

Think about how you would write the `Player` object. What attributes would it need? Methods? We also want to track the number of wins and losses the player has.

> **Exercise**
> Before moving on, take a look at `exercises/player.rb` and see if you can complete the `Player` class
> Note that we are calling the `win_game`, `lose_game` and `name` methods on the player inside the `RollAndDie` class

```ruby
class Player
  # here we use default arguments for win_msg and lose_msg
  def initialize(name, win_msg = "You win!", lose_msg = "You lose!")
    @name = name
    @win_msg = win_msg
    @lose_msg = lose_msg
    @wins = 0
    @losses = 0
  end

  def win_game
    puts @win_msg
    @wins += 1
    true
  end

  def lose_game
    puts @lose_msg
    @losses += 1
    true
  end

  def name
    @name
  end

  def wins
    @wins
  end

  def losses
    @losses
  end
end
```

Finally, because we wrote our classes in two different files, we need to import the code from one file to another. We use the `require_relative` function for this. Add this to `exercises/roll_and_die_final.rb`, at the top of the file:

```ruby
require_relative './roll_and_die_oop.rb'
require_relative './player.rb'

# stuff...
```

There should be some code below that allows you to test your classes. Try to run your program, change things, play around!

Congratulations on finishing Ruby 101!
