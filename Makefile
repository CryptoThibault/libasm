NAME = prog
LIBNAME = libasm.a
MAIN = main.c
SRCS = ft_strlen.asm #ft_strcpy.asm ft_strcmp.asm \
		ft_write.asm ft_read.asm ft_strdup.asm

CC = cc
CFLAGS = -Wall -Wextra -Werror
NASM = nasm
NASMFLAGS = -f elf64

OBJECTS = $(SRCS:.asm=.o)

%.o: %.asm
	$(NASM) $(NASMFLAGS) $< -o $@

$(LIBNAME): $(OBJECTS)
	ar rcs $@ $(OBJECTS)

$(NAME): $(LIBNAME) $(MAIN)
	$(CC) $(CFLAGS) $(MAIN) $(LIBNAME) -o $(NAME)

all: $(NAME)

clean:
	rm -f $(OBJECTS)

fclean: clean
	rm -f $(LIBNAME) $(NAME)

re: fclean all