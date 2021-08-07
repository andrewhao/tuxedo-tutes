----------------------------- MODULE HelloWorld -----------------------------
EXTENDS TLC, Integers

(* --algorithm HelloWorld
variables x \in 5..10000;
begin 
  A:
    print {"Hello", "World"}
end algorithm; *)


\* BEGIN TRANSLATION (chksum(pcal) = "6aa8dd68" /\ chksum(tla) = "cf735deb")
VARIABLES x, pc

vars == << x, pc >>

Init == (* Global variables *)
        /\ x \in 5..10000
        /\ pc = "A"

A == /\ pc = "A"
     /\ PrintT({"Hello", "World"})
     /\ pc' = "Done"
     /\ x' = x

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == A
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Fri Aug 06 21:24:37 PDT 2021 by andrewhao
\* Created Fri Aug 06 21:15:54 PDT 2021 by andrewhao
