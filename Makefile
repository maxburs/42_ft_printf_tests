NAME = ft_printf.out

CFLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): driver.o turn_in/libftprintf.a
	gcc $(CFLAGS) -o $@ $^

%.o: %.c
	gcc $(CFLAGS) -c -I ./turn_in/ -I ./turn_in/libft/ -o $@ $<

turn_in/libftprintf.a: force
	cd turn_in && $(MAKE) $(MAKE_ARGS)

force:
	@true

clean:
	rm -f driver.o
	cd turn_in && $(MAKE) fclean
fclean: clean
	rm -f $(NAME)
re: fclean all

.PHONY: all clean fclean re
