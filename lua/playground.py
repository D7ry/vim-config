
def main():
    print("hello world!")

def this_is_a_function(information: dict) -> int:
    pass

class Foo:
    def __init__(self, name: str):
        self.__name: str = name

    def get_name(self) -> str:
        return self.__name

    def my_func(self, v1: str, v2: int) -> bool:
        return False

def this_this_another_function(another_dict: dict) -> int:
    pass

def this_this_another_function(another_dict: dict) -> int:
    """
    this is a function.
    """
    print(another_dict)

    foo = Foo("something")
    return 0


def subroutine(input: float):
    print(f"subroutine has received value {input}")


# github copilot isn't working here...
if __name__ == "__main__":
    main()  # call main here.
    this_is_a_function(5)
    this_this_another_function(8)
    EOFError
