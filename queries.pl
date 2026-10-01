 %=========================================
 %Simpsons Family Knowledge Base
%=========================================

%---------- Gender Facts ----------

male(abraham).
male(herb).
male(homer).
male(clancy).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).


%---------- Parent Facts ----------

parent(abraham, herb).
parent(mona, herb).

parent(abraham, homer).
parent(mona, homer).

parent(clancy, marge).
parent(jackie, marge).

parent(clancy, patty).
parent(jackie, patty).

parent(clancy, selma).
parent(jackie, selma).

parent(homer, bart).
parent(marge, bart).

parent(homer, lisa).
parent(marge, lisa).

parent(homer, maggie).
parent(marge, maggie).

parent(selma, ling).




%=========================================
%Rules
%=========================================

father(X, Y) :-
    male(X),
    parent(X, Y).

mother(X, Y) :-
    female(X),
    parent(X, Y).

son(X, Y) :-
    male(X),
    parent(Y, X).

daughter(X, Y) :-
    female(X),
    parent(Y, X).

brother(X, Y) :-
    male(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

sister(X, Y) :-
    female(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

grandfather(X, Y) :-
    male(X),
    parent(X, Z),
    parent(Z, Y).

aunt(X, Y) :-
    female(X),
    parent(P, Y),
    sister(X, P).

uncle(X, Y) :-
    male(X),
    parent(P, Y),
    brother(X, P).

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    parent(G, P1),
    parent(G, P2),
    P1 \= P2,
    X \= Y.

ancestor(X, Y) :-
    parent(X, Y).


ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).



