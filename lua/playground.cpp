include <stdio>
std::string i_take_numbers(int num) {
    return "haha"
}

int gg() {
    i_take_numbers(55);
    gg();
    std::cout << "hello world" << std::endl;
    return 99;
}

std::string scope_testing(int i) {
    {
        std::cout << "this is in this scope" << std::endl;
    }
    std::vector<std::string> vecstr;
    for (auto& i : vecstr) {
        std::cout << i << std::endl;
    }
    
}



int gg2() {
    return 99.f
}
