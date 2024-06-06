appendQ([], [], R) :- R = [], !.
appendQ(X, [], R) :- R = X, !.
appendQ([], [YH|YT], [YH|RT]) :- appendQ([], YT, RT), !.
appendQ([XH|XT], Y, [XH|RT]) :- appendQ(XT, Y, RT), !.
