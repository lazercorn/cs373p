clean:
	cd examples; make --no-print-directory clean
	@echo
	cd exercises; make --no-print-directory clean
	@echo
	cd quizzes; make --no-print-directory clean

config:
	git config -l

init:
	touch README
	git init
	git add README
	git commit -m 'first commit'
	git remote add origin git@github.com:gpdowning/cs373p.git
	git push -u origin master

pull:
	@rsync -r -t -u -v --delete              \
    --include "Hello.py"                     \
    --include "Assertions.py"                \
    --include "UnitTests1.py"                \
    --include "UnitTests2.py"                \
    --include "UnitTests3.py"                \
    --include "Coverage1.py"                 \
    --include "Coverage2.py"                 \
    --include "Coverage3.py"                 \
    --include "Exceptions.py"                \
    --include "Types.py"                     \
    --include "Operators.py"                 \
    --include "StackVsHeap.py"               \
    --include "Iteration.py"                 \
    --include "Iterables.py"                 \
    --include "Lambdas.py"                   \
    --include "Generators.py"                \
    --exclude "*"                            \
    ../../../examples/python/ examples
	@rsync -r -t -u -v --delete              \
    --include "IsPrime1.py"                  \
    --include "IsPrime1T.py"                 \
    --include "IsPrime2.py"                  \
    --include "IsPrime2T.py"                 \
    --include "Factorial.py"                 \
    --include "FactorialT.py"                \
    --include "RMSE.py"                      \
    --include "RMSEt.py"                     \
    --include "Collatz.py"                   \
    --include "CollatzT.py"                  \
    --include "Collatz2.py"                  \
    --include "Collatz2T.py"                 \
    --exclude "*"                            \
    ../../../exercises/python/ exercises
	@rsync -r -t -u -v --delete              \
    --include "Quiz3.py"                     \
    --include "Quiz4.py"                     \
    --include "Quiz5.py"                     \
    --include "Quiz6.py"                     \
    --exclude "*"                            \
    ../../quizzes/ quizzes

push:
	make clean
	@echo
	git add .travis.yml
	git add examples
	git add exercises
	git add makefile
	git add quizzes
	git commit -m "another commit"
	git push
	git status

status:
	make clean
	@echo
	git add examples
	git add exercises
	git add quizzes
	git branch
	git remote -v
	git status

sync:
	@echo `pwd`
	@rsync -r -t -u -v --delete \
    --include "makefile"        \
    --exclude "*"               \
    . downing@$(CS):cs/cs373/github/python/
	@echo
	cd examples; make sync
	@echo
	cd exercises; make sync
	@echo
	cd quizzes; make sync

test:
	cd examples; make --no-print-directory test
	@echo
	cd exercises; make --no-print-directory test
	@echo
	cd quizzes; make --no-print-directory test

versions:
	cd examples; make --no-print-directory versions
	@echo
	cd exercises; make --no-print-directory versions
	@echo
	cd quizzes; make --no-print-directory versions
