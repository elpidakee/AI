% orismos IS

orismos(A,B,C,MaxA,MaxB,MaxC):-
	retractall(counters(_,_,_,_,_,_)),
	assert(counters(A,B,C,MaxA,MaxB,MaxC)).



printState:-
	counters(A,B,C,MaxA,MaxB,MaxC),
	format('~nI katastasi einai i parakatw'),
	format('~ncounter A=~d (max= ~d)',[A,MaxA]),
	format('~ncounter B=~d (max= ~d)',[B,MaxB]),
	format('~ncounter C=~d (max= ~d)',[C,MaxC]),
	format('~n------------------------------~n').



readState:-
	format('Times gia counter A:~n'),
	format('Max Posotita :'),read(MaxA),
	((MaxA>=0); (format('Edoses arnitiki poostota'),false)),
	format('Posotita:'),read(A),
	((A>=0, A=<MaxA); (format('Posotita ektos oriwn'),false)),

	format('Times gia counter B:~n'),
	format('Max Posotita :'),read(MaxB),
	((MaxB>=0); (format('Edoses arnitiki poostota'),false)),
	format('Posotita:'),read(B),
	((B>=0, B=<MaxB); (format('Posotita ektos oriwn'),false)),

	format('Times gia counter C:~n'),
	format('Max Posotita :'),read(MaxC),
	((MaxC>=0); (format('Edoses arnitiki poostota'),false)),
	format('Posotita:'),read(C),
	((C>=0, C=<MaxC); (format('Posotita ektos oriwn'),false)),
	orismos(A,B,C,MaxA,MaxB,MaxC).

%metafora 
move(K):-
counters(A,B,C,MA,MB,MC),
(

	(
		(K==1),
		format('Metafora apo A se B ~n'),
		changevalues(A,B,MB,NA,NB),
		NC is C

	);
	(
		(K==2),
		format('Metafora apo A se C ~n'),
		changevalues(A,C,MC,NA,NC),
		NB is B
	);
	(
		(K==3),
		format('Metafora apo B se C ~n'),
		changevalues(B,C,MC,NB,NC),
		NA is A
	);
	(
		(K==4),
		format('Metafora apo C se A ~n'),
		changevalues(C,A,MA,NC,NA),
		NB is B
	);
	(
		(K==5),
		format('Metafora apo C se B ~n'),
		changevalues(C,B,MB,NC,NB),
		NA is A
	)
),
orismos(NA,NB,NC,MA,MB,MC),
printState.


changevalues(A,B,MaxN,NA,NB):-
 (
	(A >= MaxN-B,   % 
	NA is A-(MaxN-B),	NB is MaxN);
	(
	A < MaxN-B,   % 
	NA is 0,NB is B + A  )
 ).



%mia 
mialysi:-
	orismos(10,0,0,10,7,3),
	printState,
	move(1),move(3),
	move(4),move(3),move(4),move(3),
	move(1),move(3),move(4).















