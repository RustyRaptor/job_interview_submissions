# Ziad Arafat
CC = clang++
FLAGS = -O3 -Wextra -Wall -pedantic -Weffc++ -std=c++23
NAME = invert_lines
RUN_ARGS = ""
TEST_ARGS = ""
CPPFLAGS = `llvm-config --cppflags $(LLVM_MODULES)`
LDFLAGS = `llvm-config --ldflags $(LLVM_MODULES)`
LIBS = `llvm-config --libs $(LLVM_MODULES)`
SOURCES = `find -name "*.cpp" -print0`

# Entry point target
all: test
	COMPILE="SUCCESS!!!"

test: memcheck.result
	./$(NAME) $(TEST_ARGS)

memcheck.result: $(NAME)
	valgrind ./$(NAME) -s > memcheck.result

$(NAME): *.o
	$(CC) *.o $(LDFLAGS) $(FLAGS) $(LIBS) -o $(NAME)

*.o: *.cpp *.h check.result
	find -name '*.cpp' -print0 | xargs -0 $(CC) $(FLAGS) -c $(CPPFLAGS)

clean:
	rm -f $(NAME) *.o *.result

run:
	./$(NAME) $(RUN_ARGS)

check.result: *.cpp *.h
	cppcheck *.cpp *.h > check.result
	clang-tidy *.cpp *.h >> check.result
