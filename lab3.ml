(* 
                              CS51 Lab 3
                    Polymorphism and record types
 *)


(*
Objective:

In this lab, you'll exercise your understanding of polymorphism and
record types. Some of the problems extend those from Lab 2, but we'll
provide the necessary background code from that lab. *)

(*======================================================================
Part 1: Records and tuples

Records and tuples provide two different ways with which to package
together data. They differ in whether their components are selected by
name or by position, respectively.

Consider a point in Cartesian (x-y) coordinates. A point is specified
by its x and y values, which we'll take to be floats. We can package
these together as a pair (a 2-tuple), as in the following data type
definition: *)

type point_pair = int * int ;;

(* Then, we can add two points (summing their x and y coordinates
separately) with the following function:

let add_point_pair (p1 : point_pair) (p2 : point_pair) : point_pair =
  let x1, y1 = p1 in
  let x2, y2 = p2 in
  (x1 + x2, y1 + y2) ;;

........................................................................
Exercise 1: 

It might be nicer to deconstruct the points in a single match, rather
than the two separate matches in the two let expressions. Reimplement
add_point_pair to use a single pattern match in a single let
expression.
......................................................................*)

let add_point_pair (p1 : point_pair) (p2 : point_pair) : point_pair =
  failwith "add_point_pair not impemented" ;;

(* Analogously, we can define a point by using a record to package up
the x and y coordinates. *)

type point_recd = {x : int; y : int} ;;
                   
(*......................................................................
Exercise 2: 

Implement a function add_point_recd to add two points of type
point_recd and returning a point _rec as well.
......................................................................*)

let add_point_recd =
  fun _ -> failwith "add_point_recd not implemented" ;;

(* Recall the dot product from Lab 2. The dot product of two points
(x1, y1) and (x2, y2) is the sum of the products of their x and y
coordinates.

........................................................................
Exercise 3: Write a function dot_product_pair to compute the dot
product for points encoded as the point_pair type.
......................................................................*)

let dot_product_pair (p1 : point_pair) (p2 : point_pair) : int =
  failwith "dot_product_pair not implemented" ;;

(*......................................................................
Exercise 4: Write a function dot_product_recd to compute the dot
product for points encoded as the point_recd type.
......................................................................*)

let dot_product_recd (p1 : point_recd) (p2 : point_recd) : int =
  failwith "dot_product_recd not implemented" ;;

(* Converting between the pair and record representations of points

You might imagine that the two representations have
different advantages, such that two libraries, say, might use
differing types for points. In that case, we may want to have
functions to convert between the two representations.

........................................................................
Exercise 5: Write a function point_pair_to_recd that converts a
point_pair to a point_recd.
......................................................................*)

let point_pair_to_recd =
  fun _ -> failwith "point_pair_to_recd not implemented" ;;

(*......................................................................
Exercise 6: Write a function point_recd_to_pair that converts a
point_recd to a point_pair.
......................................................................*)

let point_recd_to_pair =
  fun _ -> failwith "point_recd_to_pair not implemented" ;;
   
(*======================================================================
Part 2: A simple database of records

A college wants to store student records in a simple database,
implemented as a list of individual course enrollments. The
enrollments themselves are implemented as a record type, called
"enrollment", with string fields labeled "name" and "course" and an
integer student id number labeled "id". An appropriate type might be:
*)

type enrollment = { name : string;
                    id : int;
                    course : string } ;;

