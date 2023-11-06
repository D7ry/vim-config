def main():
    print("hello world!")
    print("Gg")


GLOBAL_DICT: dict = {"key": "val", "key2": "val2"}


def get_fibbonacci(i: int) -> int:
    # TODO: refactor this function!
    if i == 0:
        return 0
    elif i == 1:
        return 1
    else:
        return get_fibbonacci(i - 1) + get_fibbonacci(i - 2)


def this_is_a_function(argument: int):
    print(f"this_is_a_function has received value {argument}")


class Foo:
    class Foo_inner:
        def __init__(self, name: str):
            self.__name: str = name

        def fib(i: int) -> int:
            def helper()
            if i == 0:
                return 0

        def get_name(self) -> str:
            return self.__name

        def my_func(self, v1: str, v2: int) -> bool:
            return False

        def get_fibbonacci(i: int) -> int:
            if i == 0:
                return 0
            elif i == 1:
                return 1
            else:
                return get_fibbonacci(i - 1) + get_fibbonacci(i - 2)

    def __init__(self, name: str):
        self.__name: str = name

    def fib(i: int) -> int:
        if i == 0:
            return 0

    def get_name(self) -> str:
        return self.__name

    def my_func(self, v1: str, v2: int) -> bool:
        return False

    def get_fibbonacci(i: int) -> int:
        if i == 0:
            return 0
        elif i == 1:
            return 1
        else:
            return get_fibbonacci(i - 1) + get_fibbonacci(i - 2)







def this_this_another_function(another_dict: dict) -> int:
    """ """
    pass


def bad_func() -> str:
    return 5


def take_string(s: str):
    print(s)


take_string(5)


def subroutine(argument: float):
    print(f"subroutine has received value {input}")


def gg():
    pass

    # github copilot isn't working here...


if __name__ == "__main__":
    main()  # call main here.
    this_is_a_function(5)
    this_this_another_function(8)
    EOFError