(* Here's an example of a list of enrollments. *)

let college = 
  [ { name = "Pat";   id = 603858772; course = "cs51" };
    { name = "Pat";   id = 603858772; course = "expos20" };
    { name = "Kim";   id = 482958285; course = "expos20" };
    { name = "Kim";   id = 482958285; course = "cs20" };
    { name = "Sandy"; id = 993855891; course = "ls1b" };
    { name = "Pat";   id = 603858772; course = "ec10b" };
    { name = "Sandy"; id = 993855891; course = "cs51" };
    { name = "Sandy"; id = 482958285; course = "ec10b" }
  ] ;;

(* In the following exercises, you'll want to avail yourself of the
List module functions, writing the requested functions in higher-order
style rather than handling the recursion yourself.

........................................................................
Exercise 7: Define a function called transcript that takes an
enrollment list and returns a list of all the enrollments for a given
student as specified with his or her id.

For example: 

    # transcript college 993855891 ;;
    - : enrollment list =
    [{name = "Sandy"; id = 993855891; course = "ls1b"};
     {name = "Sandy"; id = 993855891; course = "cs51"}]
......................................................................*)

let transcript (enrollments : enrollment list)
               (student : int)
             : enrollment list =
  failwith "transcript not implemented" ;;
  
(*......................................................................
Exercise 8: Define a function called ids that takes an enrollment
list and returns a list of all the id numbers in that enrollment list,
eliminating any duplicates. The sort_uniq function from the List
module may be useful here.

For example:

    # ids college ;;
    - : int list = [482958285; 603858772; 993855891]
......................................................................*)

let ids (enrollments: enrollment list) : int list =
  failwith "ids not implemented" ;;
  
(*......................................................................
Exercise 9: Define a function called verify that determines whether all
the entries in an enrollment list for each of the ids appearing in the
list have the same name associated.

For example: 
# verify college ;;
- : bool = false
......................................................................*)

let verify (enrollments : enrollment list) : bool =
  failwith "verify not implemented" ;;

(*======================================================================
Part 3: Polymorphism

........................................................................
Exercise 10: In Lab 2, you implemented a function zip that takes two
lists and "zips" them together into a list of pairs. Here's a possible
implementation of zip:

let rec zip (x : int list) (y : int list) : (int * int) list =
  match x, y with
  | [], [] -> []
  | xhd :: xtl, yhd :: ytl -> (xhd, yhd) :: (zip xtl ytl) ;;

As implemented, this function works only on integer lists. Revise your
solution to operate polymorphically on lists of any type. What is the
type of the result? Did you provide full typing information in the
first line of the definition? (As usual, for the time being, don't
worry about explicitly handling the anomalous case when the two lists
are of different lengths.)
......................................................................*)

let zip =
  fun _ -> failwith "zip not implemented" ;;

(*......................................................................
Exercise 11: Partitioning a list -- Given a boolean function, say

    fun x -> x mod 3 = 0

and a list of elements, say, 

    [3; 4; 5; 10; 11; 12; 1]

we can partition the list into two lists, the list of elements
satisfying the boolean function ([3; 12]) and the list of elements
that don't ([4; 5; 10; 11; 1]).

The function "partition" partitions its list argument in just this
way, returning a pair of lists. Here's an example:

    # partition (fun x -> x mod 3 = 0) [3; 4; 5; 10; 11; 12; 1] ;;
    - : int list * int list = ([3; 12], [4; 5; 10; 11; 1])

What is the type of the partition function, keeping in mind that it
should be as polymorphic as possible?

Now write the function.
......................................................................*)
   
let partition =
  fun _ -> failwith "partition not implemented" ;;

(*......................................................................
Exercise 12: We can think of function application itself as a
higher-order function (!). It takes two arguments -- a function and
its argument -- and returns the value obtained by applying the
function to its argument. In this exercise, you'll write this
function, called "apply". You might use it as in the following examples:

    # apply pred 42 ;;
    - : int = 41
    # apply (fun x -> x ** 2.) 3.14159 ;;
    - : float = 9.86958772809999907

(You may think such a function isn't useful, since we already have an
even more elegant notation for function application, as in

    # pred 42 ;;
    - : int = 41
    # (fun x -> x ** 2.) 3.14159 ;;
    - : float = 9.86958772809999907

But we'll see a quite useful operator that works similarly -- the
backwards application operator -- in Chapter 11 of the textbook.)

Start by thinking about the type of the function. We'll assume it
takes its two arguments curried, that is, one at a time.

What is the most general (polymorphic) type for its first argument
(the function to be applied)?

What is the most general type for its second argument (the argument to
apply it to)?

What is the type of its result?

Given the above, what should the type of the function "apply" be?

Now write the function.
......................................................................*)

let apply =
  fun _ -> failwith "apply not implemented" ;;
